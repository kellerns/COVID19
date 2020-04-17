class COVID19::CLI
  BASE_PATH = "https://www.worldometers.info/coronavirus"

  def call
    puts "Hello, here you can find up-to-date information on cases of COVID-19"
    COVID19::Scraper.scrape_country
    list_options
    main_menu
    goodbye
  end

  def list_options
    puts <<-DOC.gsub /^\s*/, ''
      For total worldwide cases, type 'cases'.
      For total worldwide deaths, type 'deaths'.
      For total worldwide recoveries, type 'recoveries'.
      For total worldwide active cases, type 'active'.
      To search these statistics per country, type 'country'.
      To see these options again, type 'options'.
      To exit, type 'exit'.
    DOC
  end

  def main_menu
    puts "What would you like to know?"
    input = nil
    while input != "exit"
      input = gets.strip.downcase
      case input
        when "cases"
          puts "There have been <this_number> confirmed COVID-19 cases worldwide."
        when "deaths"
          puts "There have been <this_number> COVID-19-related deaths worldwide."
        when "recoveries"
          puts "There have been <this_number> of total COVID-19 recoveries worldwide."
        when "active"
          puts "There are currently <this_number> active COVID-19 cases worldwide."
        when "country"
          puts "This section will prompt the user to type in a country name, then repeat the above menu for the specific country."
        when "options"
          list_options
      end
    end
  end

  def goodbye
    puts "Thank you for visiting, stay safe <3"
  end

end
