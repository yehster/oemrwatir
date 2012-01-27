require "./setupFB.rb"
require "./openemrTask.rb"
require "./openemr_session.rb"
require "./patient_data.rb"
require "watir-webdriver/extensions/alerts"
$b=firebugBrowser()
oemrLogin($b,$openemr,"saldana","pass")
$os=OpenemrSession.new $b

begin
  $os.main_window.wait_until_present
  $os.main_window
rescue
  sleep 4
  $os.main_window.wait_until_present
  $os.main_window
end

