every 1.day, :at => '2:00 am' do
  rake 'xml:positions'
end

every 1.day, :at => '6:00 am' do
  rake 'mail:me'
end
