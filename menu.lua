--*********************************************************************************************
-- ====================================================================
-- Targo Tap Corona Version
-- ====================================================================
--
-- File: menu.lua
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

-- forward declarations and other locals
local playBtn

-- 'onRelease' event listener for playBtn
local function onPlayBtnRelease()
	-- go to game.lua scene
	composer.gotoScene( "game", "fade", 500 )
	return true	-- indicates successful touch
end

function scene:create( event )
	local sceneGroup = self.view
    --Text
    local myTextObject = display.newText( "TARGO TAP", display.contentWidth/2, display.contentHeight/6, "Calibri", 60 )
    myTextObject:setFillColor(.27, .651, 60)
    local differentText = display.newText( "Fresh!", display.contentWidth/2, display.contentHeight/4.5, "Calibri", 40 )
    differentText:setFillColor(.27, .651, 60)

    -- Create the widget
    playBtn = widget.newButton {
        label = "Play Targo Tap",
        onEvent = onPlayBtnRelease,
        --properties for a rectangle button...
        shape = "Rect",
        width = display.contentWidth,
        height = display.contentHeight/3,
        cornerRadius = 2,
        labelColor = { default = { .031, .651, .094, 1 }, over = { .616, .82, .58, 1} },
        fillColor = { default={ .51, .941, .51, 1 }, over={ .616, .82, .58, 0.4 } },
        strokeColor = { default={ .031, .651, .094, 1 }, over={ .616, .82, .58, 1 } },
        strokeWidth = 1,
        fontSize = 50
    }

    -- Center the button
    playBtn.x = display.contentCenterX
    playBtn.y = display.contentCenterY
    
    sceneGroup:insert( myTextObject )
	sceneGroup:insert( differentText )
	sceneGroup:insert( playBtn )
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
	
	if playBtn then
		playBtn:removeSelf()	-- widgets must be manually removed
		playBtn = nil
	end
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene