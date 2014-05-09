class ConsoleClicks

  ## TODO: Experiment to build a list of test method clicks using metaprogramming
  # define a class macro for setting features
  def self.features(*args)
    args.each do |feature|
      # attr_accessor #{feature}"
      # p feature
    end
  end

  # features
  features :groups, :default, :mcollective, :puppet_console, :puppet_master

  def click_test
     p 'test'
  end

end


# def click_groups
#   @dashboard.select_link('Groups')
# end
# def click_default
#   @dashboard.select_link('default')
# end
# def click_mcollective
#   @dashboard.select_link('mcollective')
# end
# def click_no_mcollective
#   @dashboard.select_link('no mcollective')
# end
# def click_puppet_console
#   @dashboard.select_link('puppet_console')
# end
# def click_puppet_master
#   @dashboard.select_link('puppet_master')
# end

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