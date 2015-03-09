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
	
		print( "FPS = " + left( str( screenFPS() ), 6 ) )						// FPS
		print( "W = " + str( g_deviceWidth ) + ", H = " + str( g_deviceHeight ) )
		print( "Sprite count: " + str( g_assetCount ) )
		print( "Visible sprite index: " + str( g_assetVisibleIndex ) )
		//print( "w: " + str( w# ) + ", h: " + str( h# ) )
		//print( "tile size: " + str( TILE_SIZE ) )
	endif
endfunction
