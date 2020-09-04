local B = {}
local group
local group2
local group3


--self.random_numbers = {}
--B.random_steps = 1
function B:random(count, size_list, random_numbers) --два странных пареметра возможны BUGs
  self.randomList = {}
  self.random_numbers = random_numbers or {}
  self.count = count or 1
  self.size_list = size_list or 1
  self.random_steps_start = 1
  self.random_steps_end = count
  
  if #self.random_numbers == 0 then
	for i = 1, self.size_list do
	  self.random_numbers[i] = i
	end
  end
  function self.notRepeat()
    --local count_nil = 0
	local size = #self.random_numbers
	print(unpack(self.random_numbers))
      while #self.randomList < self.count do -- <--BUG!!! 
        local i = math.random(1, size)
        if self.random_numbers[i] ~= nil then
          self.randomList[#self.randomList+1] = self.random_numbers[i]
          self.random_numbers[i] = nil
          --collectgarbage() print(collectgarbage ("count"))
          else 
            -- count_nil = count_nil + 1
            -- print("hhh ",count_nil)
            -- if count_nil == #self.random_numbers then
             -- --break
            -- end
          end
       end
    return self
  end
  
  self.save_random_numbers = self.random_numbers
  function self.steps() --срез
    self.random_numbers = {}
    for i = self.random_steps_start, self.random_steps_end do
	  self.random_numbers[i] = self.save_random_numbers[i]
	end 
	self.random_steps_start = self.random_steps_start + count
	self.random_steps_end = self.random_steps_end + count
	self.finish = true 
	if self.random_steps_end > self.random_steps_end then
	  return self, self.finish 
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
  self.setFillColor = t.collor or {190/255,215/255,239/255}
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
		print(t[1])
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
        text = words[number], --utf8.match(nazv[nameMedal], "%S+").."\n"..utf8.match(nazv[nameMedal], "%S+(.*)")
        width = display.contentWidth,
        align = "center",
        x = display.contentCenterX, y = self.rectGroup.y-420, --КОСТЫЛь!!!
        font = "font/Blogger_Sans-Bold.otf",
        fontSize = 640/math.floor(string.len(words[number]))+65, --КОСТЫЛь!!!
      })
    return self.medText 
  end
 
  function self:textsMedals(words,t)
    local imagesGroup = display.newGroup()
	local kol = {}
	for i = 1, #t do
      kol[i] = display.newText({
        parent = imagesGroup,
        text = words[t[i]], --utf8.match(nazv[nameMedal], "%S+").."\n"..utf8.match(nazv[nameMedal], "%S+(.*)")
        width = display.contentWidth,
        align = "center",
        x = self.box[i].x, y = self.box[i].y,
        font = "font/Blogger_Sans-Bold.otf",
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
    transition.to(obj, { time = 400, delay = 700, alpha = 0,
    onComplete = function()
      obj:removeSelf()
	  func()
    end})
  end
  
  function self:resetColor(obj)
    for i = 1, #obj do
      obj[i]:setFillColor(190/255,215/255,239/255)
      obj[i].tap = true
    end
  end
  
  return self
end

function B:image(t)
  group2 = display.newGroup()
  full = self.markup.arrey.x * self.markup.arrey.y -- общие колличество ячеек
  group2.anchorChildren = true
  group2.anchorX, group2.anchorY  = 0.5, 0.5
  group2.x, group2.y = group.x, group.y
  -----------------
  if (self.markup.id == "medal") then
    if (t == true) then
     medText = display.newText({ --утечка памяти, переменная ГЛОБАЛЬНАЯ!!!! КОСТЫЛь!!!!!!!
        parent = self.scene,
        text = self.words[self.randomMedal], --utf8.match(nazv[nameMedal], "%S+").."\n"..utf8.match(nazv[nameMedal], "%S+(.*)")
        width = display.contentWidth,
        align = "center",
        x = display.contentCenterX, y = self.markup.y+320,
        font = "font/Blogger_Sans-Bold.otf",
        fontSize = 640/math.floor(string.len(self.words[self.randomMedal]))+65,
      })
    end
    medText.text = self.words[self.randomMedal]
    for i = 1, full do
        B.med[i] = display.newImage(group2, "img/medali_ten/" .. self.table[i] .. ".png", B.box[i].x, B.box[i].y)
        B.med[i]:scale(0.9*(320/B.med[i].height), 0.9*(320/B.med[i].height)) --КОСТЫЛь!!!
        B.med[i].tag = i
    end

    --------------------
    elseif (self.markup.id == "text") then
      if (t == true) then
        group3= display.newGroup()
        B.box[#B.box+1] = display.newRoundedRect(self.scene, self.markup.rect.x, self.markup.rect.y+420, self.markup.rect.w, self.markup.rect.h, self.markup.rect.r)
        B.box[#B.box]:setFillColor(self.markup.color.r, self.markup.color.b, self.markup.color.g )
      for i = 1, full do
        B.med[i] = display.newText({
                parent = group3,
                text =  self.words[self.table[i]],
                width = 620,
                align = "center",
                x = B.box[i].x, y = B.box[i].y,
                font = "font/Blogger_Sans-Bold.otf",
                fontSize = 620/string.len(self.words[self.table[i]])+32,
              })
        end
              group3.anchorChildren = true
              group3.anchorX, group3.anchorY  = 0.5, 0.5
              group3.x, group3.y = group.x, group.y
              self.scene:insert(group3)
      end
      for i = 1, full do
        B.med[i].text = self.words[self.table[i]]
      end
      B.med[#B.med+1] = display.newImage(group2, "img/medali_ten/" .. self.randomMedal .. ".png", 0, 0)
      B.med[#B.med]:scale(1,1)
    --  B.med[#B.med].tag = i
      group2.x, group2.y = group.x, group.y-560 --КОСТЫЛь!!!!!!!!!!!

    ----------------------
    elseif (self.markup.id == "kolodki") then
      if (t == true) then
        group3  = display.newGroup()
        B.box[#B.box+1] = display.newRoundedRect(self.scene, self.markup.rect.x, self.markup.rect.y+420, self.markup.rect.w, self.markup.rect.h, self.markup.rect.r)
        B.box[#B.box]:setFillColor(self.markup.color.r, self.markup.color.b, self.markup.color.g )
      end
      B.box[#B.box+1] = display.newImage(group3, "img/medali_ten/" .. self.randomMedal .. ".png", 0, 0)
      B.box[#B.box]:scale(1,1)
      for i = 1, full do
          B.med[i] = display.newImage(group2, "img/kolodki/"  .. self.table[i] .. ".png", B.box[i].x, B.box[i].y)
          B.med[i]:scale(0.9*(120/B.med[i].height), 0.9*(120/B.med[i].height))
          B.med[i].tag = i
      end

    end
    self.scene:insert(group2)
end


return B