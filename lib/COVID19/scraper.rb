require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  def self.scrape_country_page(country_name)
    page = Nokogiri::HTML(open(https://www.worldometers.info/coronavirus)
    countries = []
    page.xpath("//tr").each do |country|
      c_name = country.css("td")[0].text
      c_cases = country.css("td")[1].text
      c_deaths = country.css("td")[3].text
      c_recoveries = country.css("td")[5].text
      c_active = country.css("td")[6].text
      country_info = {:name => c_name, :cases => c_cases, :deaths => c_deaths, :recoveries => c_recoveries, :active => c_active}
      countries << country_info
    end
    binding.pry
    countries
  end
