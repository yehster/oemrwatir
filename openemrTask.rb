def oemrLogin(brw, site,user, pass)
brw.goto site
frmLogin=brw.frame(:name=>"Login")
frmLogin.text_field(:name=> "authUser").set user
frmLogin.text_field(:name=> "clearPass").set pass
frmLogin.button(:value=> "Login").click
end