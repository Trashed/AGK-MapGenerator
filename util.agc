//		Map Generator
//
//		util.agc
//
//		Utility and other useful methods are here.




function LoadTileAssets()

	count = 0
	assetName as string : assetName = getFirstFile()
	
	// Find all the .png images inside 'media' directory but 
	// exclude images used for animated sprites
	while assetName <> ""
		if right( assetName, 4 ) = ".png" and left( assetName, 4 ) <> "anim"
			
			img = loadImage( assetName, 0 )
			inc count
			createSprite( count, img ) : setSpriteVisible( count, FALSE )
			
			if left( assetName, 4 ) = "grnd"
				//setSpriteGroup( count, SPRITE_GROUP_GROUND_TILE )
				setSpriteDepth( count, SPRITE_GROUP_GROUND_TILE )
			endif
			
			if left( assetName, 4 ) = "obst"
				//setSpriteGroup( count, SPRITE_GROUP_OBSTACLE )
				setSpriteDepth( count, SPRITE_GROUP_OBSTACLE )
			endif
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
		if getSpriteWidth( i ) > mLevel.tileSize then w# = mLevel.tileSize
		if getSpriteHeight( i ) > mLevel.tileSize then h# = mLevel.tileSize
		
		setSpriteSize( i, w#, h# )
		//setSpriteOffset( i, w#/2, h#/2 )
	next i
endfunction
