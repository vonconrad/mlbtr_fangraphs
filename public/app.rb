get '/' do
  content_type 'text/xml', :charset => 'utf-8'
  XML.new(open('http://feeds.feedburner.com/MlbTradeRumors')).transform
end
