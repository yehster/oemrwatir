require "./setupFB.rb"
require "./openemrTask.rb"
require "./openemr_session.rb"
require "watir-webdriver/extensions/alerts"
$b=firebugBrowser()
oemrLogin($b,$openemr,"admin","pass")
$os=OpenemrSession.new $b
$os.main_window.wait_until_present

#$os.selectPat "Doe"
$lname="Lastname3"
$fname="Firstname3"
$dob="01/01/1977"
$patientInfo={"form_lname"=>$lname,
              "form_fname"=>$fname,
              "form_DOB"=>$dob
}
$os.goto_nav "new0"