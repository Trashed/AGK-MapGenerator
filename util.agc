//		Map Generator
//
//		util.agc
//
//		Utility and other useful methods are here.




function LoadTileAssets()

	assetDir as string : assetDir = "/media/"
	count = 0
	assetName as string : assetName = getFirstFile()
	
	// Find all the .png images inside 'media' directory but 
	// exclude images used for animated sprites
	while assetName <> ""
		if right( assetName, 4 ) = ".png" and left( assetName, 4 ) <> "anim"			
			img = loadImage( assetName, 0 )
			inc count
			createSprite( count, img ) : setSpriteVisible( count, FALSE )
		endif
		
		assetName = getNextFile()
	endwhile
endfunction



function ScaleTileAssets()

	sync()
	count = getManagedSpriteCount()
	g_assetCount = count
	
	// Scale assets to tile size (32 x 32 pixels)
	for i = 1 to count
		w# = TILE_SIZE
		h# = TILE_SIZE
		
		setSpriteSize( i, w#, h# )
		//setSpriteOffset( i, w#/2, h#/2 )
	next i
endfunction
