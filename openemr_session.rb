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
    ret=@brw.frame(:name,"left_nav")
  end
  def gotoNav(id)
    nav().link(:id=>id).click
  end
  def gotoSearch()
    gotoNav("new0")
  end
  def selectPat(name)
    gotoSearch()
    lname=mainWindow.text_field(:id=>'form_lname')
    lname.click
    lname.set name
    url=@brw.url
    mainWindow.button(:id=>'search').click
    @brw.window(:url=>/patient_select.php/).use
    @brw.div(:id=>"searchResults").table[1].click
    sleep 2
    @brw.windows[0].use    
  end
end
