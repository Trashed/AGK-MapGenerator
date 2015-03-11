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
	
	if getRawMouseLeftState() = TRUE
		//print( "No assets placed here" )
		if getSpriteHitGroup( SPRITE_GROUP_TILED, x+1, y+1 ) = FALSE
			
			g_lastPlacedAssetId = cloneSprite( g_currentAssetIndex )
			setSpriteGroup( g_lastPlacedAssetId, SPRITE_GROUP_TILED )
		endif
	endif
	
	if getRawMouseRightState() = TRUE
		setSpriteVisible( g_currentAssetIndex, FALSE )
		print( "dadaaa" )
		print( "sprite hit: " + str( getSpriteHit( x, y ) ) )
		deleteId = getSpriteHitGroup( SPRITE_GROUP_TILED, x+1, y+1 )
		if deleteId <> FALSE
			print( "Delete sprite" )
			deleteSprite( deleteId )
		endif
	else		
		setSpriteVisible( g_currentAssetIndex, TRUE )
	endif
endfunction

