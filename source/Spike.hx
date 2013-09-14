package;

import flash.Lib;
import flixel.FlxGame;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.FlxObject;
import flixel.util.FlxTimer;
import flixel.util.FlxSpriteUtil;

class Spike extends FlxSprite {

	public function new(X:Int,Y:Int) {
		super(X * 16,Y * 16);
		makeGraphic(16, 16, 0xff330033);
		immovable = true;
	}

	override public function update():Void {
		super.update();
	}

}