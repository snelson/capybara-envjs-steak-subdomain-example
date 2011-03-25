require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "Subdomains" do
  background do
  end

  scenario "Access default domain" do
    visit '/'
    current_url.should == "http://www.example.com/"
    find("h1").text.should == "http://www.example.com/"
  end

  scenario "Access subdomain one" do
    visit "http://one.example.com"
    current_url.should == "http://one.example.com/" # passes
    find("h1").text.should == "http://one.example.com/" # passes

    visit '/'
    current_url.should == "http://one.example.com/" # fails
    find("h1").text.should == "http://one.example.com/" # fails
  end

  scenario "Access subdomain two" do
    visit 'http://two.example.com/'
    current_url.should == "http://two.example.com/" # passes
    find("h1").text.should == "http://two.example.com/" # passes

    visit '/'
    current_url.should == "http://two.example.com/" # fails
    find("h1").text.should == "http://two.example.com/" # fails
  end
end
