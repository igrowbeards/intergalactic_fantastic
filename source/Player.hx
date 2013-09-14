package;

import flash.Lib;
import flixel.FlxGame;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.FlxObject;
import flixel.util.FlxTimer;
import flixel.util.FlxSpriteUtil;
#if (cpp || neko)
	import flixel.system.input.gamepad.FlxGamepad;
	import flixel.system.input.gamepad.XboxButtonID;
	import openfl.events.JoystickEvent;
#end


class Player extends FlxSprite {

	#if !flash
		private var _gamePad:FlxGamepad;
	#end

	private var jumping:Bool = false;
	private var maxjumpTime:Float = .4;
	public var invulnerable:Bool = false;
	public var invulnerableTime:Float = 1;
	public var hurting:Bool = false;
	public var hurtTime:Float = .25;

	public function new(X:Int,Y:Int) {
		super(X * 16,Y * 16);
		makeGraphic(16, 20, 0xffff0000);
		maxVelocity.set(100, 300);
		acceleration.y = 100;
		drag.x = maxVelocity.x * 3;
		health = 3;
		#if !flash
			_gamePad = FlxG.gamepads.get(0);
		#end
	}

	override public function update():Void {
		acceleration.x = 0;

		// keyboard controls

		if (FlxG.keys.pressed.LEFT || FlxG.keys.pressed.A) {
			moveLeft();
		}

		if (FlxG.keys.pressed.RIGHT || FlxG.keys.pressed.D) {
			moveRight();
		}

		if (FlxG.keys.justPressed.SPACE || FlxG.keys.justPressed.UP || FlxG.keys.justPressed.W) {
			jump();
		}

		// gamepad controls

		#if (cpp || neko)
			if (_gamePad.justPressed(XboxButtonID.A)) {
				jump();
			}

			if (_gamePad.getAxis(XboxButtonID.LEFT_ANALOGUE_X) > _gamePad.deadZone) {
				moveRight();
			}

			if (_gamePad.getAxis(XboxButtonID.LEFT_ANALOGUE_X) < -_gamePad.deadZone) {
				moveLeft();
			}

			if (_gamePad.hat.x > 0) {
				moveRight();
			}

			if (_gamePad.hat.x < 0) {
				moveLeft();
			}

		#end

		// update conditions

		if (jumping) {
			velocity.y = -maxVelocity.y / 3;
			FlxTimer.start(maxjumpTime,maxJumpReached);
			if (FlxG.keys.justReleased.SPACE || FlxG.keys.justReleased.UP || FlxG.keys.justReleased.W) {
				jumping = false;
			}
			else {
				velocity.y = -maxVelocity.y / 3;
			}
			#if !flash
				if (_gamePad.justReleased(XboxButtonID.A)) {
					jumping = false;
				}
				else {
					velocity.y = -maxVelocity.y / 3;
				}
			#end

			if (justTouched(FlxObject.UP)) {
				jumping = false;
			}
		}

		super.update();
	}

	public function moveLeft() {
		acceleration.x = -maxVelocity.x * 4;
		facing = FlxObject.LEFT;
	}

	public function moveRight() {
		acceleration.x = maxVelocity.x * 4;
		facing = FlxObject.RIGHT;
	}

	public function jump() {
		// only if they are on the floor or something else like that
		if (isTouching(FlxObject.FLOOR)) {
			jumping = true;
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

}