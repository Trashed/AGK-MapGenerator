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
	
	// Separator label for Layer part of the panel
	createText( 4, "------ Layers ------" )
	setTextPosition( 4, 25, getEditBoxY( EB_LEVEL_TS ) + 60 )
	setTextSize( 4, 20 )
	
	createText( 5, "Set active layer" )
	setTextPosition( 5, 10, getTextY( 4 ) + 30 )
	setTextSize( 5, 15 )
	
	createText( 6, "Ground" )
	setTextPosition( 6, 10, getTextY( 5 ) + 20 )
	setTextSize( 6, 15 )
	
	// Toggle button, ground layer
	addVirtualButton( VB_TOGGLE_GRND, 10 + getTextTotalWidth( 6 ) +15, getTextY( 5 ) + 30, 25 )
	
	createText( 7, "Obstacle" )
	setTextPosition( 7, getTextTotalWidth( 6 ) +  50, getTextY( 5 ) + 20 )
	setTextSize( 7, 15 )
	
	// Toggle button, ground layer
	addVirtualButton( VB_TOGGLE_OBST, 10 + getTextTotalWidth( 7 ) + 110, getTextY( 5 ) + 30, 25 )
	
	
endfunction




function UpdateGui()

	x = getPointerX() : y = getPointerY()
	
	UpdateButtons( x, y )
	UpdateEditBoxes()	
	UpdateToggleButtons()
endfunction


function UpdateButtons( _x, _y )
	
	// Update panel button behaviour
	spriteHitId = getSpriteHit( _x, _y )
	if spriteHitId = BTN_SAVE
		setSpriteScale( BTN_SAVE, 0.28, 0.28 )
	elseif spriteHitId = BTN_LOAD
		setSpriteScale( BTN_LOAD, 0.28, 0.28 )
	else
		setSpriteScale( BTN_SAVE, 0.3, 0.3 )
		setSpriteScale( BTN_LOAD, 0.3, 0.3 )
	endif
endfunction



function UpdateEditBoxes()

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
	
	// Update grid values in mLevel UDT 
	mLevel.gridsW = mLevel.width / mLevel.tileSize
	mLevel.gridsH = mLevel.height / mLevel.tileSize
endfunction



function UpdateToggleButtons()
	
	if getVirtualButtonReleased( VB_TOGGLE_GRND ) = TRUE
		if mLevel.currentLayer <> LAYER_GROUND
			mLevel.currentLayer = LAYER_GROUND
		endif
	elseif getVirtualButtonReleased( VB_TOGGLE_OBST ) = TRUE
		if mLevel.currentLayer <> LAYER_OBSTACLE
			mLevel.currentLayer = LAYER_OBSTACLE
		endif
	endif
	
	if mLevel.currentLayer = LAYER_GROUND
		setVirtualButtonColor( VB_TOGGLE_GRND, 0, 255, 0 )
		setVirtualButtonColor( VB_TOGGLE_OBST, 120, 120, 120 )
	else
		setVirtualButtonColor( VB_TOGGLE_GRND, 120, 120, 120 )
		setVirtualButtonColor( VB_TOGGLE_OBST, 0, 255, 0 )
	endif
endfunction
