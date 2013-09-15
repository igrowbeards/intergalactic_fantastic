package;

import flash.Lib;
import flixel.FlxGame;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.FlxObject;
import flixel.util.FlxTimer;
import flixel.util.FlxSpriteUtil;

class Player extends FlxSprite {

	private var jumping:Bool = false;
	private var maxjumpTime:Float = .4;
	public var invulnerable:Bool = false;
	public var invulnerableTime:Float = 1;
	public var hurting:Bool = false;
	public var hurtTime:Float = .25;
	public var maxWalkSpeed:Int = 200;
	public var walkForce:Int = 200;
	public var canTurnInAir:Bool = true;

	public function new(X:Int,Y:Int) {
		super(X * 16,Y * 16);
		makeGraphic(16, 16, 0xffff0000);
		maxVelocity.set(100, 400);
		acceleration.y = Reg.gravityStrength;
		health = 3;
	}

	override public function update():Void {
		//gravity controls

		if (Reg.gravityDir == "up" || Reg.gravityDir == "down") {
			if (isTouching(FlxObject.FLOOR) || isTouching(FlxObject.UP)) {
				acceleration.x = 0;
				drag.x = maxVelocity.x * 2;
			}
		}
		else {
			if (isTouching(FlxObject.LEFT) || isTouching(FlxObject.RIGHT)) {
				acceleration.y = 0;
				drag.y = maxVelocity.y * 2;
			}
		}

		// keyboard controls

		if (FlxG.keys.pressed.LEFT) {
			moveLeft();
		}

		if (FlxG.keys.pressed.UP) {
			moveUp();
		}

		if (FlxG.keys.pressed.DOWN) {
			moveDown();
		}

		if (FlxG.keys.pressed.RIGHT) {
			moveRight();
		}

		super.update();
	}

	public function moveLeft() {
		if (Reg.gravityDir == "up" || Reg.gravityDir == "down") {
			facing = FlxObject.LEFT;
			acceleration.x = -maxVelocity.x * 4;
		}
	}

	public function moveRight() {
		if (Reg.gravityDir == "up" || Reg.gravityDir == "down") {
			facing = FlxObject.RIGHT;
			acceleration.x = maxVelocity.x * 4;
		}
	}

	public function moveUp() {
		if (Reg.gravityDir == "left" || Reg.gravityDir == "right") {
			acceleration.y = -maxVelocity.y * 4;
		}
	}

	public function moveDown() {
		if (Reg.gravityDir == "left" || Reg.gravityDir == "right") {
			acceleration.y = maxVelocity.y * 4;
		}
	}

	public function changeGravity() {
		switch (Reg.gravityDir) {
			case "down":
				acceleration.y = Reg.gravityStrength;
				acceleration.x = 0;
				maxVelocity.set(200, Reg.terminalVelocity);
			case "left":
				acceleration.y = 0;
				acceleration.x = -Reg.gravityStrength;
				maxVelocity.set(Reg.terminalVelocity, 200);
			case "right":
				acceleration.y = 0;
				acceleration.x = Reg.gravityStrength;
				maxVelocity.set(Reg.terminalVelocity, 200);
			case "up":
				acceleration.y = -Reg.gravityStrength;
				acceleration.x = 0;
				maxVelocity.set(200, Reg.terminalVelocity);
		}
	}

}
