# To change this template, choose Tools | Templates
# and open the template in the editor.
def populate_fields(target,data)
  data.each{|key,value|target.text_field(:name=>key).set value}
end
def create_patient(brw,target,data,sex)
  populate_fields(target,data)
  target.select_list(:id=>"form_sex").select sex
  brw.confirm(true) do
    target.button(:id=>"create").click
  end

    brw.window(:url,/new_search_popup.php/).use
    sleep 2
    brw.button.click
end
class OpenemrSession
  @brw
  def initialize(b)
    @brw = b
  end
  def main_window()
    @brw.frame(:name,"RTop")
  end
  def nav()
    @brw.frame(:name,"left_nav").wait_until_present
    @brw.frame(:name,"left_nav")
  end
  def goto_nav(id)
      nav().link(:id=>id).click
  end
  def goto_search()
    gotoNav("new0")
  end
  def select_pat(name)
    goto_search()
    sleep 0.5 until begin
     main_window.text_field(:id=>'form_lname').exists?
    rescue
      p "Waiting"
    end
    lname=main_window.text_field(:id=>'form_lname')
    lname.click
    lname.set name
    url=@brw.url
    main_window.button(:id=>'search').click
    @brw.window(:url=>/patient_select.php/).use
    @brw.div(:id=>"searchResults").table[1].click
     sleep 1 until begin
       @brw.windows[0].use
     rescue 

     end
    
  end
end
