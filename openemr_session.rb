# To change this template, choose Tools | Templates
# and open the template in the editor.
def populate_fields(target,data)
  data.each{|key,value|target.text_field(:name=>key).set value}
end

def find_or_create_patient(os,data,sex)
  fill_patient_form(os,data,sex)
  if(os.brw.div(:id=>"searchResults").table[1].exists?)
    os.brw.div(:id=>"searchResults").table[1].click
  else
  os.brw.button.click   
  end
  sleep 3
  os.brw.windows[0].use

end

def fill_patient_form(os,data,sex)
  os.goto_search
  populate_fields(os.main_window(),data)
  os.main_window().select_list(:id=>"form_sex").select sex
  os.main_window().button(:id=>"create").click
    os.brw.window(:url=>/new_search_popup.php/).use
  end

def create_patient(os,data,sex)

  fill_patient_form(os,data,sex)
  os.brw.button.click
  
  sleep 3
  os.brw.windows[0].use
  
end
class OpenemrSession
  @brw
  def brw
    return @brw
  end
  def initialize(b)
    @brw = b
    ObjectSpace.define_finalizer(self, proc{@brw.close})
  end
  def main_window()
    @brw.frame(:name,"RTop").wait_until_present
    ret=@brw.frame(:name,"RTop")
    return ret
  end
  def nav()
    @brw.frame(:name,"left_nav").wait_until_present
    nav=@brw.frame(:name,"left_nav")
    return nav
  end
  def goto_nav(id)
      
      nav().link(:id=>id).click
  end
  def goto_search()
    goto_nav("new0")
  end
  def goto_calendar()
    goto_nav("cal0")
  end
  
  def goto_next_day
    main_window.frames[0].img(:id=>"nextday").click
  end
  
  def goto_prev_day
    main_window.frames[0].img(:id=>"prevday").click
  end
  
  def goto_today
    main_window.frames[0].link(:name=>"bnsubmit").click
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
