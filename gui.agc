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
	
	// Editbox and label for level width
	createText( 1, "Level width: " )
	setTextPosition( 1, 10, getSpriteHeight( BTN_SAVE ) + 50 )
	setTextSize( 1, 15 )
	createEditBox( EB_LEVEL_W )
	setEditBoxPosition( EB_LEVEL_W, getTextTotalWidth( 1 ) + 5, getSpriteY( BTN_SAVE ) + getSpriteHeight( BTN_SAVE ) + 40 )
	setEditBoxSize( EB_LEVEL_W, 100, 20 )
	
	// Editbox and label for level height
	createText( 2, "Level height: " )
	setTextPosition( 2, 10, getTextY( 1 ) + 30 )
	setTextSize( 2, 15 )
	createEditBox( EB_LEVEL_H )
	setEditBoxPosition( EB_LEVEL_H, getTextTotalWidth( 2 ) + 5, getSpriteY( BTN_SAVE ) + getSpriteHeight( BTN_SAVE ) + 70 )
	setEditBoxSize( EB_LEVEL_H, 100, 20 )
	
	// Editbox and text for tile size
	createText( 3, "Tile size (px): " )
	setTextPosition( 3, 10, getTextY( 2 ) + 30 )
	setTextSize( 3, 15 )
	createEditBox( EB_LEVEL_TS )
	setEditBoxPosition( EB_LEVEL_TS, getTextTotalWidth( 3 ) + 5, getSpriteY( BTN_SAVE ) + getSpriteHeight( BTN_SAVE ) + 100 )
	setEditBoxSize( EB_LEVEL_TS, 50, 20 )
	
endfunction




function UpdateGui()
	x = getPointerX() : y = getPointerY()
	//print( "X: " + str( x ) + ", Y: " + str( y ) )
	
	// Update panel button behaviour
	spriteHitId = getSpriteHit( x, y )
	//print( "SpriteHit: " + str( spriteHitId ) )
	if spriteHitId = BTN_SAVE
		setSpriteScale( BTN_SAVE, 0.25, 0.25 )
	elseif spriteHitId = BTN_LOAD
		setSpriteScale( BTN_LOAD, 0.25, 0.25 )
	else
		setSpriteScale( BTN_SAVE, 0.3, 0.3 )
		setSpriteScale( BTN_LOAD, 0.3, 0.3 )
	endif
endfunction
