class XML
  attr_accessor :doc

  def initialize(str)
    self.doc = Nokogiri::XML::Document.parse(str)
  end

  def transform
    base_uri = 'http://www.fangraphs.com/players.aspx?lastname='

    doc.xpath('//xmlns:entry').each do |entry|
      article     = entry.xpath('xmlns:content').first
      article_doc = Nokogiri::HTML::DocumentFragment.parse(article.text)

      article_doc.css('a[href^="http://www.baseball-reference.com/player"]').each do |link|
        link.set_attribute('href', base_uri + link.text.gsub(/\s{2,}/, ' ').gsub(/\s/, '+'))
      end

      article_doc.css('p').last.remove

      article.content = article_doc.to_html
    end

    doc.to_xml
  end
end
