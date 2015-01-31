require 'wombat'
require_relative 'duration'

module BuergerBuero
  class Crawler
    include Wombat::Crawler

    base_url "http://www.muenster.de"
    path "/stadt/buergeramt/mobil-wartezeit.shtml"

    wartezeit 'xpath=//*[@id="seite"]/div[2]/p[2]/strong'
    waiting_duration 'xpath=//*[@id="seite"]/div[2]/p[2]/strong' do |text|
      Duration.new(text).to_seconds
    end
    warteende 'xpath=//*[@id="seite"]/div[2]/p[1]/strong'
    naechste_nummer 'xpath=//*[@id="seite"]/div[2]/p[3]/strong'
    aktualisiert 'xpath=//*[@id="seite"]/div[2]/p[4]' do |text|
      DateTime.parse(text.gsub("Letzte Aktualisierung:\n","")) if text
    end
  end
end
