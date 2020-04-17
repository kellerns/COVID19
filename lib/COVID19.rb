require 'open-uri'
require 'pry'
require 'nokogiri'

require "./lib/COVID19/version"
require './lib/COVID19/stats'
require './lib/COVID19/cli'
require './lib/COVID19/country'
require './lib/COVID19/scraper'

module COVID19
  class Error < StandardError; end
  # Your code goes here...
end
