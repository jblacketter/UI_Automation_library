require_relative '../../lib/main'
require "rspec"
include RSpec::Expectations

describe 'Login to Dashboard' do

  before(:all) do
    @dashboard = Base.new
    @dashboard.setup('https://rf053vpab5s9os9')
  end
  
  after(:all) do
    @dashboard.quit
  end

  it 'validate user name field is present' do
    @dashboard.element_present?(:name, 'username')
    @dashboard.field_present?('username')
  end

  it 'validate body tag is present' do
    @dashboard.element_present?(:tag_name, 'body')
  end

  it 'login' do
    @dashboard.login('admin@example.com','Puppet1')
  end

  it 'validate link is present' do
    @dashboard.element_present?(:link, 'Groups')
    ## These just require the name of the element using the selector type in the method name. Not sure this is desired
    @dashboard.link_present?('Groups')
    @dashboard.link_present?('Add node')
  end

   it 'Validate landing Page Title' do
    @dashboard.page_title_present?('Puppet Enterprise Console - Nodes')
  end

  it 'logout' do
    @dashboard.logout
  end



end
