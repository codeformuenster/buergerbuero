require 'chronic_duration'

module BuergerBuero
  class Duration
    def initialize(text)
      @seconds = parse_text(text)
    end

    def to_seconds
      @seconds
    end

    def englishing(text)
      text.gsub(/(Minuten)|(Stunden)/,{"Minuten" => "Minutes", "Stunden" => "Hours"})
    end

    def parse_text(text)
      @seconds ||= ChronicDuration.parse(englishing(text))
    end
  end
end
