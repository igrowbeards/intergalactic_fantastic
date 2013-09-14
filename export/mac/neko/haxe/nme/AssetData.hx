package nme;


import openfl.Assets;


class AssetData {
	
	
	public static var library:Map <String, LibraryType>;
	public static var path:Map <String, String>;
	public static var type:Map <String, AssetType>;
	
	private static var initialized:Bool = false;
	
	
	public static function initialize ():Void {
		
		if (!initialized) {
			
			path = new Map<String, String> ();
			type = new Map<String, AssetType> ();
			library = new Map<String, LibraryType> ();
			
			path.set ("assets/data/data-goes-here.txt", "assets/data/data-goes-here.txt");
			type.set ("assets/data/data-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/mapCSV_Group1_Map1.csv", "assets/data/mapCSV_Group1_Map1.csv");
			type.set ("assets/data/mapCSV_Group1_Map1.csv", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/mapCSV_Group1_Map1.txt", "assets/data/mapCSV_Group1_Map1.txt");
			type.set ("assets/data/mapCSV_Group1_Map1.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/images-go-here.txt", "assets/images/images-go-here.txt");
			type.set ("assets/images/images-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/tiles.png", "assets/images/tiles.png");
			type.set ("assets/images/tiles.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/music/music-goes-here.txt", "assets/music/music-goes-here.txt");
			type.set ("assets/music/music-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/sounds/sounds-go-here.txt", "assets/sounds/sounds-go-here.txt");
			type.set ("assets/sounds/sounds-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("flixel/img/debugger/buttons/open.png", "flixel/img/debugger/buttons/open.png");
			type.set ("flixel/img/debugger/buttons/open.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/img/debugger/buttons/pause.png", "flixel/img/debugger/buttons/pause.png");
			type.set ("flixel/img/debugger/buttons/pause.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/img/debugger/buttons/play.png", "flixel/img/debugger/buttons/play.png");
			type.set ("flixel/img/debugger/buttons/play.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/img/debugger/buttons/record_off.png", "flixel/img/debugger/buttons/record_off.png");
			type.set ("flixel/img/debugger/buttons/record_off.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/img/debugger/buttons/record_on.png", "flixel/img/debugger/buttons/record_on.png");
			type.set ("flixel/img/debugger/buttons/record_on.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/img/debugger/buttons/restart.png", "flixel/img/debugger/buttons/restart.png");
			type.set ("flixel/img/debugger/buttons/restart.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/img/debugger/buttons/step.png", "flixel/img/debugger/buttons/step.png");
			type.set ("flixel/img/debugger/buttons/step.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/img/debugger/buttons/stop.png", "flixel/img/debugger/buttons/stop.png");
			type.set ("flixel/img/debugger/buttons/stop.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/img/debugger/buttons/visualDebug.png", "flixel/img/debugger/buttons/visualDebug.png");
			type.set ("flixel/img/debugger/buttons/visualDebug.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/img/debugger/flixel.png", "flixel/img/debugger/flixel.png");
			type.set ("flixel/img/debugger/flixel.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/img/debugger/windowHandle.png", "flixel/img/debugger/windowHandle.png");
			type.set ("flixel/img/debugger/windowHandle.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/img/logo/default.png", "flixel/img/logo/default.png");
			type.set ("flixel/img/logo/default.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/img/logo/HaxeFlixel.svg", "flixel/img/logo/HaxeFlixel.svg");
			type.set ("flixel/img/logo/HaxeFlixel.svg", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("flixel/img/logo/logo.png", "flixel/img/logo/logo.png");
			type.set ("flixel/img/logo/logo.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/img/preloader/corners.png", "flixel/img/preloader/corners.png");
			type.set ("flixel/img/preloader/corners.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/img/preloader/light.png", "flixel/img/preloader/light.png");
			type.set ("flixel/img/preloader/light.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/img/tile/autotiles.png", "flixel/img/tile/autotiles.png");
			type.set ("flixel/img/tile/autotiles.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/img/tile/autotiles_alt.png", "flixel/img/tile/autotiles_alt.png");
			type.set ("flixel/img/tile/autotiles_alt.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/img/ui/analog/base.png", "flixel/img/ui/analog/base.png");
			type.set ("flixel/img/ui/analog/base.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/img/ui/analog/thumb.png", "flixel/img/ui/analog/thumb.png");
			type.set ("flixel/img/ui/analog/thumb.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/img/ui/button.png", "flixel/img/ui/button.png");
			type.set ("flixel/img/ui/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/img/ui/cursor.png", "flixel/img/ui/cursor.png");
			type.set ("flixel/img/ui/cursor.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/img/ui/fontData11pt.png", "flixel/img/ui/fontData11pt.png");
			type.set ("flixel/img/ui/fontData11pt.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/img/ui/virtualpad/a.png", "flixel/img/ui/virtualpad/a.png");
			type.set ("flixel/img/ui/virtualpad/a.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/img/ui/virtualpad/b.png", "flixel/img/ui/virtualpad/b.png");
			type.set ("flixel/img/ui/virtualpad/b.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/img/ui/virtualpad/c.png", "flixel/img/ui/virtualpad/c.png");
			type.set ("flixel/img/ui/virtualpad/c.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/img/ui/virtualpad/down.png", "flixel/img/ui/virtualpad/down.png");
			type.set ("flixel/img/ui/virtualpad/down.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/img/ui/virtualpad/left.png", "flixel/img/ui/virtualpad/left.png");
			type.set ("flixel/img/ui/virtualpad/left.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/img/ui/virtualpad/right.png", "flixel/img/ui/virtualpad/right.png");
			type.set ("flixel/img/ui/virtualpad/right.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/img/ui/virtualpad/up.png", "flixel/img/ui/virtualpad/up.png");
			type.set ("flixel/img/ui/virtualpad/up.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/img/ui/virtualpad/x.png", "flixel/img/ui/virtualpad/x.png");
			type.set ("flixel/img/ui/virtualpad/x.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/img/ui/virtualpad/y.png", "flixel/img/ui/virtualpad/y.png");
			type.set ("flixel/img/ui/virtualpad/y.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/snd/beep.mp3", "flixel/snd/beep.mp3");
			type.set ("flixel/snd/beep.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
			path.set ("flixel/snd/beep.wav", "flixel/snd/beep.wav");
			type.set ("flixel/snd/beep.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/snd/flixel.mp3", "flixel/snd/flixel.mp3");
			type.set ("flixel/snd/flixel.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
			
			
			initialized = true;
			
		}
		
	}
	
	
}