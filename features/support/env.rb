gem 'capybara'
require 'capybara'
require 'capybara/cucumber'
require 'capybara/poltergeist'
require 'capybara-screenshot'
require 'capybara-screenshot/cucumber'
Capybara.run_server = false
Capybara.app_host = 'http://localhost:8080/bbs/'
Capybara.register_driver :selenium do |app|
  	require 'selenium/webdriver'
  	profile = Selenium::WebDriver::Firefox::Profile.new
 		profile["intl.accept_languages"] = "en-us,en"
  	Capybara::Selenium::Driver.new(app, :profile => profile)
	end
Capybara.default_driver = :selenium

World do	
	Capybara::Session.new(:selenium)	
	Capybara::Screenshot.register_filename_prefix_formatter(:rspec) do |example|
    "screenshot-#{example.description.gsub(' ', '-')}"
  end
end