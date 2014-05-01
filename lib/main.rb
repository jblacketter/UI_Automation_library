## require gems
require 'json'
require 'selenium-webdriver'
require 'cucumber'
require 'rspec'
require 'yaml'
require 'json-prettyprint'
include RSpec::Expectations

# core library
require_relative '../lib/core.rb'
require_relative '../lib/data.rb'
require_relative '../lib/utilities.rb'
require_relative '../lib/reports.rb'

# application event library
require_relative '../page_elements/common_events'
require_relative '../page_elements/higgs'
require_relative '../page_elements/pe_console'

## Common
# include Select
# include Toggle
# include EnterText
# include Errors
# include Wait
# include Assertion

## Events
include Higgs
include CommonEvents
include PEConsole

## Utiltities
include Reports
include Utilities
include DataHandlers
# include TestData





