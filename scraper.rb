require 'wombat'
require 'scraperwiki'

class BuergerbueroScraper
  include Wombat::Crawler

  base_url "http://web.archive.org"
  path "/web/20131226080706/http://www.muenster.de/stadt/buergeramt/mobil-wartezeit.shtml"

  wartezeit 'xpath=//*[@id="seite"]/div[2]/p[2]/strong'
  wartende 'xpath=//*[@id="seite"]/div[2]/p[1]/strong'
  naechste_nummer 'xpath=//*[@id="seite"]/div[2]/p[3]/strong'
end
ScraperWiki.save_sqlite(["naechste_nummer"], BuergerbueroScraper.new.crawl)
