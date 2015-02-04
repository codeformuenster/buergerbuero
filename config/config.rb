require_relative "initialize"
require_relative 'buerger_buero_settings'
require 'dotenv'
Dotenv.load
require "./config/environments/#{ENV["RACK_ENV"] || "development"}.rb"

