local B = {}
local group
local group2
local group3
B.box = {}
B.med = {}

function B.react(t,scene)
  group = display.newGroup()
  local tabl = t
  local x, y = tabl.x, tabl.y
  local k = 1
  for i = 1, tabl.arrey.x do
    for j = 1, tabl.arrey.y do
      B.box[k] = display.newRoundedRect(group, x, y, tabl.w, tabl.h, tabl.r)--:setFillColor(tabl.color.r, tabl.color.b, tabl.color.g )
      B.box[k]:setFillColor(tabl.color.r, tabl.color.b, tabl.color.g )
      B.box[k].tag = k
      B.box[k].tap = true
      y = y + tabl.vr
      k = k + 1
    end
    y = tabl.y
    x = x + tabl.vr
  end
  group.anchorChildren = true
  group.anchorX, group.anchorY  = 0.5, 0.5
  group.x, group.y = display.contentCenterX, display.contentCenterY+270--340 --КОСТЫЛь!!!!!!!!!!!
  scene:insert(group)
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

B.tumb = true
function B:remove()
  local n = n
  full = self.markup.arrey.x * self.markup.arrey.y
  transition.to(group2, { time = 400, delay = 700, alpha = 0,
    onComplete = function()
      for i = 1, full do
        B.box[i]:setFillColor(self.markup.color.r, self.markup.color.b, self.markup.color.g )
        B.box[i].tap = true
      end
      group2:removeSelf()
      B:image()
      B.tumb = true
    end})
end

return B