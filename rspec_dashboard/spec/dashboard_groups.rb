require_relative '../../lib/main'

describe 'Add and edit groups' do

  before(:all) do
    @dashboard = Base.new
    @dashboard.setup('https://nx6cz9h7xj5bptw')
    create_run_log
    write_test_log('starting test')
  end

  after(:all) do
    @dashboard.teardown
    write_test_log('ended the test')
  end

  it 'login' do
    @dashboard.login('admin@example.com','Puppet1')
    write_test_log('logged in')
  end

  it 'validate link is present' do
    @dashboard.link_present?('Groups')
  end

  it 'Create a test_group' do
    @dashboard.select_link('Grorrups')
    @dashboard.select_link('default')
    @dashboard.select_link('mcollective')
    @dashboard.select_link('no mcollective')
    @dashboard.select_link('puppet_console')
    @dashboard.select_link('puppet_master')
    @dashboard.select_link('Add group')
    @dashboard.enter_text('node_group_name','Test Group '+ '@testString')
    @dashboard.enter_text('node_group_description','Test Node group description')
    @dashboard.enter_text('node_group_parameter_attributes_1_key','akey')
    @dashboard.enter_text('node_group_parameter_attributes_1_value','avalue')
    @dashboard.select_button('Add variable')
    @dashboard.select_button('Add variable')
    @dashboard.enter_text('node_class_autocomplete','adding a class')
    @dashboard.enter_text('node_group_autocomplete','adding a group')
    @dashboard.enter_text('node_autocomplete','adding a node')
    @dashboard.select_link('Cancel')
    ## TODO  - selection of submit button 'Create' has become unreliable
    # @dashboard.select_id('submit_button')
  end

  it 'Create a test group moved to page object module' do
    click_groups
    click_default
    click_mcollective
    click_no_mcollective
    click_puppet_console
    click_puppet_master
  end

  it 'Edit and update the test group' do
    @dashboard.select_link('Edit')
    @dashboard.enter_text('node_group_parameter_attributes_1_key','akey')
    @dashboard.enter_text('node_group_parameter_attributes_1_value','avalue')
    @dashboard.select_button('Add variable')
    # @dashboard.select_button('submit_button')
  end

  it 'logout' do
    @dashboard.logout
  end

end


