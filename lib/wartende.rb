require 'data_mapper'
class Wartende
  include DataMapper::Resource

  property :id, Serial
  property :wartezeit,      String    # A varchar type string, for short strings
  property :warteende,      String    # A varchar type string, for short strings
  property :naechste_nummer,      String    # A varchar type string, for short strings
  property :aktualisiert, DateTime  # A DateTime, for any date you might like.
  property :created_at, DateTime  # A DateTime, for any date you might like.
end
DataMapper.finalize
