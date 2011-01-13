c = Cabinet::Local.new(File.join(File.dirname(__FILE__), '..', 'tmp'))
f = 'feed.xml'

get '/' do
  c.put(f, XML.new(open('http://feeds.feedburner.com/MlbTradeRumors')).transform) if c.modified(f) + 600 <= Time.now

  content_type 'text/xml', :charset => 'utf-8'
  c.get(f)
end

get '/reload' do
  c.put(f, XML.new(open('http://feeds.feedburner.com/MlbTradeRumors')).transform)
end