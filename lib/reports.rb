require_relative '../lib/main.rb'

module Reports

  def test_run_results
    # unique folder for test run
    # convert Time.now.strftime to string to create timestamped folder name as in RUN_042114_13:42:30
    # folder name belongs to test run instance
    # all run logs, errors, screenshots sent into this folder
  end

  def take_screenshot
    # TODO: parse out the screenshot result string to handle location and type
    @driver.save_screenshot "results/#{Time.now.strftime("fail__%d_%m_%Y__%H_%M_%S")}.png"
  end

end