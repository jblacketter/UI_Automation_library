require_relative '../lib/main.rb'

module Utilities
# TODO  complete these methods to get and parse answers file

  def get_answers_file_blob
    # TODO this will cat out the answers file from host. Need to parse and match for expected elements.
    Net::SSH.start('obtvi5oe6t3cepz', 'root') do |ssh|
       remote_data = open("https://obtvi5oe6t3cepz.delivery.puppetlabs.net:3000/answers/r7ewsv5ylwrbr6k.answers").read
      ssh.exec("cd /opt/puppet/share/installer/answers; ls; cat obtvi5oe6t3cepz.answers")
      end
    end

end