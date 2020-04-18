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
      To exit, type 'exit'
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
          list_options
        when "deaths"
          world_deaths = COVID19::Country.find_by_name('World')
          puts "There have been #{world_deaths.deaths} COVID-19-related deaths worldwide."
          list_options
        when "recoveries"
          world_recoveries = COVID19::Country.find_by_name('World')
          puts "There have been #{world_recoveries.recoveries} of total COVID-19 recoveries worldwide."
          list_options
        when "active"
          world_active = COVID19::Country.find_by_name('World')
          puts "There are currently #{world_active.active} active COVID-19 cases worldwide."
          list_options
        when "country"
          country_input = nil
          while true
            puts "About which country would you like more information?\n(Reminder: this section is case-sensitive and in some cases there are specific countries that have a shorthand method of writing them. Review the README for more info)"
            country_input = gets.strip
            if COVID19::Country.find_by_name(country_input) || country_input == "exit"
              case country_input
                when "exit"
                  break
                else
                  country_menu(country_input)
                  break
              end
            else
              puts "Invalid country name. Make sure you entered the correct case-sensitive country name, or the correct shorthand notation for certain countries (specific countries are listed in the README)."
            end
          end
          list_options
        when "exit"
          break
        else
          puts "You have entered an invalid option, please review the menu and select another option."
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
        To return to the main menu, type 'menu'.
        To exit, type 'exit'.
      DOC
      my_country = COVID19::Country.find_by_name(c_input)

      puts "What would you like to know about #{c_input}?"
      input = nil
      while input != "exit"
        input = gets.strip.downcase
        case input
          when "cases"
            puts "There have been #{my_country.cases} confirmed COVID-19 cases in #{my_country.name}.\nWhat other information would you like about #{my_country.name}? To return to worldwide statistics, type 'exit'."
          when "deaths"
            puts "There have been #{my_country.deaths} COVID-19-related deaths in #{my_country.name}.\nWhat other information would you like about #{my_country.name}? To return to worldwide statistics, type 'exit'."
          when "recoveries"
            puts "There have been #{my_country.recoveries} of total COVID-19 recoveries in #{my_country.name}.\nWhat other information would you like about #{my_country.name}? To return to worldwide statistics, type 'exit'."
          when "active"
            puts "There are currently #{my_country.active} active COVID-19 cases in #{my_country.name}.\nWhat other information would you like about #{my_country.name}? To return to worldwide statistics, type 'exit'."
          when "menu"
            break
          when "exit"
            break
          else
            puts "You have entered an invalid option, please review the menu and select another option."
        end
      end
  end

  def goodbye
    puts "Thank you for visiting, stay safe <3"
  end

end
