//		Map Generator
//
//		editor.agc
//
//		All the actual map editing methods are here




function BrowseAssets()

	delta = getRawMouseWheelDelta()

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

	x# = getPointerX() : y# = getPointerY()
	print( "PointerX: " + str( x# ) + ", PointerY: " + str( y# ) )
	
	// Calculate snapping coordinates for current sprite
	g_SnapX = GetSnapCoordinate( x# )
	g_SnapY = GetSnapCoordinate( y# )
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




function PlaceAsset()
	
	x# = getPointerX() : y# = getPointerY()
	
	if getRawMouseLeftState() = TRUE	
		if getSpriteHit( x#, y# ) = FALSE
			spr = cloneSprite( g_currentAssetIndex )
			setSpritePosition( spr, g_SnapX, g_SnapY )
		endif
	endif
endfunction

