require "./setupFB.rb"
require "./openemrTask.rb"
require "./openemr_session.rb"
require "watir-webdriver/extensions/alerts"
$b=firebugBrowser()
oemrLogin($b,$openemr,"admin","pass")
$os=OpenemrSession.new $b
$os.main_window.wait_until_present
$os.main_window
begin
  #$os.select_pat "Doe"
rescue
end
$lname="Lastname2"
$fname="Firstname2"
$dob="01/01/1982"
$patientInfo={"form_lname"=>$lname,
              "form_fname"=>$fname,
              "form_DOB"=>$dob
}
$os.goto_nav "new0"