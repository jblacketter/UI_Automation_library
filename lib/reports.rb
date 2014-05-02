require_relative '../lib/main.rb'

module Reports

  def initialize
    @run_time = Time.now.strftime("%Y-%m-%d"+"_"+"%H-%M-%S")
    @dir_results = '/results/'
    @time_year = Time.now.strftime("%Y")
    @time_month = Time.now.strftime("%m")
    @dir_name = Dir::pwd + @dir_results + @time_year + @time_month + "#{@run_time}"
    @log_name = "test_run#{@trun_time}.txt"
    @file_path = @dir_name + '/' + @log_name
  end

  def create_run_log
    Dir::mkdir(@dir_name) unless File.exists?(@dir_name)
    @test_run_log = File.open(@file_path, 'a+')
  end

  def create_error_log
    begin
      #this does not compile
      # @error_log = Logger.new
      @error_log.level = Logger::DEBUG
    rescue
      fail(msg="Cant create log report")
    end
  end

  def write_test_log(msg)
    begin
      @test_run_log = File.open(@test_run_log, 'a+')
      @test_run_log.puts(msg)
    rescue
      fail(msg="Cant create log report")
    end
  end

  def take_screenshot
    # TODO: parse out the screenshot result string to handle location and type
     @driver.take_screenshot "results/#{Time.now.strftime("fail__%d_%m_%Y__%H_%M_%S")}.png"
     #@driver.save_screenshot("#{@dir_results}" + "#{@dir_name}") + "/screenshot.png"
  end

end # Reports_module