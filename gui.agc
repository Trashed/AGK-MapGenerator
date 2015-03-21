// ##########################################
//
//					gui.agc
// ##########################################




function CreateGui()
	
	// Create side panel with other widgets such as Save and Load buttons etc.
	g_GuiSidePanel = createSprite( 0 )
	setSpriteColor( g_GuiSidePanel, 10, 50, 255, 70 )
	setSpriteSize( g_GuiSidePanel, 300, g_DeviceHeight - 200 )
	setSpritePosition( g_GuiSidePanel, 0, 0 )
	setSpriteDepth( g_GuiSidePanel, 10000 )
	
	// Save button
	createSprite( BTN_SAVE, loadImage( "btn_save.png" ) )
	setSpriteScale( BTN_SAVE, 0.3, 0.3 )
	setSpritePosition( BTN_SAVE, 10, 10 )
	
	// Load button
	createSprite( BTN_LOAD, loadImage( "btn_load.png" ) )
	setSpriteScale( BTN_LOAD, 0.3, 0.3 )
	setSpritePosition( BTN_LOAD, getSpriteWidth( BTN_SAVE ) + 45, 10 )
endfunction




function UpdateGui()
	x = getPointerX() : y = getPointerY()
	//print( "X: " + str( x ) + ", Y: " + str( y ) )
	
	// Detect mouse over Save button
	spriteHitId = getSpriteHit( x, y )
	//print( "SpriteHit: " + str( spriteHitId ) )
	if spriteHitId = BTN_SAVE
		//print( "Save button!" )
		setSpriteColor( BTN_SAVE, getSpriteColorRed( BTN_SAVE ) + 100, getSpriteColorGreen( BTN_SAVE ) + 100, getSpriteColorRed( BTN_SAVE ), 255 )
	elseif spriteHitId = BTN_LOAD
		//print( "Load button" )
		setSpriteColor( BTN_LOAD, getSpriteColorRed( BTN_LOAD ) + 100, getSpriteColorGreen( BTN_LOAD ) + 100, getSpriteColorRed( BTN_LOAD ), 255 )
	endif
endfunction
