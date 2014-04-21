require_relative '../lib/main.rb'

module Reports

  def test_run_results
    # unique folder for test run
  end

  def take_screenshot
    # TODO: parse out the screenshot result string to handle location and type
    @driver.save_screenshot "results/#{Time.now.strftime("fail__%d_%m_%Y__%H_%M_%S")}.png"
  end

end