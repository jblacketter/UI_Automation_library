UI_Automation_library
=====================

UI Automation framework for PE


### What is it? ##
A UI framework with libraries to interface with PE UI such as HIGGS and PE Dashboard. Tests can be built on top of this and call the methods in this framework. Rspec is the default but Cucumber examples will also be provided

### Running the sample rspec ##

A sample of rspec tests are provided under rspec_higgs. To run them you must have a url to the  UI (TODO: The URL will be moved into a method that takes this as part of a config file. lines in Before all will be wrapped in a setup method)

1. Enter URL in higgs_spec.rb under before:all(do) This example is attached to the @higgs test run instance
   @higgs.setup('127.0.0.1:9393')
2. Execute the spec file from within rspec_higgs - rspec spec/higgs_spec.rb
3. Optionally add additional configuration such as an html report of results  --format html --out reports.html

### The layers
- UI abstraction layer ** This is the lowest level library that provides a method for interfacing with the UI elements. Single methods for selecting links, Buttons, entering text, etc. This could also be thought of as the base object for a page object model
- Page Objects ** The page objects describe elements of the UI that are re-usable and make sense to be wrapped in a reusable method. For example a navigation bar. It is also used to define single predefined clicks and are provided through modules specific to the application. This concept should be used sparingly and should not be used to simply describe every view or page
- Test support modules ** Non test specific activities that support the test run. Reporting, data handling, time and string functions, etc.
- The test runner ** Rspec is the default supported runner here. However other ruby based runners such as Cucumber or test unit could be used.

### Building a test

Following good conventions for rspec style (TODO: Collate references to rspec style guide and get team agreement on rspec conventions to describe tests) you can use the examples provided so far to build tests in higgs. Using and IDE of choice you should be able to see the available test calls using auto complete

Example:

describe 'Click on Higgs UI'

it 'Enter Machine Information' do

From here there are two ways to see available methods to interface with the UI

1. use methods directly from the Base class in Core.rb. This example uses the select_link method and we will pass it the the ID of the element for Database Install

      @higgs.select_id('q_database_install')

2. Use a predefined click. This is available as part of the page object under the page_elements/higgs module. You can start typing the word click to see the available definitions so far.
```ruby
 click_machine_information
 click_install_type
 click_database_information
 click_console_information
 click_smtp_info
 click_misc
```
### Next steps
I will build out more definitions in the page object layer to support building tests in Higgs and PE dashboard. I have a number of tasks in Jira to refactor this to make it more robust, including adding a data driven capability.

Other activities include:
- Documenting good style guides for describing rspec and rules for usage of the framework
- Continue getting feedback from QA in code reviews and direct involvement to continually refactor framework to ensure that it is robust and meets the requirements of QA
- Include existing tests and setup for dashboard refactored to use this framework


