require 'wombat'
require 'data_mapper'
require './lib/wartende'

module BuergerBuero
  class Scraper

    def initialize
      DataMapper::setup(:default, "sqlite3:///srv/buerberbuero.db")
      DataMapper.auto_upgrade!
    end

    def save
      data = Crawler.new.crawl
      if data["aktualisiert"]
        wartende = ::Wartende.first_or_create({aktualisiert: data["aktualisiert"]}, data )
        p wartende.inspect
      end
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
      DateTime.parse(text.gsub("Letzte Aktualisierung:\n","")) if text
    end
  end
end
