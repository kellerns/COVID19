class COVID19::Country
  attr_accessor :name, :cases, :deaths, :recoveries, :active

  def self.scrape_country
    page = Nokogiri::HTML(open(https://worldometers.info/coronavirus))
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
    countries
  end

  def self.scrape_date
  end
end
