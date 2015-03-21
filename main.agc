//=======================================================//
//		Project: MAP GENERATOR / CREATPR							 //
//							 							 //
//		main.agc										 //
//							 							 //
//							 							 //
//		Map Generator.						 //
//														 //
//		Codetrasher (c) 2015							 //
//=======================================================//

// Include files
#include "constants.agc"
#include "gui.agc"
#include "util.agc"
#include "editor.agc"
#include "debug.agc"


// UDTs
type Level
	width as integer
	height as integer
	tileSize as integer
	gridsW as integer
	gridsH as integer
endtype



// Globals
global mLevel as Level
mLevel.width = getDeviceWidth()
mLevel.height = getDeviceHeight()
mLevel.tileSize = 32
mLevel.gridsW = mLevel.width/mLevel.tileSize
mLevel.gridsH = mLevel.height/mLevel.tileSize

global g_isDebugging = FALSE
//global g_DeviceWidth as float : g_DeviceWidth = getDeviceWidth()
//global g_DeviceHeight as float : g_DeviceHeight = getDeviceHeight()
global g_assetCount = 0
global g_currentAssetIndex = 1
//global g_GridNumW as float : g_GridNumW = mLevel.width/TILE_SIZE
//global g_GridNumH as float : g_GridNumH = mLevel.height/TILE_SIZE
global g_SnapX as integer
global g_SnapY as integer
global g_GridSprite as integer
global g_lastPlacedAssetId = 0
global g_currentEditorLayer = LAYER_GROUND

global g_GuiSidePanel as integer




// Init app
InitApplication()

// Creates GUI components
CreateGui()


// ======================================
// MAIN PROGRAM LOOP
//
// Here happens the map editing part.
//
// Controls:
// - mousewheel: Browse assets
// - mouseclick: place asset on its place
// ======================================
do
	PrintDebugInfo()
	
	// Updates GUI handling
	UpdateGui()
	
	
	// Handle editor layer toggling
	ToggleEditorLayer()
	
	
	
	
	// Browse through assets with mouse wheel
	BrowseAssets()
	// Handle current asset (move, place...)
	HandleCurrentAsset()
	
	
	PlaceAndDeleteAsset()


	sync()
loop






//===================================================
// Application initialization methods are called here
//===================================================
function InitApplication()
	//setDisplayAspect( 16.0/10.0 )		// Use percentage method for sprite placing
	setVirtualResolution( 1920, 1080 )
	setSyncRate( 0, 1 )				// Draw sprites as fast as possible but save CPU at the same time
	setPrintSize( 17 )
	
	// TODO: Set up background grid
	
	// Loads every asset into memory
	LoadTileAssets()
	
	//g_assetCount = getManagedSpriteCount()
	ScaleTileAssets()
	
	


endfunction

//=============
// Exit program
//=============
function ExitApplication()
	// TODO: Release all assets here!

	end
endfunction

