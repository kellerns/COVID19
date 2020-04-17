require 'open-uri'
require 'pry'
require 'nokogiri'

require "./lib/COVID19/version"
require './lib/COVID19/stats'
require './lib/COVID19/cli'

module COVID19
  class Error < StandardError; end
  # Your code goes here...
end
