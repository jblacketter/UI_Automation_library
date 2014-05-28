require_relative '../lib/main.rb'

#  common contains the main class to handle UI elements
class Base
###########################################################################################################################
### Base object methods. The first level of abstraction over the UI
###########################################################################################################################

  def setup(hostname)
    @driver = Selenium::WebDriver.for :firefox
    @base_url = hostname
    @driver.get(@base_url)
    @driver.manage.timeouts.implicit_wait = 10
    @accept_next_alert = true
    @verification_errors = []
    @wait = Selenium::WebDriver::Wait.new(:timeout => 20) # seconds
  end

  def sauce_setup(hostname)
      caps = Selenium::WebDriver::Remote::Capabilities.firefox
      caps.platform = 'OS X 10.9'
      caps.version = '28'
      caps[:name] = "Test run higgs against sauce"

      @driver = Selenium::WebDriver.for(
          :remote,
          :url => "http://QA-Team:2b127be8-d5c7-45f4-b257-f545b81a8a77@ondemand.saucelabs.com:80/wd/hub",
          :desired_capabilities => caps)
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

  def move_to
    #TODO a test for mouseover
    @driver.action.move_to(@driver.find_element(:css, "html")).perform
    @driver.action.move_to(@driver.find_element(:css, "#database_div > div.row > div.col-sm-6")).perform
  end

#################################################################
## validation
#################################################################

  def link_present?(locator)
    begin
      verify{ @driver.find_element(link: locator).displayed?.should }
    rescue StandardError => error
      write_test_log(error.message)
      puts error.message
      take_screenshot
      fail
    end
  end

  def field_present?(locator)
    begin
      verify{ @driver.find_element(name: locator).displayed?.should }
    rescue StandardError => error
      puts error.message
      take_screenshot
      fail
    end
  end

  def element_present?(how, what)
    begin
      @driver.find_element(how, what)
    rescue StandardError => error
      puts error.message
      take_screenshot
      fail
    end
  end

  def is_displayed?(locator)
    begin
      @driver.find_element(locator).displayed?.should
    rescue StandardError => error
      puts error.message
      take_screenshot
      fail
    end
  end

  def page_title_present?(page_title)
    begin
      @driver.title.should == page_title
    rescue StandardError => error
      puts error.message
      take_screenshot
      fail
    end
  end

  def verify(&blk)
    yield
  rescue ExpectationNotMetError => ex
    @verification_errors << ex
  end

end





