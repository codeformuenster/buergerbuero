require 'mechanize'
require 'scraperwiki'

class BuergerbueroScraper

  def initialize
    base_url = "http://web.archive.org"
    path = "/web/20131226080706/http://www.muenster.de/stadt/buergeramt/mobil-wartezeit.shtml"
    @url = base_url + path
  end

  def to_json
    {
      wartezeit: wartezeit,
      warteende: warteende,
      naechste_nummer: naechste_nummer,
    }
  end

  def agent
    @agent ||= Mechanize.new
  end

  def page
    @page ||= agent.get(@url)
  end

  def wartezeit
    page.search('//*[@id="seite"]/div[2]/p[2]/strong').text
  end

  def warteende
    page.search('//*[@id="seite"]/div[2]/p[1]/strong').text
  end

  def naechste_nummer
    page.search('//*[@id="seite"]/div[2]/p[3]/strong').text
  end
end
ScraperWiki.save_sqlite([:naechste_nummer], BuergerbueroScraper.new.to_json)
