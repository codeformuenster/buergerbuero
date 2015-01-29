require 'wombat'
require 'scraperwiki'

module BuergerBuero
  class Scraper

    def save
      ScraperWiki.save_sqlite(["naechste_nummer"], Crawler.new.crawl)
    end

  end
  class Crawler
    include Wombat::Crawler

    base_url "http://www.muenster.de"
    path "/stadt/buergeramt/mobil-wartezeit.shtml"

    wartezeit 'xpath=//*[@id="seite"]/div[2]/p[2]/strong'
    warteende 'xpath=//*[@id="seite"]/div[2]/p[1]/strong'
    naechste_nummer 'xpath=//*[@id="seite"]/div[2]/p[3]/strong'
    aktualisiert 'xpath=//*[@id="seite"]/div[2]/p[4]' do |text|
      DateTime.parse(text.gsub("Letzte Aktualisierung:\n",""))
    end
  end
end
