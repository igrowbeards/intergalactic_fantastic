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

	public function new(X:Int,Y:Int) {
		super(X * 16,Y * 16);
		makeGraphic(16, 16, 0xffff0000);
		maxVelocity.set(100, 300);
		acceleration.y = 100;
		drag.x = maxVelocity.x * 3;
		health = 3;
	}

	override public function update():Void {
		//gravity controls

		if (Reg.gravityDir == "up" || Reg.gravityDir == "down") {
			acceleration.x = 0;
		}
		else {
			acceleration.y = 0;
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

		if (FlxG.keys.justPressed.SPACE) {
			jump();
		}

		// update conditions

		if (jumping) {

			switch (Reg.gravityDir) {
				case "down":
					velocity.y = -maxVelocity.y / 3;
				case "left":
					velocity.x = maxVelocity.x / 3;
				case "right":
					velocity.x = -maxVelocity.x / 3;
				case "up":
					velocity.y = maxVelocity.y / 3;
			}

			FlxTimer.start(maxjumpTime,maxJumpReached);
			if (FlxG.keys.justReleased.SPACE) {
				jumping = false;
			}
			else {
				switch (Reg.gravityDir) {
					case "down":
						velocity.y = -maxVelocity.y / 3;
					case "left":
						velocity.x = maxVelocity.x / 3;
					case "right":
						velocity.x = -maxVelocity.x / 3;
					case "up":
						velocity.y = maxVelocity.y / 3;
				}
			}

			if (justTouched(FlxObject.UP)) {
				jumping = false;
			}
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

	public function jump() {
		// only if they are on the floor or something else like that
		switch (Reg.gravityDir) {
			case "down":
				if (isTouching(FlxObject.FLOOR)) {
					jumping = true;
				}
			case "left":
				if (isTouching(FlxObject.LEFT)) {
					jumping = true;
				}
			case "right":
				if (isTouching(FlxObject.RIGHT)) {
					jumping = true;
				}
			case "up":
				if (isTouching(FlxObject.UP)) {
					jumping = true;
				}
		}
	}

	private function maxJumpReached(t:FlxTimer) {
		if (jumping) {
			jumping = false;
		}
	}

	override public function hurt(amount:Float) {
		if (!invulnerable) {
			if (justTouched(FlxObject.RIGHT)) {
				velocity.x = -130;
			}
			else if (justTouched(FlxObject.LEFT)) {
				velocity.x = 130;
			}
			velocity.y = -80;
			invulnerable = true;
			alpha = .6;
			hurting = true;
			FlxTimer.start(invulnerableTime,stopInvulnerable);
			FlxTimer.start(hurtTime,stopHurting);
			super.hurt(amount);
		}
	}

	override public function kill() {
		FlxG.resetState();
	}

	private function stopInvulnerable(t:FlxTimer) {
		invulnerable = false;
		alpha = 1;
	}

	private function stopHurting(t:FlxTimer) {
		hurting = false;
	}

	public function changeGravity() {
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
