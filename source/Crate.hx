package;

import flash.Lib;
import flixel.FlxGame;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.FlxObject;
import flixel.util.FlxTimer;
import flixel.util.FlxSpriteUtil;

class Crate extends FlxSprite {

	public function new(X:Int,Y:Int) {
		super(X * 16,Y * 16);
		makeGraphic(16, 16, 0xff33ff33);
		//immovable = true;
	}

	override public function update():Void {
		super.update();
		switch (Reg.gravityDir) {
			case "down":
				acceleration.y = 100;
				acceleration.x = 0;
				maxVelocity.set(100, 300);
			case "left":
				acceleration.y = 0;
				acceleration.x = -100;
				maxVelocity.set(300, 100);
			case "right":
				acceleration.y = 0;
				acceleration.x = 100;
				maxVelocity.set(300, 100);
			case "up":
				acceleration.y = -100;
				acceleration.x = 0;
				maxVelocity.set(100, 300);
		}
	}

}