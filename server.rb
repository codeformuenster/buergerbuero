require 'sinatra/base'
require "sinatra"
require 'sinatra/cross_origin'
require 'data_mapper'
require './lib/wartende'

module Buergerbuero
  class App < Sinatra::Base
    before do
      content_type :json
    end

    DataMapper::setup(:default, "sqlite3:///data/buerberbuero.db")

    get "/latest" do
      latest.to_json
    end

    get "/" do
      all.to_json
    end

    helpers do
      def latest
        Wartende.all(order: [ :aktualisiert.desc ], limit: 1).first
      end

      def all
        Wartende.all(order: [ :aktualisiert.desc ])
      end
    end
  end
end