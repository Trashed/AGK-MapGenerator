//		Map Generator
//
//		editor.agc
//
//		All the actual map editing methods are here




function BrowseAssets()

	delta = getRawMouseWheelDelta()

	if delta > 0		// Wheel up increments index
		inc g_assetVisibleIndex
		
		if g_assetVisibleIndex >= g_assetCount then g_assetVisibleIndex = g_assetCount

		setSpriteVisible( g_assetVisibleIndex, TRUE )
		setSpriteVisible( g_assetVisibleIndex-1, FALSE )
	elseif delta < 0	// Wheel down decrements index
		dec g_assetVisibleIndex
		
		if g_assetVisibleIndex <= 1 then g_assetVisibleIndex = 1

		setSpriteVisible( g_assetVisibleIndex, TRUE )		
		setSpriteVisible( g_assetVisibleIndex+1, FALSE )
	endif
endfunction





function HandleCurrentAsset()

	x# = getPointerX() : y# = getPointerY()
	print( "PointerX: " + str( x# ) + ", PointerY: " + str( y# ) )
	
	// Calculate snapping coordinates for current sprite
	snapX = GetSnapCoordinate( x# )
	snapY = GetSnapCoordinate( y# )
	if snapX <= 0 then snapX = 0
	if snapY <= 0 then snapY = 0
	if snapX >= g_DeviceWidth then snapX = g_DeviceWidth - TILE_SIZE
	if snapY >= g_DeviceHeight then snapY = g_DeviceHeight - TILE_SIZE
	print( "SnapX: " + str( snapX ) + ", SnapY: " + str( snapY ) )	
	
	setSpritePosition( g_assetVisibleIndex, snapX, snapY )
endfunction





function GetSnapCoordinate( ptrCoord as float )
	retVal as integer : temp as float
	
	temp = floor( (ptrCoord/TILE_SIZE) )
	
	retVal = temp * TILE_SIZE
endfunction retVal
