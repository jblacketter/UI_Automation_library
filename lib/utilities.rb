require_relative '../lib/main.rb'

module Utilities
# TODO  complete these methods to get and parse answers file

  def get_answers_file_blob
    # TODO this will cat out the answers file from host. Need to parse and match for expected elements.
    Net::SSH.start('r7ewsv5ylwrbr6k', 'root') do |ssh|
       remote_data = open("https://r7ewsv5ylwrbr6k.delivery.puppetlabs.net:3000/answers/r7ewsv5ylwrbr6k.answers").read
      ssh.exec("cd /opt/puppet/share/installer/answers; ls; cat r7ewsv5ylwrbr6k.answers")
      end
    end

  def get_answers_screen_scrape
    # TODO:  method that will scrape the data directly from the screen from answers link
    opts = OptionParser.new
    opts.on("-h HOSTNAME", "--hostname NAME", String, "Hostname of Server") { |v| @hostname = v }
    opts.on("-u SSH USERNAME", "--username SSH USERNAME", String, "SSH Username of Server") { |v| @username = v }
    opts.on("-p SSH PASSWORD", "--password SSH PASSWORD", String, "SSH Password of Server") { |v| @password = v }
    opts.on("-c SHELL_COMMAND", "--command SHELL_COMMAND", String, "Shell Command to Execute") { |v| @cmd = v }

    begin
      opts.parse!(ARGV)
    rescue OptionParser::ParseError => e
      puts e
    end
      raise OptionParser::MissingArgument, "Hostname [-h]" if @hostname.nil?
      raise OptionParser::MissingArgument, "SSH Username [-u]" if @username.nil?
      raise OptionParser::MissingArgument, "SSH Password [-p]" if @password.nil?
      raise OptionParser::MissingArgument, "Command to Execute [-c]" if @cmd.nil?

    # begin
    #   ssh = Net::SSH.start(@hostname, @username, :password => @password)
    #   # res = ssh.exec!(@cmd)
    #
    #   ssh.exec!("cd /tmp")
    #   res = ssh.exec!("ls -la")
    #
    #   ssh.close
    #   puts res
    # rescue
    #   puts "Unable to connect to #{@hostname} using #{@username}/#{@password}"
    # end

    # it 'Verify answer file in page' do
    #   @higgs.select_link('masterdns')
    #   url = "https://t9e4cf5nkoytzzo.delivery.puppetlabs.net:3000/answers/masterdns.answers"
    #   page = Nokogiri::HTML(open(url))
    #   # p page.css('title').text
    #   # p page.css('body').text
    #   # verify { element_present?(:css, "pre").should be_true }

    end

end