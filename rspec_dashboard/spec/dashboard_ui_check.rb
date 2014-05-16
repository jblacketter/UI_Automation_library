require_relative '../../lib/main'

describe 'Login to Dashboard' do

  before(:all) do
    @dashboard = Base.new
    get_test_run_yaml('data/dashboard_run_config.yml')
    @dashboard.setup(@hostname)
    create_run_log
    write_test_log('starting test')
  end
  
  after(:all) do
    @dashboard.teardown
    write_test_log('ended the test')
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
