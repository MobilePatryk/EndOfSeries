class CheckIndexJob < ApplicationJob
  queue_as :default
  
  require 'capybara'
  require 'capybara/dsl'
  require 'capybara/poltergeist'
  require 'nokogiri'
  require 'nokogiri'
  include Capybara::DSL

  def perform(*args)
   init
    fill_input(args[0])
    (0..10).each do |o|
      code = get_html
      puts o
     # screenshot_now
      find_link_on_page(code,args[0],o,args[1])
     # screenshot_now  #- funkcja dostepna gdy ogarne wrzucanie plikow w public
      next_page
    end
    # Do something later
  end
  
    def init
      Capybara.default_driver = :poltergeist
        Capybara.javascript_driver = :poltergeist
        Capybara.app_host = 'https://www.google.pl'
        Capybara.register_driver :poltergeist do |app|
        Capybara::Poltergeist::Driver.new(app,
                                            phantomjs_options: ['--debug=no',
                                                                '--ignore-ssl-errors=yes',
                                                                '--ssl-protocol=TLSv1'],
                                            debug: false,
                                            js_errors: false,
                                            timeout: 90)
      end

      @session = Capybara::Session.new :poltergeist
      @session.driver.headers = {
        'Accept-Language' => 'pl',
        'User-Agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:29.0) Gecko/20100101 Firefox/30.0',
        'Accept' => 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
        'Connection' => 'keep-alive'
      }
      @session.visit '/'
    end


    def screenshot_now
      timestamp = Time.now.to_s(:number)
      @session.save_screenshot("public/screens/#{timestamp}.png", full: true)
    end

    def next_page
      @session.click_link_or_button 'pnnext'
    end

    def get_html
      page = Nokogiri::HTML(@session.html)
      linki = page.css('h3.r a')
      linki
    end

    def find_link_on_page(linki,site,google_page,keyword)
      gi = GoogleIndex.new
      gi.site = site
      gi.keyword = keyword
      linki.each_with_index do |a,i|
        if a.values[0].include? keyword
          puts a.values[0] #dany link
          gi.href = a.values[0]
          puts "Pozycja na stronie #{i}"
          gi.keyposition = i+1 #pozycja na stronie
          puts "Strona w google :  #{google_page}" #strona google
          gi.siteposition = google_page+1
          gi.save
          return true
        end
      end
    end

    def fill_input(keyword)
      @session.fill_in 'lst-ib', with: keyword
      @session.click_link_or_button 'Szukaj w Google'
    end
  
 
end
