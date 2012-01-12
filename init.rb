require "./setupFB.rb"
require "./openemrTask.rb"
require "./openemr_session.rb"
$b=firebugBrowser()
oemrLogin($b,$openemr,"admin","pass")
$os=OpenemrSession.new $b