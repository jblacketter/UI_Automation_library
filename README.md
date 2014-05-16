UI_Automation_library
=====================

UI Automation framework for PE


### What is it? ##
A UI framework with libraries to interface with PE UI such as HIGGS and PE Dashboard. Tests can be built on top of this and call the methods in this framework. Rspec is the default but Cucumber examples are also included

### Running the sample rspec ##

A sample of rspec tests are provided under rspec_higgs and rspec_dasbhoard. To run them you must have a url to the  UI 

1. Open the run_config.yml file for your test. For example in Higgs data/higgs_run_config.yml and nter the default URL as the hostname.  
```ruby
   test_run_data:
   hostname: http://f3lpw9dku4xvrj7.delivery.puppetlabs.net:3000
```
2. Execute the spec file from within rspec_higgs - rspec spec/higgs_spec.rb
3. Optionally add additional configuration such as an html report of results  --format html --out reports.html

### The layers
- UI abstraction layer ** This is the lowest level library that provides a method for interfacing with the UI elements. Single methods for selecting links, Buttons, entering text, etc. This could also be thought of as the base object for a page object model
  /lib files make up the UI abstraction. core.rb contains the base object.  Other core objects such as data reports and utilities are here as well
- Page Objects ** The page objects describe elements of the UI that are re-usable and make sense to be wrapped in a reusable method. For example a navigation bar. It is also used to define single predefined clicks and are provided through modules specific to the application. This concept should be used sparingly and should not be used to simply describe every view or page
  /page_elements contain the page objecs. common_events.rb contains methods used across all apps (currently dashboard and higgs)  application specific object are named accordingly for the app and objects contained
- Test support modules ** Non test specific activities that support the test run. Reporting, data handling, time and string functions, etc.
- The test runner ** Rspec is the default supported runner here. However other ruby based runners such as Cucumber or test unit could be used.

### Building a test
 # this desription is based on the old higgs ui. will update when the new UI is available
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

### Building a test example id the PE dashboard

(see the examples under rspec dashboard)

Example:

it 'login' do
    @dashboard.login('admin@example.com','Puppet1')
end

#### This example calls the core methods to select links passing in the name
```ruby
it 'Create a test_group' do
  @dashboard.select_link('Groups')
  @dashboard.select_link('default')
  @dashboard.select_link('mcollective')
end
```

#### This example does the same thing, but it uses a simpler convention where the clicks are predefined as part of the PEConsole page object layer. methods defined under page_elements/pe_console.rb
```ruby
it 'Create a test group moved to page object module' do
  click_groups
  click_default
  click_mcollective
end
```

#### Some validation methods in selenium. rspec matchers can also be added but not included in this example
```ruby
  ## look for the current page title by text
    @dashboard.page_title_present?('Puppet Enterprise Console - Nodes')
  ## look for the element present by passing in the name
    @dashboard.element_present?(:link, 'Groups')
    @dashboard.element_present?(:name, 'username')
    @dashboard.element_present?(:body_tag, 'body')
  ## simplify the lookup for a locator name. The method is described in the name and you just pass in the text which is usually the text visible on the page for a link or button
    @dashboard.link_present?('Groups')
    @dashboard.field_present?('password')
```

#### Then logout and teardown the instance
```ruby
it 'Logout and Shutdown' do
    @dashboard.logout
    @dashboard.teardown
end
```



