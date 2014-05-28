require_relative '../lib/main.rb'

module CommonEvents

  def login(username,password)
      @username=username
      @password=password
      begin
        enter_text('username',@username)
        enter_text('password',@password)
        select_id('submit_login')
      rescue StandardError => error
        puts error.message
        take_screenshot
        fail
      end
  end

  def logout
    begin
      select_link('admin')
      select_link('Logout')
    rescue
      puts error.message
      take_screenshot
      fail
    end
  end


  #   def get_screen_data
  #     require 'nokogiri'
  #     require 'open-uri'
  #     url = "https://dsfcipllex5f5vv.delivery.puppetlabs.net:3000/answers/masterdns.answers"
  #     data = Nokogiri::HTML(open(url))
  # #     puts data.at_css("#price").text.strip
  #  end

end