local class = require('pl.class')
local FlashCard = require("flashCard")


class.CardPile(ui.View)

CardPile.assets = {
  quit = Asset.Base64("iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAAABHNCSVQICAgIfAhkiAAABUtJREFUeJztm+1TGlcUxp9dcEEQ1wFl7VjT5sXMRE3SWmOssUkax6oBtNM/r39DJ8bXWKNJG3XaRGPbqJlpY0zrS+sC4cUFFYHdfohaQMC9cLc6kOfj7p5nz/l593Dv3pX5dvapgiLVxMoy2JNO4qQ0sbIMAMUJ4KB4oAgBJBYPFBmA1OKBIgKQrnigSABkKh4oAgDZigcKHMBxxQMFDEBN8UCBAlBbPFCAAEiKBwB9LjfZDEm5hGmuRbdIHFNwI4BU7wFoaa4PhaAPBDNfoHYhrmi3YtcMQEkgAKF/EMLQCHThcPqLmON9TCtv8MF398Du7NJNcF+aAODcHlT3D0AvSdBLEuxDI2AjEWKf0r9WUTk+Ac7jhTAwqAkE6gCM6xuoHhxOSpbz+WEfeQAmFiPyqRobByPLhx7CwCB04W2q+VIFYF5+DWHkAZi9vSPnDJsi7GPjwH5B2WT4ZxP20TEw8XjScc7nR3X/fZQEs/QVQlEDYFl6icqHk0BK0okyrq6hcvJx+ua3f4xzu2EfHs04WvRbEoR7A+A8XgpZUwLAz83D+uOUqm5tfrUM68zM0RMM3j3rQ6Ngo9GsHrqdHQj3B2HY+DvXlA+VNwBdeBvlLxaIYiwvFsHPzScdK/H5IAyrb5ZsNApheBTGPCHkBCDx7xw3m+B2dEMuKSHyqHg2C8vSSwBASTAIYXCEuMtHbTbs2auIYlJF5RGICAI83Z1QWDI765NpWBaWYB8Yhm6brLvvVdoguu4Sg08VtSa4W1sLb2cHWZCiwDo1DX0oRBQWtVohupyQDQay+6VR/gASnoft8+fgu9met2U2RXkeossBudRIxS9vAErKdFZqbECwpTlf27SKlVsg9rkQN5uoeWoyFQ40fwbpciNVz1hZGcReF+JlZqq+mi2GfO03EK67QMUrbjLB3edErNxCxS9R2i2HGcDb8SV2z9TmZSOXGiH2OhDleUqJJUvbFyIsC3f3Vzn/VssGA0SXE1GrlXJi/0n7N0IsC5njcgqN2KuwZ7NRTihZ2gKQZVR+/xDG9Y2cwkvX1mGdmqacVLK0A6AoqJx4BNObP/OysSwuoWL2OZ2c0kgbAApge/QDzMuvqdjxs3OwLCxS8UoVfQCKAtuTKZT9/gdVW+vUDMyvyDY91Ig6AOvMTyjbX+XRlm3yMYyra1Q9qQKo+PkpLITvBkjEyDLsY+PgRDc1T2oAKuaeg5//lSyIYbB99mOykFgMwvAoOL+f7F4ZRAVA+S+/gX82Rxznb2uFp6cLW1evEMWxkQiqhkahl/Lfo6QCQDZwAKNilyNBgdbrh4X721oRvlhHFK8PhWBZzL/X5AQgtdRQ/SV4ujoBnU5VfLC5CcGmTxIMGXjv3MbOR2dU5yBdaYS/9brq6zMp7xFwAGP73FmIzh4ox0x7tz69ikDLtTSZsPB0dSJSXX3sPQMt1+Brv6Fqa+04Uf0V2K2pwWafE/HS0rTnpcuN8H/emjFe0evhdnQjasuw+GEY+G59gWBzE410AWgwD9irqoL4TR/i5uQXF6H6S/C1tx0b/24F6Di69tfp4O3sgNRQTzNdbabCUZ6H+LXrEEL4Yh3e3rqpulHGTSa4XY7DkaRwHERHD8IXzlPPVbPF0AEEqbEBb+/cJn5eozwPt/MuYuXl2Ox1YvfDGi3SBJPL/wv8n98IMbKser+hIL8RIt1sIdWpB6C13gM46QROWjl9KJlLszmtIh4BpJ+innYRASi04gECAIVYPKCiBxRq4QfKOgIKvXggC4BiKB7IAKBYigfSACim4oGEJlhshR+IBYq3eAD4FzLNyUTM0XqEAAAAAElFTkSuQmCC"),
}

function CardPile:_init(bounds)
  self:super(bounds)

  self.PI = 3.141592
  self.pictionaryWordList = {"cat","sun","cup", "ghost","flower","pie", "cow","banana","snowflake", "bug","book","jar", "snake","light","tree", "lips","apple","slide", "socks","smile","swing", "coat","shoe","water", "heart","hat","ocean", "kite","dog","mouth", "milk","duck","eyes", "skateboard","bird","boy", "apple","person","girl", "mouse","ball","house", "star","nose","bed", "whale","jacket","shirt", "hippo","beach","egg", "face","cookie","cheese", "ice","cream","cone", "spoon","worm","spider", "bridge","bone","grapes", "bell","jellyfish","bunny", "truck","grass","door", "monkey","spider","bread", "ears","bowl","bracelet", "alligator","bat","clock", "lollipop","moon","doll", "orange","ear","basketball", "bike","airplane","pen", "inchworm","seashell","rocket", "cloud","bear","corn", "chicken","purse","glasses", "blocks","carrot","turtle", "pencil","horse","dinosaur", "head","lamp","snowman", "ant","giraffe","cupcake", "chair","leaf","bunk", "snail","baby","balloon", "bus","cherry","crab", "football","branch","robot"}

  self.globalCardControlTable = {}

  -- +======
  -- | handID : {card, ...}
  -- |        :
  -- |        :
  

  -- DECK SURFACE
  self.deck = Surface(bounds)
  self.deck:setColor({0.8, 0.4, 0.2, 1})
  self:addSubview(self.deck)

  -- CARD HOLDING CONTAINER
  -- self.cardHolder = Surface(ui.Bounds(0,1,0,   0.4, 0.6, 0.001))
  -- self.cardHolder:setColor({1, 1, 1, 0.2})
  -- self:addSubview(self.cardHolder)
  -- self.cardHolder.hasTransparency = true

  self:layout()
end

function CardPile:specification()
  return ui.View.specification(self)
end

function CardPile:_getRandomizedWord()
  local randomIndex = math.random(#self.pictionaryWordList)
  return self.pictionaryWordList[randomIndex]
end

function CardPile:spawnCard(pointer)
  
  local currentUserCard = self.globalCardControlTable[pointer.hand.id]
  if currentUserCard then
    --remove the current card before creating a new one
    currentUserCard:removeFromSuperview()
  end
  
  -- create a new card
  local randomWord = self:_getRandomizedWord()
  local card = FlashCard(ui.Bounds(0,0.2,0,   0.4, 0.2, 0.001), randomWord)

  currentUserCard = card
  self.globalCardControlTable[pointer.hand.id] = currentUserCard

  print("currentUserCard", currentUserCard)
  self.app:openPopupNearHand(card, pointer.hand, 0.2)
  
  self:layout()
end

function CardPile:onTouchDown(pointer)
  print("touching the pile")
  self:spawnCard(pointer)
end

function CardPile:update()
  print("CardPile:update()")
end

function CardPile:layout()
  -- self.cardHolder.bounds.size.width = #self.cardHolder.subviews * 0.4 + (#self.cardHolder.subviews + 1) * 0.2
  -- self.cardHolder:setBounds()

  -- print("self.cardHolder.bounds.size.width", self.cardHolder.bounds.size.width)

  -- for i, card in pairs(self.cardHolder.subviews) do
  --   print(i)
  --   print(card.bounds.size.width)
  --   print(card.bounds.pose.x)
  --   card.bounds.pose.x = ((i - 1) * 0.4) + 0.1

  --   card:setBounds()
  -- end

  

end

return CardPile