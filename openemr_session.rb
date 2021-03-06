# To change this template, choose Tools | Templates
# and open the template in the editor.
def populate_fields(target,data)
  data.each{|key,value|target.text_field(:name=>key).set value}
end

def find_or_create_patient(os,data,sex)
  fill_patient_form(os,data,sex)
  row_found = false
  row_to_click = false
  if(os.brw.div(:id=>"searchResults").table[1].exists?)
    os.brw.div(:id=>"searchResults").table.rows.each do |row|
      begin
        if(row.cells[1].text=~/#{data["form_lname"]}, #{data["form_fname"]}/)
          if(row.cells[3].text=~/#{data["form_DOB"]}/)
            if(row.cells[4].text=~/#{sex}/)
              row_found=true
              row_to_click=row
            end
          end
        end
      rescue=>e
        
      end
    end
  end

  if(row_found)
    row_to_click.click
  else
  os.brw.button.click   
  end
  sleep 3
  os.brw.windows[0].use

end

def find_or_create_numeric_patient(os,num,sex)
  pat=PatientData.new(num,sex)
  find_or_create_patient(os,pat.fields,pat.sex)
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

def verify_or_create_appointment(os,slot_num)
  os.goto_calendar
  times=os.cal_frame.td(:id=>"times").table
  div_day=os.cal_frame.div(:class=>"calendar_day")
  times[slot_num].text
  if div_day.span(:class=>"appointment",:text=>/\A#{times[slot_num].text}/).exists?
    return false
  else
    times[slot_num].click
    os.brw.window(:url=>/add_edit_event.php/).use
    os.brw.button(:id=>"form_save").click
    sleep 3
    os.brw.windows[0].use
    return true
  end
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
    sleep 2
  end
  def goto_calendar()
    goto_nav("cal0")
  end
  def cal_frame
    main_window.frames[0]
  end
  def goto_next_day
    cal_frames.img(:id=>"nextday").click
  end
  
  def goto_prev_day
    cal_frames.img(:id=>"prevday").click
  end
  
  def goto_today
   cal_frames.link(:name=>"bnsubmit").click
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
