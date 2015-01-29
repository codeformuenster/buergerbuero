require 'sinatra/base'
require "sinatra"
require 'sinatra/cross_origin'
require 'scraperwiki'


module Buergerbuero
  class App < Sinatra::Base
    before do
      content_type :json
    end

    get "/latest" do
      latest.to_json
    end

    get "/" do
      all.to_json
    end

    helpers do
      def latest
        ScraperWiki::select('wartezeit, warteende, naechste_nummer, aktualisiert from swdata where aktualisiert <> "" order by aktualisiert desc limit 1').first
      end

      def all
        ScraperWiki::select('wartezeit, warteende, naechste_nummer, aktualisiert from swdata where aktualisiert <> "" order by aktualisiert')
      end
    end
  end
end
