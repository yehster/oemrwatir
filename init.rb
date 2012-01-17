require "./setupFB.rb"
require "./openemrTask.rb"
require "./openemr_session.rb"
$b=firebugBrowser()
oemrLogin($b,$openemr,"admin","pass")
$os=OpenemrSession.new $b
$os.main_window.wait_until_present

#$os.selectPat "Doe"
$lname="Lastname1"
$fname="Firstname1"
$dob="01/01/1979"
$patientInfo={"form_lname"=>$lname,
              "form_fname"=>$fname,
              "form_DOB"=>$dob
}