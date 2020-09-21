local composer = require("composer")
local scene = composer.newScene()

function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then

      local toMenu = display.newText({
        parent = sceneGroup,
        text = "Домой",
        x = display.contentCenterX, y = 40,
        font = PROPS.font,
        fontSize = 75,
      })

      local pop = require("maket")
      local stats_group = display.newGroup()
      pop:createRects({
        countX=1,countY=5,
        h=4,w=right-200,
        x=centerX,y=500,
        indentX = 100, indentY = 80,
      })
      sceneGroup:insert(pop.rectGroup)


      function statistic()
        local y = 0
        local score = 80
        for i = 1, 5 do
          local kol = display.newText({
            parent = pop.rectGroup,
            text = score,
            width = 100,
            align = "right",
            x = (pop.box[i].x-pop.w/2)-70, y = y,
            font = PROPS.font,
            fontSize = 40,
          })
          kol:setFillColor(unpack(PROPS.color.cart))
          y = y + pop.indentY
          score = score - 20
        end

        local x_cr = -250
        local x_cradd = pop.w/6
        local week_text = {"ПН", "ВТ", "СР", "ЧТ", "ПТ", "СБ", "ВС"}
        for i = 1, 7 do
          local circl = display.newCircle(pop.rectGroup, x_cr, pop.box[#pop.box].y, 10)
          local week = display.newText({
            parent = pop.rectGroup,
            text = week_text[i],
            width = right,
            align = "center",
            x = x_cr, y = pop.box[#pop.box].y+60,
            font = PROPS.font,
            fontSize = 40,
          })
          week:setFillColor(unpack(PROPS.color.cart))

          x_cr = x_cr + x_cradd
        end
      end
      statistic()


      local sbros = display.newText({
        parent = sceneGroup,
        text = "Сбросить статистику",
        x = display.actualContentWidth-200, y = display.actualContentHeight-25,
        font = PROPS.font,
        fontSize = 40,
      })

      function sbros:touch(e)
        if (e.phase == "began") then
        end
        return true
      end
      sbros:addEventListener( "touch", sbros )

      function toMenu:touch(e)
        if (e.phase == "began") then
          composer.gotoScene("scene.menu", {time = 500, effect="crossFade"})
          composer.removeScene("scene.affair", {time = 500})
          display.remove( toMenu )
          toMenu = nil
        end
        return true
      end
      toMenu:addEventListener( "touch", toMenu )


      local score_text = display.newText({
        parent = sceneGroup,
        align = "left",
        width = 400,
        text = i18n("score")..": "..ACHIEVES.all_score,
        x =  left+260, y = top+220,
        font = PROPS.font,
        fontSize = 50,
        })

      local text ='Сыграно '..ACHIEVES.count_game..' раза\nОтвечено правильно '..ACHIEVES.all_right_answer..' раза'
      local case = display.newText({
        parent = sceneGroup,
        align = "left",
        text = text,
        x = display.contentCenterX, y = score_text.y+100,
        font = PROPS.font,
        fontSize = 50,
      })

      --local halfW = display.contentWidth * 0.5
      --local halfH = display.contentHeight * 0.5

    --Radian deogram
    --   local ragdogLib = require "scene.ragdogLib"
    --   local data = {
    --     radius = 100,
    --     values = {
    --       {percentage = 100-res, color = {118/255,113/255,112/255}},
    --       {percentage = res, color = {0.572,0.815,80/255}},
    --       }
    --     }
    -- local pie = ragdogLib.createPieChart(data)
    -- pie.x, pie.y = display.contentCenterX-200, display.contentCenterY-200
    -- sceneGroup:insert(pie)


    end
  end
scene:addEventListener("show", scene)
return scene
