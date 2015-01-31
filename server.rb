require 'sinatra/base'
require "sinatra"
require 'sinatra/cross_origin'
require 'data_mapper'
require './lib/waiting_citizen'

module Buergerbuero
  class App < Sinatra::Base
    before do
      content_type :json
    end

    DataMapper::setup(:default, "sqlite3:///srv/buerberbuero.db")
    DataMapper.auto_upgrade!

    get "/latest" do
      latest.to_json
    end

    get "/" do
      all.to_json
    end

    helpers do
      def latest
        WaitingCitizen.all(order: [ :aktualisiert.desc ], limit: 1).first
      end

      def all
        WaitingCitizen.all(order: [ :aktualisiert.desc ])
      end
    end
  end
end
