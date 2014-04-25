require_relative '../../lib/main'

describe 'Login to Dashboard' do

  before(:all) do
    @dashboard = Base.new
    @dashboard.setup('https://pigoreh4aiw5zih')
  end
  
  after(:all) do
    @driver.quit
    @verification_errors.should == []
  end
  
  it 'login' do
    @dashboard.login('admin@example.com','Puppet1')
  end

  it 'Validate Page Title' do
   # expect(response).to respond_with_content_type(:json)
  end

  def success_message_present?
  #  @driver.find_element(test).displayed?
  end

  it 'logout' do
    @dashboard.logout
  end

end
