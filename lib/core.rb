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
    # TODO : get from yaml config
    @driver = Selenium::WebDriver.for :firefox
    @base_url = hostname
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
    rescue Selenium::WebDriver::Error::NoSuchElementError
      puts error.message
      take_screenshot
      fail
    end
  end

  def select_css(name)
    begin
      @wait.until { @driver.find_element(:css, "#{name}") }
      @driver.find_element(:css, "#{name}").click
    rescue Selenium::WebDriver::Error::NoSuchElementError
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
    rescue Selenium::WebDriver::Error::NoSuchElementError
      puts error.message
      take_screenshot
      fail
    end
  end

#################################################################
## validation
#################################################################

  def link_present?(locator)
    begin
      verify{ @driver.find_element(link: locator).displayed?.should }
    rescue Selenium::WebDriver::Error::NoSuchElementError
      puts error.message
      take_screenshot
      fail
    end
  end

  def field_present?(locator)
    begin
      verify{ @driver.find_element(name: locator).displayed?.should == true }
    rescue StandardError => error
      puts error.message
      take_screenshot
      fail
    end
  end

  def element_present?(how, what)
    begin
      @driver.find_element(how, what)
    rescue Selenium::WebDriver::Error::NoSuchElementError
      puts error.message
      take_screenshot
      fail
    end
  end

  def is_displayed?(locator)
     @driver.find_element(locator).displayed?.should == true
  end

  def page_title_present?(page_title)
    @driver.title.should == page_title
  end

  def verify(&blk)
    yield
  rescue ExpectationNotMetError => ex
    @verification_errors << ex
  end


end


