require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "Subdomains" do
  background do
    Capybara.current_driver = :envjs
  end

  scenario "Access default domain" do
    visit '/'
    current_url.should == "http://www.example.com/"
    find("h1").text.should == "http://www.example.com/"
  end

  scenario "Access subdomain one" do
    Capybara.default_host = "one.example.com"
    Capybara.app_host     = "http://one.example.com"
    visit '/'
    current_url.should == "http://one.example.com/" # passes
    find("h1").text.should == "http://one.example.com/" # fails with envjs
  end

  scenario "Access subdomain two" do
    Capybara.default_host = "two.example.com"
    Capybara.app_host     = "http://two.example.com"
    visit '/'
    current_url.should == "http://two.example.com/" # passes
    find("h1").text.should == "http://two.example.com/" # fails with envjs
  end
end
