require 'sinatra/base'
require "sinatra"
require 'data_mapper'
require './lib/buerger_buero/waiting_citizen'
require './config/config'

module Buergerbuero
  class App < Sinatra::Base
    before do
      content_type :json
      headers 'Access-Control-Allow-Origin' => '*',
        'Access-Control-Allow-Methods' => ['OPTIONS', 'GET']
    end

    DataMapper::setup(:default, ENV["DATABASE"])
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
