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
      To return to the country information page, type 'exit'
    DOC
  end

  def main_menu
    puts "What would you like to know?"
    input = nil
    while input != "exit"
      input = gets.strip.downcase
      case input
        when "cases"
          world_cases = COVID19::Country.find_by_name('World')
          puts "There have been #{world_cases.cases} confirmed COVID-19 cases worldwide."
        when "deaths"
          world_deaths = COVID19::Country.find_by_name('World')
          puts "There have been #{world_deaths.deaths} COVID-19-related deaths worldwide."
        when "recoveries"
          world_recoveries = COVID19::Country.find_by_name('World')
          puts "There have been #{world_recoveries.recoveries} of total COVID-19 recoveries worldwide."
        when "active"
          world_active = COVID19::Country.find_by_name('World')
          puts "There are currently #{world_active.active} active COVID-19 cases worldwide."
        when "country"
          puts "About which country would you like more information?"
          country_input = nil
          country_input = gets.strip
          while country_input != "exit"
            puts "you chose #{country_input}"
            country_menu(country_input)
          end
          list_options
        when "options"
          list_options
      end
    end
  end

  def country_menu(c_input)
      puts <<-DOC.gsub /^\s*/, ''
        For total cases in #{c_input}, type 'cases'.
        For total deaths in #{c_input}, type 'deaths'.
        For total recoveries in #{c_input}, type 'recoveries'.
        For total active cases in #{c_input}, type 'active'.
        To select a different country, type 'country'.
        To exit, type 'exit'.
      DOC
      my_country = COVID19::Country.find_by_name(c_input)

      puts "What would you like to know about #{c_input}?"
      input = nil
      while input != "exit"
        input = gets.strip.downcase
        case input
          when "cases"
            puts "There have been #{my_country.cases} confirmed COVID-19 cases in #{my_country.name}."
          when "deaths"
            puts "There have been #{my_country.deaths} COVID-19-related deaths in #{my_country.name}."
          when "recoveries"
            puts "There have been #{my_country.recoveries} of total COVID-19 recoveries in #{my_country.name}."
          when "active"
            puts "There are currently #{my_country.active} active COVID-19 cases in #{my_country.name}."
          when "country"
            puts "Which country would you like more information about?"
            country_input = nil
            country_input = gets.strip
            while country_input != "exit"
              country_menu(country_input)
            end
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
