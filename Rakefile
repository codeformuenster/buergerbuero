require 'dotenv/tasks'
require './lib/buerger_buero'

task default: %w[scraper:scrape]

namespace :setup do
  desc "Setup, will overwrite .env"
  task :sqlite do
    File.write('.env', "DATABASE=sqlite://#{Dir.pwd}/buergerbuero.db")
  end

end

namespace :scraper do
  desc "Scraping"
  task :scrape do
    BuergerBuero::Scraper.new.save
  end
end
