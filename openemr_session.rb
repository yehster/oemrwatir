# To change this template, choose Tools | Templates
# and open the template in the editor.

class OpenemrSession
  @brw
  def initialize(b)
    @brw = b
  end
  def mainWindow()
    @brw.frame(:name,"RTop")
  end
  def nav()
    @brw.frame(:name,"left_nav").wait_until_present
    @brw.frame(:name,"left_nav")
  end
  def gotoNav(id)
      nav().link(:id=>id).click
  end
  def gotoSearch()
    gotoNav("new0")
  end
  def selectPat(name)
    gotoSearch()
    sleep 0.5 until begin
     mainWindow.text_field(:id=>'form_lname').exists?
    rescue
      p "Waiting"
    end
    lname=mainWindow.text_field(:id=>'form_lname')
    lname.click
    lname.set name
    url=@brw.url
    mainWindow.button(:id=>'search').click
    @brw.window(:url=>/patient_select.php/).use
    @brw.div(:id=>"searchResults").table[1].click
     sleep 1 until begin
       @brw.windows[0].use
     rescue 

     end
    
  end
end
