local vec3 = require("modules.vec3")
local mat4 = require("modules.mat4")
local class = require('pl.class')

class.FlashCard(ui.View)

FlashCard.assets = {
  quit = Asset.Base64("iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAAABHNCSVQICAgIfAhkiAAABUtJREFUeJztm+1TGlcUxp9dcEEQ1wFl7VjT5sXMRE3SWmOssUkax6oBtNM/r39DJ8bXWKNJG3XaRGPbqJlpY0zrS+sC4cUFFYHdfohaQMC9cLc6kOfj7p5nz/l593Dv3pX5dvapgiLVxMoy2JNO4qQ0sbIMAMUJ4KB4oAgBJBYPFBmA1OKBIgKQrnigSABkKh4oAgDZigcKHMBxxQMFDEBN8UCBAlBbPFCAAEiKBwB9LjfZDEm5hGmuRbdIHFNwI4BU7wFoaa4PhaAPBDNfoHYhrmi3YtcMQEkgAKF/EMLQCHThcPqLmON9TCtv8MF398Du7NJNcF+aAODcHlT3D0AvSdBLEuxDI2AjEWKf0r9WUTk+Ac7jhTAwqAkE6gCM6xuoHhxOSpbz+WEfeQAmFiPyqRobByPLhx7CwCB04W2q+VIFYF5+DWHkAZi9vSPnDJsi7GPjwH5B2WT4ZxP20TEw8XjScc7nR3X/fZQEs/QVQlEDYFl6icqHk0BK0okyrq6hcvJx+ua3f4xzu2EfHs04WvRbEoR7A+A8XgpZUwLAz83D+uOUqm5tfrUM68zM0RMM3j3rQ6Ngo9GsHrqdHQj3B2HY+DvXlA+VNwBdeBvlLxaIYiwvFsHPzScdK/H5IAyrb5ZsNApheBTGPCHkBCDx7xw3m+B2dEMuKSHyqHg2C8vSSwBASTAIYXCEuMtHbTbs2auIYlJF5RGICAI83Z1QWDI765NpWBaWYB8Yhm6brLvvVdoguu4Sg08VtSa4W1sLb2cHWZCiwDo1DX0oRBQWtVohupyQDQay+6VR/gASnoft8+fgu9met2U2RXkeossBudRIxS9vAErKdFZqbECwpTlf27SKlVsg9rkQN5uoeWoyFQ40fwbpciNVz1hZGcReF+JlZqq+mi2GfO03EK67QMUrbjLB3edErNxCxS9R2i2HGcDb8SV2z9TmZSOXGiH2OhDleUqJJUvbFyIsC3f3Vzn/VssGA0SXE1GrlXJi/0n7N0IsC5njcgqN2KuwZ7NRTihZ2gKQZVR+/xDG9Y2cwkvX1mGdmqacVLK0A6AoqJx4BNObP/OysSwuoWL2OZ2c0kgbAApge/QDzMuvqdjxs3OwLCxS8UoVfQCKAtuTKZT9/gdVW+vUDMyvyDY91Ig6AOvMTyjbX+XRlm3yMYyra1Q9qQKo+PkpLITvBkjEyDLsY+PgRDc1T2oAKuaeg5//lSyIYbB99mOykFgMwvAoOL+f7F4ZRAVA+S+/gX82Rxznb2uFp6cLW1evEMWxkQiqhkahl/Lfo6QCQDZwAKNilyNBgdbrh4X721oRvlhHFK8PhWBZzL/X5AQgtdRQ/SV4ujoBnU5VfLC5CcGmTxIMGXjv3MbOR2dU5yBdaYS/9brq6zMp7xFwAGP73FmIzh4ox0x7tz69ikDLtTSZsPB0dSJSXX3sPQMt1+Brv6Fqa+04Uf0V2K2pwWafE/HS0rTnpcuN8H/emjFe0evhdnQjasuw+GEY+G59gWBzE410AWgwD9irqoL4TR/i5uQXF6H6S/C1tx0b/24F6Di69tfp4O3sgNRQTzNdbabCUZ6H+LXrEEL4Yh3e3rqpulHGTSa4XY7DkaRwHERHD8IXzlPPVbPF0AEEqbEBb+/cJn5eozwPt/MuYuXl2Ox1YvfDGi3SBJPL/wv8n98IMbKser+hIL8RIt1sIdWpB6C13gM46QROWjl9KJlLszmtIh4BpJ+innYRASi04gECAIVYPKCiBxRq4QfKOgIKvXggC4BiKB7IAKBYigfSACim4oGEJlhshR+IBYq3eAD4FzLNyUTM0XqEAAAAAElFTkSuQmCC"),
}

function FlashCard:_init(bounds)
  self:super(bounds)

  -- -- FRONT SURFACE

  self.frontSurface = Surface(ui.Bounds(0, 0, 0, 1, 1, 0.01))
  self.frontSurface:setColor({1, 0, 0, 1})
  self:addSubview(self.frontSurface)


  -- -- TEXT LABLE
  --Creates a Label, at origo, that is 1m wide, 20cm tall and 1cm deep
  self.lable = Label{bounds=Bounds(0, 0, 0, 1, 0.2, 0.01)}

  --For convenience, you may also set some or all of the Label's properties within the constructor, i.e.:
  self.lable = Label{bounds=Bounds(0, 0, 0, 1.0, 0.1, 0.001), color={0.0,0,1}, text="Hello!", halign="left"}
  self:addSubview(self.lable)


  -- -- QUIT BUTTON
  -- self.quitButton = ui.Button(ui.Bounds{size=ui.Size(
  --     self.SMALL_BUTTON_SIZE,
  --     self.SMALL_BUTTON_SIZE,
  --     self.BUTTON_DEPTH)})
  -- self.quitButton:setDefaultTexture(Whiteboard.assets.quit)
  -- self.quitButton.onActivated = function()
  --   self.app:quit()
  -- end
  -- self:addSubview(self.quitButton)
  

  self:layout()
end

function FlashCard:specification()
  return ui.View.specification(self)
end

function FlashCard:update()

  -- if self.resizeHandle.entity ~= nil then 
  --   local m = mat4.new(self.resizeHandle.entity.components.transform.matrix) -- looks at the resizeHandle's position
  --   local resizeHandlePosition = m * vec3(0,0,0)

  --   local newWidth = resizeHandlePosition.x*2 + self.SMALL_BUTTON_SIZE
  --   local newHeight = resizeHandlePosition.y*2 + self.SMALL_BUTTON_SIZE

  --   if newWidth <= 1.2 then newWidth = 1.2 end
  --   if newHeight <= 0.5 then newHeight = 0.5 end

  --   self:resize(newWidth, newHeight)
  -- end

  -- self.drawableSurface:sendIfDirty()

end


function FlashCard:layout()
  print("Re-layouting")

  -- -- Set correct position of all UI elements in relation to the drawableSurface  
  -- self.half_width = self.drawableSurface.bounds.size.width/2
  -- self.half_height = self.drawableSurface.bounds.size.height/2

  -- self.frame:setBounds(ui.Bounds{
  --     size= ui.Size(
  --       self.drawableSurface.bounds.size.width+self.FRAME_THICKNESS*2,
  --       self.drawableSurface.bounds.size.height+self.FRAME_THICKNESS*2, 
  --       self.drawableSurface.bounds.size.depth)
  --     }:move(0,0,-0.001))
    
  -- --print("controlPanel width:", self.drawableSurface.bounds.size.width + self.FRAME_THICKNESS*2)
  -- self.controlPanel:setBounds(ui.Bounds{
  --   size= ui.Size(
  --     self.drawableSurface.bounds.size.width + self.FRAME_THICKNESS*2,
  --     self.BUTTON_SIZE + self.FRAME_THICKNESS*2, 
  --     0.05)
  -- }:rotate(-self.PI/4, 1, 0, 0):move(0,-self.half_height-self.BUTTON_SIZE/2-self.FRAME_THICKNESS, self.BUTTON_SIZE/2-self.FRAME_THICKNESS))
  
  -- -- Buttons laid out in relation to their parent: the controlPanel
  -- self.clearButton:setBounds(ui.Bounds{pose=ui.Pose(-self.controlPanel.bounds.size.width/2+self.BUTTON_SIZE/2+self.FRAME_THICKNESS, 0, self.BUTTON_DEPTH/2), size=self.clearButton.bounds.size})
  -- self.brushSizeDownButton:setBounds(ui.Bounds{pose=ui.Pose(self.controlPanel.bounds.size.width/2-self.BUTTON_SIZE/2-self.BUTTON_SIZE-self.FRAME_THICKNESS-self.SPACING, 0, self.BUTTON_DEPTH/2), size=self.brushSizeDownButton.bounds.size})  
  -- self.brushSizeUpButton:setBounds(ui.Bounds{pose=ui.Pose(self.controlPanel.bounds.size.width/2-self.BUTTON_SIZE/2-self.FRAME_THICKNESS, 0, self.BUTTON_DEPTH/2), size=self.brushSizeUpButton.bounds.size})

  -- -- Leftovers
  -- self.quitButton:setBounds(ui.Bounds{pose=ui.Pose(self.half_width - self.SMALL_BUTTON_SIZE/2, self.half_height+self.SPACING + self.SMALL_BUTTON_SIZE/2, self.BUTTON_DEPTH/2), size=self.quitButton.bounds.size})
end

return FlashCard