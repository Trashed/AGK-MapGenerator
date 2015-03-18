//		Map Generator
//
//		editor.agc
//
//		All the actual map editing methods are here




function BrowseAssets()
	
	delta = getRawMouseWheelDelta()

	if delta = 0 then setSpriteVisible( g_currentAssetIndex, TRUE )
	
	if delta > 0		// Wheel up increments index
		inc g_currentAssetIndex
		
		if g_currentAssetIndex >= g_assetCount then g_currentAssetIndex = g_assetCount

		setSpriteVisible( g_currentAssetIndex, TRUE )
		setSpriteVisible( g_currentAssetIndex-1, FALSE )
	elseif delta < 0	// Wheel down decrements index
		dec g_currentAssetIndex
		
		if g_currentAssetIndex <= 1 then g_currentAssetIndex = 1

		setSpriteVisible( g_currentAssetIndex, TRUE )		
		setSpriteVisible( g_currentAssetIndex+1, FALSE )
	endif
	
	setSpriteDepth( g_currentAssetIndex, 0 )
	
endfunction





function HandleCurrentAsset()

	x = getPointerX() : y = getPointerY()
	print( "PointerX: " + str( x ) + ", PointerY: " + str( y ) )
	
	// Calculate snapping coordinates for current sprite
	g_SnapX = GetSnapCoordinate( x )
	g_SnapY = GetSnapCoordinate( y )
	if g_SnapX <= 0 then g_SnapX = 0
	if g_SnapY <= 0 then g_SnapY = 0
	if g_SnapX >= g_DeviceWidth then g_SnapX = g_DeviceWidth - TILE_SIZE
	if g_SnapY >= g_DeviceHeight then g_SnapY = g_DeviceHeight - TILE_SIZE
	print( "SnapX: " + str( g_SnapX ) + ", SnapY: " + str( g_SnapY ) )	
	
	setSpritePosition( g_currentAssetIndex, g_SnapX, g_SnapY )
endfunction





function GetSnapCoordinate( ptrCoord as float )
	retVal as integer : temp as float
	
	temp = floor( (ptrCoord/TILE_SIZE) )
	
	retVal = temp * TILE_SIZE
endfunction retVal




function PlaceAndDeleteAsset()
	
	x = getPointerX() : y = getPointerY()
	
	assetSpriteHit = getSpriteHitGroup( SPRITE_GROUP_TILED, x+1, y+1 )
	print( "Current asset under pointer: " + str( assetSpriteHit ) )
	
	if getRawMouseLeftState() = TRUE
		// If now ID is found, add new asset sprite on the screen. 
		// Else, delete the current asset on the screen and place a new one.
		if assetSpriteHit <> FALSE
			// Replace the asset sprite on the screen if it's the same as the one "attached" to the pointer
			ReplaceAsset( assetSpriteHit )
		elseif assetSpriteHit = FALSE
			PlaceCurrentAsset()
		endif
		
	endif
	
	if getRawMouseRightState() = TRUE
		setSpriteVisible( g_currentAssetIndex, FALSE )
		deleteId = getSpriteHitGroup( SPRITE_GROUP_TILED, x+1, y+1 )
		if deleteId <> FALSE
			deleteSprite( deleteId )
		endif
	else		
		setSpriteVisible( g_currentAssetIndex, TRUE )
	endif
endfunction


function PlaceCurrentAsset()

	g_lastPlacedAssetId = cloneSprite( g_currentAssetIndex )
	setSpriteGroup( g_lastPlacedAssetId, SPRITE_GROUP_TILED )
	setSpriteDepth( g_lastPlacedAssetId, 10 )
endfunction



function ReplaceAsset( spriteHit )
	// Get the image id of the sprite on the POINTER
	id = getSpriteImageId( g_currentAssetIndex )
	if getSpriteImageId( spriteHit ) <> id
		setSpriteImage( spriteHit, id )
	endif
endfunction
