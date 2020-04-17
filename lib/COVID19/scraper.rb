class COVID19::Scraper


  def self.scrape_country
    page = Nokogiri::HTML(open('https://worldometers.info/coronavirus/'))
    #binding.pry
    page.css("tbody")[0].css("tr").drop(7).each do |country|
      c_name = country.css("td")[0].text
      c_cases = country.css("td")[1].text
      c_deaths = country.css("td")[3].text
      c_recoveries = country.css("td")[5].text
      c_active = country.css("td")[6].text
      country_info = {:name => c_name, :cases => c_cases, :deaths => c_deaths, :recoveries => c_recoveries, :active => c_active}
      COVID19::Country.new(country_info)
    end
  end

end
