require "watir-webdriver"
$openemr="ubuntu/openemr"
$openemr="http://opensourceemr.com:2089/openemr"
def firebugBrowser()
profile = Selenium::WebDriver::Firefox::Profile.new
#profile.add_extension "/Users/yehster/AppData/Roaming/Mozilla/Firefox/Profiles/91entnug.default/extensions/firebug@software.joehewitt.com.xpi"
b = Watir::Browser.new :firefox, :profile => profile
#b.div(:id=>"logo").wait_until_present
return b
end