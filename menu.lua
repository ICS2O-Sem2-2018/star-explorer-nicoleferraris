
	local composer = require( "composer" )

	local scene = composer.newScene()

	-- -----------------------------------------------------------------------------------
	-- Code outside of the scene event functions below will only be executed ONCE unless
	-- the scene is removed entirely (not recycled) via "composer.removeScene()"
	-- -----------------------------------------------------------------------------------

	local function gotoGame()
		composer.gotoScene( "game", { time=500, effect="crossFade" } )
	end

	local function gotoHighScores()
		composer.gotoScene( "highscores", { time=800, effect="crossFade" } )
	end

	local function gotoLevels()
		composer.gotoScene( "levels", { time=800, effect="crossFade" } )
	end

	-- -----------------------------------------------------------------------------------
	-- Scene event functions
	-- -----------------------------------------------------------------------------------

	-- create()
	function scene:create( event )

		local sceneGroup = self.view
		-- Code here runs when the scene is first created but has not yet appeared on screen

		local background = display.newImageRect( sceneGroup, "die.png", 768, 1024 )
		background.x = display.contentCenterX
		background.y = display.contentCenterY

		local title = display.newImageRect( sceneGroup, "title.png", 500, 80 )
		title.x = display.contentCenterX
		title.y = 200

		local playButton = display.newText( sceneGroup, "Play", display.contentCenterX, 600, native.systemFontBold, 40 )
		local gradient = {
			type="gradient",
			color1={ 1, 0.2, 0.7 }, color2={ 1, 0.9, 0.5 }, direction="up"
		}
		playButton:setFillColor( gradient )

		local levelsButton = display.newText( sceneGroup, "Levels", display.contentCenterX, 690, native.systemFontBold, 40 )
		local gradient = {
			type="gradient",
			color1={ 1, 0.2, 0.7 }, color2={ 1, 0.9, 0.5 }, direction="up"
		}
			levelsButton:setFillColor( gradient )

		local highScoresButton = display.newText( sceneGroup, "High Scores", display.contentCenterX, 780, native.systemFontBold, 40 )
		local gradient = {
			type="gradient",
			color1={ 1, 0.2, 0.7 }, color2={ 1, 0.9, 0.5 }, direction="up"
		}
		highScoresButton:setFillColor( gradient )

		playButton:addEventListener( "tap", gotoGame )
		levelsButton:addEventListener( "tap", gotoLevels )
		highScoresButton:addEventListener( "tap", gotoHighScores )
	end

	-- show()
	function scene:show( event )

		local sceneGroup = self.view
		local phase = event.phase

		if ( phase == "will" ) then
			-- Code here runs when the scene is still off screen (but is about to come on screen)

		elseif ( phase == "did" ) then
			-- Code here runs when the scene is entirely on screen

		end
	end


	-- hide()
	function scene:hide( event )

		local sceneGroup = self.view
		local phase = event.phase

		if ( phase == "will" ) then
			-- Code here runs when the scene is on screen (but is about to go off screen)

		elseif ( phase == "did" ) then
			-- Code here runs immediately after the scene goes entirely off screen

		end
	end


	-- destroy()
	function scene:destroy( event )

		local sceneGroup = self.view
		-- Code here runs prior to the removal of scene's view

	end


	-- -----------------------------------------------------------------------------------
	-- Scene event function listeners
	-- -----------------------------------------------------------------------------------
	scene:addEventListener( "create", scene )
	scene:addEventListener( "show", scene )
	scene:addEventListener( "hide", scene )
	scene:addEventListener( "destroy", scene )
	-- -----------------------------------------------------------------------------------

	return scene
