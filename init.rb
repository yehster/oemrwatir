require "./setupFB.rb"
require "./openemrTask.rb"
require "./openemr_session.rb"
$b=firebugBrowser()
oemrLogin($b,$openemr,"admin","pass")
$os=OpenemrSession.new $b
$os.mainWindow.wait_until_present

$os.selectPat "Doe"