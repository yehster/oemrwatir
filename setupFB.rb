require "watir-webdriver"
$openemr="ubuntu/openemr"
def firebugBrowser()
profile = Selenium::WebDriver::Firefox::Profile.new
profile.add_extension "/Users/yehster/AppData/Roaming/Mozilla/Firefox/Profiles/91entnug.default/extensions/firebug@software.joehewitt.com.xpi"
b = Watir::Browser.new :firefox, :profile => profile
return b
end