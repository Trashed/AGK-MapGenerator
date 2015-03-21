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
	
	// Save button
	createSprite( BTN_SAVE, loadImage( "btn_save.png" ) )
	setSpriteScale( BTN_SAVE, 0.3, 0.3 )
	setSpritePosition( BTN_SAVE, 10, 10 )
	
	// Load button
	createSprite( BTN_LOAD, loadImage( "btn_load.png" ) )
	setSpriteScale( BTN_LOAD, 0.3, 0.3 )
	setSpritePosition( BTN_LOAD, getSpriteWidth( BTN_SAVE ) + 45, 10 )
endfunction
