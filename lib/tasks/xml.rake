# for details info visit xml.yandex.ru
require 'nokogiri'

namespace :xml do
  key = ENV["yandex_xml_api_key"]
  user = ENV["yandex_xml_user"]
  region = "213" # http://search.yaca.yandex.ru/geo.c2n

  desc 'get positions data from xml.yandex.ru'
  task :positions => :environment do
    sites = Site.all
    puts 'getting positions...'
    sites.each do |site|
      site.queries.each do |query|
        xml_data = `curl -s "https://xmlsearch.yandex.ru/xmlsearch?user=#{user}&key=#{key}&query=#{CGI.escape(query.word)}&lr=#{region}&l10n=ru&sortby=rlv&filter=strict&groupby=attr%3D%22%22.mode%3Dflat.groups-on-page%3D100.docs-in-group%3D1"`
        result = Nokogiri::XML(xml_data)
        position = 999

        result.xpath("//url").each_with_index do |url, index|
          if url.content =~ /#{site.url}/
            position = index + 1
            break
          else
            position = 999
          end
        end
        query.positions.create(place: position)
      end
    end

  end
end

