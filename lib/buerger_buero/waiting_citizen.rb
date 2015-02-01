require 'data_mapper'

class WaitingCitizen
  include DataMapper::Resource

  property :id, Serial
  property :wartezeit,      String    # A varchar type string, for short strings
  property :waiting_duration,      Integer# A varchar type string, for short strings
  property :warteende,      String    # A varchar type string, for short strings
  property :naechste_nummer,      String    # A varchar type string, for short strings
  property :aktualisiert, DateTime  # A DateTime, for any date you might like.
  property :created_at, DateTime  # A DateTime, for any date you might like.
end
DataMapper.finalize
