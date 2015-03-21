// ##########################################
//
//					gui.agc
// ##########################################




function CreateGui()
	
	// Create side panel with other widgets such as Save and Load buttons etc.
	g_GuiSidePanel = createSprite( 0 )
	setSpriteColor( g_GuiSidePanel, 10, 50, 255, 70 )
	setSpriteSize( g_GuiSidePanel, 300, mLevel.height - 200 )
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
	setEditBoxText( EB_LEVEL_W, str( mLevel.width ) ) 
	setEditBoxPosition( EB_LEVEL_W, getTextTotalWidth( 1 ) + 5, getSpriteY( BTN_SAVE ) + getSpriteHeight( BTN_SAVE ) + 40 )
	setEditBoxSize( EB_LEVEL_W, 100, 20 )
	
	// Editbox and label for level height
	createText( 2, "Level height: " )
	setTextPosition( 2, 10, getTextY( 1 ) + 30 )
	setTextSize( 2, 15 )
	createEditBox( EB_LEVEL_H )
	setEditBoxText( EB_LEVEL_H, str( mLevel.height ) )
	setEditBoxPosition( EB_LEVEL_H, getTextTotalWidth( 2 ) + 5, getSpriteY( BTN_SAVE ) + getSpriteHeight( BTN_SAVE ) + 70 )
	setEditBoxSize( EB_LEVEL_H, 100, 20 )
	
	// Editbox and text for tile size
	createText( 3, "Tile size (px): " )
	setTextPosition( 3, 10, getTextY( 2 ) + 30 )
	setTextSize( 3, 15 )
	createEditBox( EB_LEVEL_TS )
	setEditBoxText( EB_LEVEL_TS, str( mLevel.tileSize ) )
	setEditBoxPosition( EB_LEVEL_TS, getTextTotalWidth( 3 ) + 5, getSpriteY( BTN_SAVE ) + getSpriteHeight( BTN_SAVE ) + 100 )
	setEditBoxSize( EB_LEVEL_TS, 50, 20 )
	
endfunction




function UpdateGui()

	x = getPointerX() : y = getPointerY()
	
	// Update panel button behaviour
	spriteHitId = getSpriteHit( x, y )
	if spriteHitId = BTN_SAVE
		setSpriteScale( BTN_SAVE, 0.25, 0.25 )
	elseif spriteHitId = BTN_LOAD
		setSpriteScale( BTN_LOAD, 0.25, 0.25 )
	else
		setSpriteScale( BTN_SAVE, 0.3, 0.3 )
		setSpriteScale( BTN_LOAD, 0.3, 0.3 )
	endif
	
	
	// If EditBoxes' value have recently changed, update the corresponding variable
	if getEditBoxChanged( EB_LEVEL_W ) = TRUE
		mLevel.width = val( getEditBoxText( EB_LEVEL_W ) )
	endif
	
	if getEditBoxChanged( EB_LEVEL_H ) = TRUE
		mLevel.height = val( getEditBoxText( EB_LEVEL_H ) )
	endif
	
	if getEditBoxChanged( EB_LEVEL_TS ) = TRUE
		mLevel.tileSize = val( getEditBoxText( EB_LEVEL_TS ) )
	endif
	mLevel.gridsW = mLevel.width / mLevel.tileSize
	mLevel.gridsH = mLevel.height / mLevel.tileSize
endfunction
