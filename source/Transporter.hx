package;

import flash.Lib;
import flixel.FlxGame;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.FlxObject;
import flixel.util.FlxTimer;
import flixel.util.FlxSpriteUtil;

class Transporter extends FlxSprite {

	private var ready:Bool;
	public var target:FlxSprite;

	public function new(X:Int,Y:Int) {
		super(X * 16,Y * 16);
		makeGraphic(16, 32, 0xff00ff00);
	}

	override public function update():Void {
		super.update();
	}

	public function deactivate() {
		this.allowCollisions = FlxObject.NONE;
		ready = false;
		alpha = .4;
		FlxTimer.start(1,activate);
	}

	public function activate(t:FlxTimer) {
		this.allowCollisions = FlxObject.ANY;
		ready = true;
		alpha = 1;
	}

}