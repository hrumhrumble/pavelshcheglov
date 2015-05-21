require 'digest/sha2'
class ApplicationMailer < ActionMailer::Base
  default "Message-ID"=>"#{Digest::SHA2.hexdigest(Time.now.to_i.to_s)}@pavelshcheglov.com"
  default from: "info@pavelshcheglov.com"
end
