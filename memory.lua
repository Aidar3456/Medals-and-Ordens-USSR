--
--Грандиент массив
-- local p2 = 10
-- local p = 32
-- local t = 21
-- local cv = 0.1
-- for i = 1, 819 do
--   if (i > t) then
--     p = p + 32
--     t = t + 21
--     p2 = 10
--     cv = cv + 0.08
--   end
--   local h = 32
--   p2 = p2+32
--   yu[i] = display.newRoundedRect(p2, p , 32, 32, 1)
--   yu[i]:setFillColor( 1+i/(p+1000), 0+i/1000, cv)
-- end
--
-- local Rect = display.newRoundedRect(box, 200, 720, 320, 320, 12 )
--       Rect:setFillColor( 1, 1, 1 )
--
-- local Rect = display.newRoundedRect(box, 200, 1050, 320, 320, 12 )
--       Rect:setFillColor( 1, 1, 1 )
--
-- local Rect = display.newRoundedRect(box, 530, 720, 320, 320, 12 )
--       Rect:setFillColor( 1, 1, 1 )
--
-- local Rect = display.newRoundedRect(box, 530, 1050, 320, 320, 12 )
--       Rect:setFillColor( 1, 1, 1 )


-- ---[[
-- local composer = require( "composer" )
--
-- local options = {
--     effect = "fade",
--     time = 500,
--     params = {
--         someKey = "someValue",
--         someOtherKey = 10
--     }
-- }
-- composer.gotoScene( "menu", options )
-- --]]
--
--
-- local composer = require( "composer" )
--
-- local scene = composer.newScene()
--
-- -- -----------------------------------------------------------------------------------
-- -- Code outside of the scene event functions below will only be executed ONCE unless
-- -- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -- -----------------------------------------------------------------------------------
--
--
--
--
-- -- -----------------------------------------------------------------------------------
-- -- Scene event functions
-- -- -----------------------------------------------------------------------------------
--
-- -- create()
-- function scene:create( event )
--
--     local sceneGroup = self.view
--     -- Code here runs when the scene is first created but has not yet appeared on screen
--
-- end
--
--
-- -- show()
-- function scene:show( event )
--
--     local sceneGroup = self.view
--     local phase = event.phase
--
--     if ( phase == "will" ) then
--         -- Code here runs when the scene is still off screen (but is about to come on screen)
--
--     elseif ( phase == "did" ) then
--         -- Code here runs when the scene is entirely on screen
--
--     end
-- end
--
--
-- -- hide()
-- function scene:hide( event )
--
--     local sceneGroup = self.view
--     local phase = event.phase
--
--     if ( phase == "will" ) then
--         -- Code here runs when the scene is on screen (but is about to go off screen)
--
--     elseif ( phase == "did" ) then
--         -- Code here runs immediately after the scene goes entirely off screen
--
--     end
-- end
--
--
-- -- destroy()
-- function scene:destroy( event )
--
--     local sceneGroup = self.view
--     -- Code here runs prior to the removal of scene's view
--
-- end
--
--
-- -- -----------------------------------------------------------------------------------
-- -- Scene event function listeners
-- -- -----------------------------------------------------------------------------------
-- scene:addEventListener( "create", scene )
-- scene:addEventListener( "show", scene )
-- scene:addEventListener( "hide", scene )
-- scene:addEventListener( "destroy", scene )
-- -- -----------------------------------------------------------------------------------
--
-- local r = 1
-- local myText = display.newText( display.fps, 100, 200, native.systemFont, 16 )
-- myText:setFillColor( 1, 0, 0 )
--
-- -------
-- _G.myVariable = 25 --глобальная переменная
-- print(myVariable)
-- -------
-- --[[
-- math.randomseed(os.time()) -- random initialize
-- for x = 1,5 do
--   -- random generating
--   value = math.random(0,9)
--   print(value)
-- end
-- -------]]
--
-- --группа
-- local weightGroup = display.newGroup()
--   local object = display.newImage("1.jpg")
--
--   object.fill.effect = "filter.blurGaussian"
--
--   object.fill.effect.horizontal.blurSize = 20
--   object.fill.effect.horizontal.sigma = 140
--   object.fill.effect.vertical.blurSize = 20
--   object.fill.effect.vertical.sigma = 140
--   weightGroup:insert(object)
--   --local object = display.newImage("1.jpg")
--   p = 0.3
--   object:scale( p, p ) --размер
--   object.x = 130
--   object.y = 350
--   object.alpha = 1 --прозрачность от 0 до 1
-- ----Отвечает за сенсорное нажатие
-- local g = 10
--       d = 10
-- object.id = "ball object"
-- function object:touch()
--     if ( g == d ) then --если переменные равны то объект удалится
--         object:removeSelf()
--         object = nil
--     end
--     return true
-- end
-- object:addEventListener( "touch", object )
-- ------------------------------
-- local f = 10
--       t = 10
-- local function myFunc()
--     if ( f == t ) then
--        obj = display.newImage("2.jpg")
--        print("TER")
--     end
-- p = 0.3
-- object:scale( p, p ) --размер
-- object.x = 130
-- object.y = 120
-- object.alpha = 1
-- end
-- ------------------------
-- --Массив
-- local tableWithIndexes = { first = 10, second = 20, third = 30, fourth = 40, fifth = 50 }
--
-- for key, value in next, tableWithIndexes, nil do
--     print( "The key " .. key .. " has the value: " .. value )
-- end
-- -----------------------
--
-- grass_block = {} -- массив блоков
--   for i = 0,5 do
--     grass_block[i] = display.newImage("icon.png")
--     grass_block[i].x = grass_block[i].x+i*54
--     print(i)
--   end
--
-- --[[ --массив изображений
--   local filenames = {
--     "icon.png",
--     "icon-xxxhdpi.png",
--     "icon-xhdpi.png",
--     "icon-ldpi.png",
--     "icon-mdpi.png"
-- }
--
-- -- Pre-load textures to memory
-- local textures = {}
-- for i = 1,#filenames do
--     textures[i] = graphics.newTexture(
--         {
--             type = "image",
--             filename = filenames[i],
--             baseDir = system.ResourceDirectory
--         })
--     textures[i]:preload()
--     print(i)
-- end
-- ]]
-- --[[
-- math.randomseed(os.clock()*100000000000)
-- for i=1,3 do
--     math.random(10000, 65000)
--   print(i)
-- end
-- --]]
-- return scene
--
--
-- function GroupText2:touch(event)
--   if ( event.phase == "began" ) then
--     if (0 < i and i < 56) then
--       print(i)
--      if ( tumb == true ) then
--        display.remove( med )
--        med = nil
--        i = i + 1
--        mer = display.newImage(fs[i])
--           mer:scale( 0.6, 0.6 )
--           mer.x = display.contentCenterX
--           mer.y = 550
--        gr:insert(mer)
--        i = i + 1
--        med = display.newImage(fs[i])
--           med:scale( 0.6, 0.6 )
--           med.x = display.contentCenterX
--           med.y = 550
--           med.isVisible = false
--        tumb = false
--        gr:insert(med)
--      elseif (mer.isVisible == false) then
--        display.remove( med )
--        med = nil
--        mer.isVisible = true
--        i = i + 1
--        med = display.newImage(fs[i])
--           med:scale( 0.6, 0.6 )
--           med.x = display.contentCenterX
--           med.y = 550
--           med.isVisible = false
--        gr:insert(med)
--      elseif (med.isVisible == false) then
--        display.remove( mer )
--        mer = nil
--        med.isVisible = true
--        i = i + 1
--         if (i < 56 ) then
--           mer = display.newImage(fs[i])
--              mer:scale( 0.6, 0.6 )
--              mer.x = display.contentCenterX
--              mer.y = 550
--              mer.isVisible = false
--           gr:insert(mer)
--         end
--      end
--     end
--   end
--   return true
-- end
-- GroupText2:addEventListener( "touch", GroupText2 )



--Функции отвечающие за перемищение
-- _W = display.contentWidth
-- _H = display.contentHeight
--
-- -- Создаем круг
-- local ciX = _W/2
-- local ciY = _H/2
-- local ciR = 30
--
-- local ci = display.newCircle(ciX, ciY, ciR)
-- -- Делаем заливку серым цветом
-- ci:setFillColor(12, 12, 12)
--
-- -- Создаем listener и функцию для перетаскивания только круга по экрану
-- -- Создаем функцию
-- function ci_move (event)
--         -- Задаем координаты круга
--         ci.x = event.x
--         ci.y = event.y
--         -- если точка нажатия на экран будет перемещать круг за границы экрана, то задаем значение граница экрана минус радиус
--         if ci.x < ciR then
--                 ci.x = ciR
--         end
--         if ci.x > _W-ciR then
--                 ci.x = _W-ciR
--         end
--         if ci.y > _H-ciR then
--                 ci.y = _H-ciR
--         end
--         if ci.y < ciR then
--                 ci.y = ciR
--         end
--         -- меняем цвет круга, когда он moved
--         ci:setFillColor(0, 255, 0)
--
--         -- Если событие ended, то меняем цвет круга обратно
--         if event.phase == "ended" then
--                 ci:setFillColor(12, 12, 12)
--         end
-- end
-- -- Добавляем listener для ci
-- ci:addEventListener("touch", ci_move)
--
--
-- local rect = display.newRect ( 50, 50, 50, 50 )
-- function e ( e )
--   rect.x = e.x
--   rect.y = e.y
-- end
-- rect:addEventListener ( "touch", e )
