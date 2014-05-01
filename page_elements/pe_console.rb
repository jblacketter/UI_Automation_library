require_relative '../lib/main.rb'

module PEConsole
## test page_elements for the PE admin page

  def add_users_and_roles(email_address,role)
    # add users in admin panel
    begin
      enter_text('email',email_address)
      select_xpath(role)
      select_id('submit_user')
    rescue StandardError => error
      puts error.message
      take_screenshot
      fail
    end
  end

  def click_admin_dropdown
    select_link('admin')
  end

  def click_admin_tools
    select_link('Admin Tools')
  end

  #####################################################
  ### dashboard clicks
  #####################################################
  def click_groups
    @dashboard.select_link('Groups')
  end
  def click_default
    @dashboard.select_link('default')
  end
  def click_mcollective
    @dashboard.select_link('mcollective')
  end
  def click_no_mcollective
    @dashboard.select_link('no mcollective')
  end
  def click_puppet_console
    @dashboard.select_link('puppet_console')
  end
  def click_puppet_master
    @dashboard.select_link('puppet_master')
  end


  # @dashboard.select_link('Add group')
  # @dashboard.enter_text('node_group_name','Test Group '+ '@testString')
  # @dashboard.enter_text('node_group_description','Test Node group description')
  # @dashboard.enter_text('node_group_parameter_attributes_1_key','akey')
  # @dashboard.enter_text('node_group_parameter_attributes_1_value','avalue')
  # @dashboard.select_button('Add variable')
  # @dashboard.select_button('Add variable')
  # @dashboard.enter_text('node_class_autocomplete','adding a class')
  # @dashboard.enter_text('node_group_autocomplete','adding a group')
  # @dashboard.enter_text('node_autocomplete','adding a node')
  # @dashboard.select_link('Cancel')

end