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
    set_subdomain("one")
    visit '/'
    current_url.should == "http://one.example.com/" # passes
    find("h1").text.should == "http://one.example.com/" # passes
  end

  scenario "Access subdomain two" do
    set_subdomain("two")
    visit '/'
    current_url.should == "http://two.example.com/" # passes
    find("h1").text.should == "http://two.example.com/" # passes
  end

  def set_subdomain(subdomain)
    Capybara.default_host = "#{subdomain}.example.com"
    Capybara.app_host     = "http://#{subdomain}.example.com"
    switch_session(subdomain)
  end
end
