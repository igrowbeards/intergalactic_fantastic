package;

import flash.Lib;
import flixel.FlxGame;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.FlxObject;
import flixel.util.FlxTimer;
import flixel.util.FlxSpriteUtil;

class Coin extends FlxSprite {

	public function new(X:Int,Y:Int) {
		super(X * 16 + 3,Y * 16 + 3);
		makeGraphic(10, 10, 0xffffff00);
	}

	override public function update():Void {
		super.update();
	}

}