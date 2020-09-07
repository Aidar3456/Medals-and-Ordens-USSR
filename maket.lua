local B = {}

--self.random_numbers = {}
--B.random_steps = 1
function B:random(count, size_list, random_numbers) --два странных пареметра возможны BUGs
  self.randomList = {}
  self.random_numbers = random_numbers or {}
  self.count = count or 1
  self.size_list = size_list or 1
  self.random_steps_start = 1
  self.random_steps_end = count

  if (#self.random_numbers == 0) then
	  for i = 1, self.size_list do
	    self.random_numbers[i] = i
	  end
  end

  function self.notRepeat() -- Yates shuffle's algorithm (Sottolo)
    local i = #self.random_numbers
    while i > 1 do
      i = i - 1
      local j = math.random(i)
      self.random_numbers[j], self.random_numbers[i] = self.random_numbers[i], self.random_numbers[j]
    end
     self.randomList = self.random_numbers
    return self
  end

  self.finish_step = false
  function self.step()
    local j = 1
    self.randomList = {}
    for i = self.random_steps_start, self.random_steps_end do
      self.randomList[j] = self.random_numbers[i]
      j = j + 1
    end
    self.random_steps_start = self.random_steps_start + count
    self.random_steps_end = self.random_steps_end + count
    if (self.random_steps_end > self.size_list) then
      self.finish_step = true
      self.random_steps_start = 1
      self.random_steps_end = count
    -- return self
    elseif (self.finish_step == true) then
      self.finish_step = false
     return self
    end
    return self
  end

  function self.returnOneNumber()
    return self.randomList[math.random(1,#self.randomList)]
  end

  return self
end

function B:createRects(t)
  self.rectGroup = t.rectGroup or display.newGroup()
  self.setFillColor = t.collor or {unpack(PROPS.color.cart)}
  self.x, self.y = 0, 0
  self.globalX, self.globalY = t.x, t.y
  self.w, self.h = t.w or 10, t.h or 10
  self.r = t.r or 10
  self.countX, self.countY = t.countX or 1, t.countY or 1
  self.indentX, self.indentY = self.w + (t.indentX or 20), self.h + (t.indentY or 20)
  self.box = {}
  self.numbersList = t.numbersList or {}
  self.mainScene = display.newGroup()

  local k = 1
  for i = 1, self.countX do
    for j = 1, self.countY do
      self.box[k] = display.newRoundedRect( self.rectGroup, self.x, self.y, self.w, self.h, self.r)
      self.box[k]:setFillColor(unpack(self.setFillColor))
      self.box[k].tag = k
      self.box[k].tap = true
      self.y = self.y + self.indentY
      k = k + 1
    end
	self.y = 0
    self.x = self.x + self.indentX
  end
  self.rectGroup.x,self.rectGroup.y = self.globalX, self.globalY
  self.mainScene:insert(self.rectGroup)

  self.med = {}
  --self.imagesGroup = display.newGroup()
  function self:imagesMedal(t)
    local imagesGroup = display.newGroup()--self.imagesGroup = display.newGroup()
    for i = 1, #t do
        self.med[i] = display.newImage(imagesGroup, "img/medali_ten/" .. t[i] .. ".png", self.box[i].x, self.box[i].y)
        self.med[i]:scale(0.9*(320/self.med[i].height), 0.9*(320/self.med[i].height)) --КОСТЫЛь!!!
        self.med[i].tag = i
    end
	imagesGroup.x, imagesGroup.y = self.rectGroup.x, self.rectGroup.y
    self.mainScene:insert(imagesGroup)
	return imagesGroup --self.imagesGroup
  end

  function self:imagesKolodki(t)
    local imagesGroup = display.newGroup()
	local kol = {}
	for i = 1, #t do
          kol[i] = display.newImage(imagesGroup, "img/kolodki/"  .. t[i] .. ".png", self.box[i].x, self.box[i].y)
          kol[i]:scale(0.9*(120/kol[i].height), 0.9*(120/kol[i].height))--КОСТЫЛь!!!
          kol[i].tag = i
     end
	imagesGroup.x, imagesGroup.y = self.rectGroup.x, self.rectGroup.y
	self.mainScene:insert(imagesGroup)
    return imagesGroup
  end

  function self:oneImages(words,number)
  end

  function self:oneText(words,number)
    self.medText = display.newText({
        parent = self.mainScene,
        text = words[number],
        width = display.contentWidth-30,
        align = "center",
        x = display.contentCenterX, y = self.rectGroup.y-420, --КОСТЫЛь!!!
        font = PROPS.font,
        fontSize = 60--/((utf8.len(words[number]))/10), --КОСТЫЛь!!!
      })
    return self.medText
  end

  function self:textsMedals(words,t)
    local imagesGroup = display.newGroup()
	local kol = {}
	for i = 1, #t do
      kol[i] = display.newText({
        parent = imagesGroup,
        text = words[t[i]],
        width = display.contentWidth,
        align = "center",
        x = self.box[i].x, y = self.box[i].y,
        font = PROPS.font,
        fontSize = 640/math.floor(string.len(words[t[i]]))+65,
      })
          kol[i].tag = i
     end
	imagesGroup.x, imagesGroup.y = self.rectGroup.x, self.rectGroup.y
	self.mainScene:insert(imagesGroup)
    return imagesGroup
  end

  function self:remove(obj, func)
	local func = func or function() end
    local props = PROPS.animation.object
    transition.to(obj, {time = props.time, delay = props.delay, alpha = props.alpha,
    onComplete = function()
      obj:removeSelf()
	  func()
    end})
  end

  function self:resetColor(obj)
    for i = 1, #obj do
      obj[i]:setFillColor(unpack(PROPS.color.cart))
      obj[i].tap = true
    end
  end

  return self
end

return B
