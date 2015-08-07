--*********************************************************************************************
-- ====================================================================
-- Targo Tap Corona Version
-- ====================================================================
--
-- File: main.lua
--
-- Version 0.1
--
--
--*********************************************************************************************

-- change Status bar dark so you can see it on the light background
display.setStatusBar( display.DarkStatusBar )

-- include the Corona "composer" module
local composer = require "composer"

-- Corona is weird and makes you convert RGB colors to RGB percent. Do that here: http://www.colorhexa.com/
display.setDefault("background", .847, .871, .749) --Remember to change 

-- load menu screen
composer.gotoScene( "menu" )
