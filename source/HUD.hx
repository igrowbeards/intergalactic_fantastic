package;

import flash.Lib;
import flixel.FlxGame;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.group.FlxGroup;
import flixel.util.FlxTimer;
import flixel.util.FlxSpriteUtil;

class HUD extends FlxGroup {

	public var gravIndicator:FlxSprite;
	public var notifyTime:Float = .5;

	public function new() {
		super();
		gravIndicator = new FlxSprite(0,0);
		gravIndicator.loadGraphic("images/grav_indicator.png",true, true, 220,220,true);
		gravIndicator.addAnimation("up", [3,0], 20, true);
		gravIndicator.addAnimation("down", [4,0], 20, true);
		gravIndicator.addAnimation("left", [2,0], 20, true);
		gravIndicator.addAnimation("right", [1,0], 20, true);
		gravIndicator.x = FlxG.width / 2 - 110;
		gravIndicator.y = FlxG.height  / 2 - 110;
		gravIndicator.visible = false;
		gravIndicator.play("down");

		add(gravIndicator);
	}

	override public function update():Void {
		super.update();
	}

	public function notifyGravChange(dir:String) {
			switch (dir) {

				case "up":
					gravIndicator.play("up");
					gravIndicator.visible = true;
				case "down":
					gravIndicator.play("down");
					gravIndicator.visible = true;
				case "left":
					gravIndicator.play("left");
					gravIndicator.visible = true;
				case "right":
					gravIndicator.play("right");
					gravIndicator.visible = true;
			}
			FlxTimer.start(notifyTime,stopNotify);
	}

	public function stopNotify(t:FlxTimer) {
		gravIndicator.visible = false;
	}

}