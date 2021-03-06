// ##########################################
//
//					debug.agc
// ##########################################





// ==========================================
// Print debug information on the screen
// ==========================================
function PrintDebugInfo()


	// If 'd' key is pressed, activate/deactivate debugging
	if getRawKeyPressed( 68 ) = TRUE
		if g_isDebugging = TRUE
			g_isDebugging = FALSE
		else
			g_isDebugging = TRUE
		endif
	endif	
	
	// If debugging is activated, show debug info on the screen
	if g_isDebugging = TRUE
		setPrintSize( 17 )
		
		print( "Last keycode: " + str( getRawLastKey() ) )
		print( "FPS = " + left( str( screenFPS() ), 6 ) )						// FPS
		print( "W = " + str( g_deviceWidth ) + ", H = " + str( g_deviceHeight ) )
		print( "Sprite count: " + str( getManagedSpriteCount() ) )
		print( "Visible sprite index: " + str( g_currentAssetIndex ) )
		print( "Last placed asset ID: " + str( g_lastPlacedAssetId ) )
		print( "Current editor layer: " + str( g_currentEditorLayer ) )
		//print( "Is mouse on tiled asset: " + str(  ) )
		//print( "w: " + str( w# ) + ", h: " + str( h# ) )
		//print( "tile size: " + str( TILE_SIZE ) )
	endif
endfunction
