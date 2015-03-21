//		Map Generator
//
//		editor.agc
//
//		All the actual map editing methods are here




function BrowseAssets()
	
	delta = getRawMouseWheelDelta()

	//if delta = 0 then setSpriteVisible( g_currentAssetIndex, TRUE )
	
	if delta > 0		// Wheel up increments index
		inc g_currentAssetIndex
		
		if g_currentAssetIndex >= g_assetCount then g_currentAssetIndex = g_assetCount

		//setSpriteVisible( g_currentAssetIndex, TRUE )
		//setSpriteVisible( g_currentAssetIndex-1, FALSE )
	elseif delta < 0	// Wheel down decrements index
		dec g_currentAssetIndex
		
		if g_currentAssetIndex <= 1 then g_currentAssetIndex = 1

		//setSpriteVisible( g_currentAssetIndex, TRUE )		
		//setSpriteVisible( g_currentAssetIndex+1, FALSE )
	endif
	
	//setSpriteDepth( g_currentAssetIndex, 0 )
	
endfunction





function HandleCurrentAsset()

	x = getPointerX() : y = getPointerY()
	//print( "PointerX: " + str( x ) + ", PointerY: " + str( y ) )
	
	// Calculate snapping coordinates for current sprite
	g_SnapX = GetSnapCoordinate( x )
	g_SnapY = GetSnapCoordinate( y )
	if g_SnapX <= 0 then g_SnapX = 0
	if g_SnapY <= 0 then g_SnapY = 0
	if g_SnapX >= mLevel.height then g_SnapX = mLevel.height - mLevel.tileSize
	if g_SnapY >= mLevel.height then g_SnapY = mLevel.height - mLevel.tileSize
	//print( "SnapX: " + str( g_SnapX ) + ", SnapY: " + str( g_SnapY ) )	
	
	//setSpritePosition( g_currentAssetIndex, g_SnapX, g_SnapY )
endfunction





function GetSnapCoordinate( ptrCoord as float )
	retVal as integer : temp as float
	
	temp = floor( (ptrCoord/mLevel.tileSize) )
	
	retVal = temp * mLevel.tileSize
endfunction retVal




function PlaceAndDeleteAsset()
	
	x = getPointerX() : y = getPointerY()
	
	assetSpriteHit = getSpriteHitGroup( SPRITE_GROUP_TILED, x+1, y+1 )
	
	if assetSpriteHit > 0 then assetSpriteDepth = getSpriteDepth( assetSpriteHit )
	//print( "Current asset under pointer: " + str( assetSpriteHit ) )
	//print( "Depth of current asset under pointer: " + str( assetSpriteDepth ) )
	
	if getRawMouseLeftState() = TRUE
		// If now ID is found, add new asset sprite on the screen. 
		// Else, delete the current asset on the screen and place a new one.
		if assetSpriteHit <> FALSE
			// Replace the asset sprite on the screen if it's the same as the one "attached" to the pointer
			if g_currentEditorLayer = LAYER_GROUND then ReplaceAsset( assetSpriteHit )
			if g_currentEditorLayer = LAYER_OBSTACLE and assetSpriteDepth = LAYER_GROUND
				PlaceCurrentAsset()
			endif
		elseif assetSpriteHit = FALSE
			PlaceCurrentAsset()
		endif
		
	endif
	
	if getRawMouseRightState() = TRUE
		//setSpriteVisible( g_currentAssetIndex, FALSE )
		deleteId = getSpriteHitGroup( SPRITE_GROUP_TILED, x+1, y+1 )
		if deleteId <> FALSE
		
			if getSpriteDepth( deleteId ) = g_currentEditorLayer
				deleteSprite( deleteId )
			endif
		endif
	else		
		//setSpriteVisible( g_currentAssetIndex, TRUE )
	endif
endfunction


function PlaceCurrentAsset()

	g_lastPlacedAssetId = cloneSprite( g_currentAssetIndex )
	setSpriteGroup( g_lastPlacedAssetId, SPRITE_GROUP_TILED )
	setSpriteDepth( g_lastPlacedAssetId, g_currentEditorLayer )
endfunction



function ReplaceAsset( spriteHit )
	// Get the image id of the sprite on the POINTER
	id = getSpriteImageId( g_currentAssetIndex )
	if getSpriteImageId( spriteHit ) <> id
		setSpriteImage( spriteHit, id )
	endif
endfunction




function ToggleEditorLayer()
	
	if getRawKeyPressed( 76 ) = TRUE
		print( "TOGGLED!" )
		if g_currentEditorLayer = LAYER_GROUND
			g_currentEditorLayer = LAYER_OBSTACLE
		else
			g_currentEditorLayer = LAYER_GROUND
		endif
	endif
endfunction
