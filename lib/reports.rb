require_relative '../lib/main.rb'

module Reports

  def initialize
    @run_time = Time.now.strftime("%Y%m%d"+"_"+"%H%M%S")
    @dir_results = '/results/'
    @time_year = Time.now.strftime("%Y")
    @time_month = Time.now.strftime("%m")
    @dir_name = Dir::pwd + @dir_results + "#{@run_time}"
    @log_name = "test_run#{@trun_time}.txt"
    @file_path = @dir_name + '/' + @log_name
  end

  def create_run_log
    Dir::mkdir(@dir_name) unless File.exists?(@dir_name)
    @test_run_log = File.open(@file_path, 'a+')
  end

  def write_test_log(msg)
    begin
      @test_run_log = File.open(@test_run_log, 'a+')
      @test_run_log.puts(msg)
    rescue
      fail(msg="Cant create log report")
    end
  end

  ## TODO: create separate file in results for error log
  # def create_error_log
  #   begin
  #     @error_log = Logger.new
  #     @error_log.level = Logger::DEBUG
  #   rescue
  #     fail(msg="Cant create log report")
  #   end
  # end

  def take_screenshot
     @driver.save_screenshot("#{@dir_name}" + "/" + "#{Time.now.strftime("screen_shot__%H_%M_%S")}.png")
  end

end # Reports_module