module PeConsole
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

end