def oemrLogin(brw, site,user, pass)
brw.goto site
brw.frame(:name=>"Login").wait_until_present
frmLogin=brw.frame(:name=>"Login")
frmLogin.text_field(:name=> "authUser").set user
frmLogin.text_field(:name=> "clearPass").set pass
frmLogin.button(:value=> "Login").click

end

def populate_calendar(os,b,e)
  for i in b..e
    find_or_create_numeric_patient(os,i,"Male")
    sleep 2
    verify_or_create_appointment(os,i)
    sleep 2
  end
end