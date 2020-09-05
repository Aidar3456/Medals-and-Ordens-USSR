local composer = require( "composer" )
------------------------------------------
--GLOBAL VARIABLE
------------------------------------------
centerX    = display.contentCenterX
centerY    = display.contentCenterY
fullw      = display.actualContentWidth
fullh      = display.actualContentHeight
left       = centerX - fullw/2
right      = left + fullw
top        = centerY - fullh/2
bottom     = top + fullh
------------------------------------------

local loadsave  = require("lib.loadsave")
local props = loadsave.loadTable( "settings.json" )

PROPS   = {}
ACHIEVES = {}
print(0/255, 143/255, 126/255)
if props ~= nil then
  PROPS= props.settings
  ACHIEVES  = props.game_achieve
else
  local tabl = {
    settings = {
     color = {
       background = {0,	0.560,	0.494},
       up_bar = {},
       achieve = {},
       text = {},
       right = {},
       mistake = {},
     },
     font = "font/Blogger_Sans-Bold.otf",
     font_size = 80,
     music = true,
     sounds = true,
     lang = "ru",
     animation = {
       scene = {delay = 100, time = 300, effect="crossFade"},
       object = {time = 400, delay = 700, alpha = 0},
     }
    },
    game_achieve = {
      all_score = 0,
      all_right_answer = 0,
      all_mistake_answer = 0,
      all_time = 0,
      middle_time = 0,
      count_game = 0,
      achieve_name = {},
      week_progres = {},
      recent_visit = {},
    }
  }
  PROPS = tabl.settings
  ACHIEVES  = tabl.game_achieve
  loadsave.saveTable(tabl, "settings.json")
end

i18n = require('lib.i18n.init')
i18n.load(require('lib.i18n.languages'))
i18n.setLocale(PROPS.lang)
--i18n.loadFile(system.pathForFile(system.ResourceDirectory) ..'/lib/i18n/ru.lua') -- load French language file

print("sdsdsds %{age}", 3)
print(i18n('good_bye')) -- Good-bye!


local background = display.setDefault("background", 0/255, 143/255, 126/255 )
composer.gotoScene("scene.menu", PROPS.animation.scene)
