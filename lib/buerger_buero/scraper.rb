require 'data_mapper'
require_relative 'waiting_citizen'

module BuergerBuero
  class Scraper

    def initialize
      DataMapper::setup(:default, "sqlite3:///srv/buerberbuero.db")
      DataMapper.auto_upgrade!
    end

    def save
      data = Crawler.new.crawl
      if data["aktualisiert"]
        wartende = ::WaitingCitizen.first_or_create({aktualisiert: data["aktualisiert"]}, data )
        p wartende.inspect
      end
    end

  end
end