--*********************************************************************************************
-- ====================================================================
-- Targo Tap Corona Version
-- ====================================================================
--
-- File: gameover.lua
--
-- Version 0.1
--
--
--*********************************************************************************************

-- define widget
local widget = require("widget");

-- include the Corona "composer" module
local composer = require "composer"
local scene = composer.newScene()

local function onBackBtnRelease() 
    composer.gotoScene( "menu", "fade", 100 )
    return true
end

function scene:create( event )
	local sceneGroup = self.view
    local gameoverText = display.newText("GAME OVER", display.contentCenterX, display.contentHeight/3, native.systemFontBold, 65)
    backBtn = widget.newButton {
        label = "Back",
        onRelease = onBackBtnRelease,
        --properties for a rectangle button...
        shape = "Rect",
        width = display.contentWidth,
        height = display.contentHeight/4,
        cornerRadius = 0,--rgb(148, 210, 206) --rgb(0, 165, 155)
        labelColor = { default = { .031, .651, .094, 1 }, over = { .000, .551, .000, 1} },
        fillColor = { default={ .616, .82, .58, 1 }, over={ .031, .651, .094, 0.4 } },
        fontSize = 70
    }
    
    -- Center the button
    backBtn.x = display.contentCenterX
    backBtn.y = display.contentCenterY + (display.contentHeight/2.5);
    
    sceneGroup:insert( backBtn )
    sceneGroup:insert( gameoverText )
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then
		-- Called when the scene is now off screen
	end	
end

function scene:destroy( event )
	local sceneGroup = self.view
	
	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene