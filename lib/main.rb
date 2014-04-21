## require gems
require 'json'
require 'selenium-webdriver'
require 'cucumber'
require 'rspec'
require 'yaml'

# core library
require_relative '../lib/core.rb'
require_relative '../lib/data.rb'
require_relative '../lib/utilities.rb'
require_relative '../lib/reports.rb'

# application event library
require_relative '../page_elements/higgs'

## Common
# include Select
# include Toggle
# include EnterText
# include Errors
# include Wait
# include Assertion
# include Reports
include DataHandlers

## Events
include Higgs
# include EventsDashboard

## Utiltities
include Reports
include Utilities
# include TestData
# include Dates





