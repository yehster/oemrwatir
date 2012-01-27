# To change this template, choose Tools | Templates
# and open the template in the editor.

$female_names=Array["Sophia","Emma","Isabella","Olivia","Ava","Lily","Chloe","Madison","Emily","Abigail","Addison","Mia","Madelyn","Ella","Hailey","Kaylee","Avery","Kaitlyn","Riley","Aubrey","Brooklyn","Peyton","Layla","Hannah","Charlotte","Bella","Natalie","Sarah","Grace","Amelia","Kylie","Arianna","Anna","Elizabeth","Sophie","Claire","Lila","Aaliyah","Gabriella","Elise","Lillian","Samantha","Makayla","Audrey","Alyssa","Ellie","Alexis","Isabelle","Savannah","Evelyn","Leah","Keira","Allison","Maya","Lucy","Sydney","Taylor","Molly","Lauren","Harper","Scarlett","Brianna","Victoria","Liliana","Aria","Kayla","Annabelle","Gianna","Kennedy","Stella","Reagan","Julia","Bailey","Alexandra","Jordyn","Nora","Caroline","Mackenzie","Jasmine","Jocelyn","Kendall","Morgan","Nevaeh","Maria","Eva","Juliana","Abby","Alexa","Summer","Brooke","Penelope","Violet","Kate","Hadley","Ashlyn","Sadie","Paige","Katherine","Sienna","Piper"]
$male_names=Array["Aiden","Jackson","Mason","Liam","Jacob","Jayden","Ethan","Noah","Lucas","Logan","Caleb","Caden","Jack","Ryan","Connor","Michael","Elijah","Brayden","Benjamin","Nicholas","Alexander","William","Matthew","James","Landon","Nathan","Dylan","Evan","Luke","Andrew","Gabriel","Gavin","Joshua","Owen","Daniel","Carter","Tyler","Cameron","Christian","Wyatt","Henry","Eli","Joseph","Max","Isaac","Samuel","Anthony","Grayson","Zachary","David","Christopher","John","Isaiah","Levi","Jonathan","Oliver","Chase","Cooper","Tristan","Colton","Austin","Colin","Charlie","Dominic","Parker","Hunter","Thomas","Alex","Ian","Jordan","Cole","Julian","Aaron","Carson","Miles","Blake","Brody","Adam","Sebastian","Adrian","Nolan","Sean","Riley","Bentley","Xavier","Hayden","Jeremiah","Jason","Jake","Asher","Micah","Jace","Brandon","Josiah","Hudson","Nathaniel","Bryson","Ryder","Justin","Bryce"]
$last_names=Array["Smith","Johnson","Williams","Brown","Jones","Miller","Davis","Garcia","Rodriguez","Wilson","Martinez","Anderson","Taylor","Thomas","Hernandez","Moore","Martin","Jackson","Thompson","White","Lopez","Lee","Gonzalez","Harris","Clark","Lewis","Robinson","Walker","Perez","Hall","Young","Allen","Sanchez","Wright","King","Scott","Green","Baker","Adams","Nelson","Hill","Ramirez","Campbell","Mitchell","Roberts","Carter","Phillips","Evans","Turner","Torres","Parker","Collins","Edwards","Stewart","Flores","Morris","Nguyen","Murphy","Rivera","Cook","Rogers","Morgan","Peterson","Cooper","Reed","Bailey","Bell","Gomez","Kelly","Howard","Ward","Cox","Diaz","Richardson","Wood","Watson","Brooks","Bennett","Gray","James","Reyes","Cruz","Hughes","Price","Myers","Long","Foster","Sanders","Ross","Morales","Powell","Sullivan","Russell","Ortiz","Jenkins","Gutierrez","Perry","Butler","Barnes","Fisher"]
class PatientData
  @fields
  @sex
  def initialize(num,sex)
    if(sex=="Male")
      fname=$male_names[num]
    else
      fname=$female_names[num]
    end
    $dob="1975-01-01"
    @fields={"form_lname"=>$last_names[num],
              "form_fname"=>fname,
              "form_DOB"=>$dob}
    @sex=sex
  end
  def fields
    @fields
  end
  def sex
    @sex
  end
end