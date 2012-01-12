# To change this template, choose Tools | Templates
# and open the template in the editor.

class OpenemrSession
  @brw
  def initialize(b)
    @brw = b
  end
  def mainWindow()
    ret =@brw.frame(:name,"RTop")
    ret.locate
    return ret
  end
end
