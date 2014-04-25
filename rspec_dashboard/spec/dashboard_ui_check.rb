require_relative '../../lib/main'

describe "Login to Dashboard" do

  before(:all) do
    @dashboard = Base.new
    @dashboard.setup('isbi0x0t0lpm740')
  end
  
  after(:all) do
    #@driver.quit
    #@verification_errors.should == []
  end
  
  it "login" do
    @dashboard.login('admin@example.com','Puppet1')
  end

  it 'logout' do
    @dashboard.logout
  end

  
  
end
