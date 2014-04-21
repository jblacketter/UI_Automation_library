require_relative '../lib/main.rb'
require_relative '../page_elements/higgs'

#  common contains the main class to handle UI elements
class Base
  include Higgs
  def initialize

  end

###########################################################################################################################
### Base object methods. The first level of abstraction over the UI
###########################################################################################################################

  def setup(hostname)
    # TODO : handle http and https url data
    @driver = Selenium::WebDriver.for :firefox
    @base_url = 'http://' + hostname
    @driver.get(@base_url)
    @driver.manage.timeouts.implicit_wait = 30
    @accept_next_alert = true
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
    @wait = Selenium::WebDriver::Wait.new(:timeout => 20) # seconds
  end

  def teardown
    @driver.quit
  end

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
    select_link('admin')
    select_link('Logout')
  end

###########################################################################################################################
### Click handlers
###########################################################################################################################

  def select_link(name)
    begin
      @wait.until { @driver.find_element(:link,"#{name}").click }
    rescue StandardError => error
      puts error.message
      take_screenshot
      fail
    end
  end

  def select_id(name)
    begin
      @wait.until { @driver.find_element(:id,"#{name}").click }
    rescue StandardError => error
      puts error.message
      take_screenshot
      fail
    end
  end

  def select_xpath(name)
    # CLick an ID by name
    begin
      @wait.until { @driver.find_element(:xpath, "//button[@value='#{name}']").click }
    rescue StandardError => error
      puts error.message
      take_screenshot
      fail
    end
  end

  def select_button(name)
    begin
      @wait.until { @driver.find_element(:link, "#{name}").click }
    rescue StandardError => error
      puts error.message
      take_screenshot
      fail
    end
  end

  def select_css(name)
    begin
      @wait.until { @driver.find_element(:css, "#{name}") }
      @driver.find_element(:css, "#{name}").click
    rescue StandardError => error
      puts error.message
      take_screenshot
      fail
    end

  end

  def enter_text(name,text)
    begin
      @wait.until { @driver.find_element(:id, "#{name}") }
      @driver.find_element(:id, "#{name}").clear
      @driver.find_element(:id, "#{name}").send_keys "#{text}"
    rescue StandardError => error
      puts error.message
      take_screenshot
      fail
    end
  end

end


