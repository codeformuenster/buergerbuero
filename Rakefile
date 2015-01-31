require './lib/scraper'
task default: %w[scraper:scrape]
namespace :scraper do
  desc "Scraping"
  task :scrape do
    BuergerBuero::Scraper.new.save
  end
end
