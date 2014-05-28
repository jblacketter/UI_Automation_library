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

end