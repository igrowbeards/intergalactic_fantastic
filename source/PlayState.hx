package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.tile.FlxTilemap;
import flixel.group.FlxGroup;
import flixel.group.FlxTypedGroup;
import openfl.Assets;
import flixel.util.FlxTimer;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState {

	public var player:Player;
	public var level:FlxTilemap;
	public var transporters:FlxTypedGroup<Transporter>;
	public var gravTime:Float = 3;
	public var hud:HUD;
	public var warningTime:Float = .1;
	public var spikes:FlxTypedGroup<Spike>;
	public var crates:FlxTypedGroup<Crate>;
	public var coins:FlxTypedGroup<Coin>;
	public var totalCoins:Int;

	override public function create():Void {
		FlxG.cameras.bgColor = 0xff131c1b;
		#if !FLX_NO_MOUSE
			FlxG.mouse.hide();
		#end

		addPorters();

		player = new Player(18,37);
		add(player);

		super.create();
		level = new FlxTilemap();
		level.loadMap(Assets.getText("data/mapCSV_Group1_Map1.csv"), "images/tiles.png",16,16,0,0,1,1);
		add(level);
		//FlxTimer.start(gravTime,switchGravity);

		spikes = new FlxTypedGroup();
		add(spikes);

		crates = new FlxTypedGroup();
		add(crates);

		coins = new FlxTypedGroup();
		add(coins);

		parseObjects();


		hud = new HUD();
		add(hud);
	}

	override public function destroy():Void {
		super.destroy();
	}

	override public function update():Void {

		if (FlxG.keys.justPressed.S) {
			rotateClockwise();
		}

		if (FlxG.keys.justPressed.A) {
			rotateCounterClockwise();
		}

		super.update();
		FlxG.collide(player,level);
		FlxG.collide(player,crates);
		FlxG.overlap(player,transporters,transport);
		FlxG.overlap(player,spikes,playerHitSpike);
		FlxG.collide(crates,spikes);
		FlxG.collide(crates,level);
		FlxG.collide(player,coins,playerGetCoin);
	}

	private function transport(p:FlxSprite,t:FlxSprite) {
		var trans = cast(t,Transporter);
		var transTarg = cast(trans.target,Transporter);
		trans.deactivate();
		transTarg.deactivate();
		p.x = transTarg.x + 8;
		p.y = transTarg.y + 6;
	}

	private function playerHitSpike(p:FlxSprite,s:FlxSprite) {
		FlxG.resetState();
	}

	private function playerGetCoin(p:FlxSprite,c:FlxSprite) {
		c.exists = false;
	}

	private function addPorters() {

		transporters = new FlxTypedGroup();
		transporters.add(new Transporter(14,16));
		transporters.add(new Transporter(33,33));
		transporters.add(new Transporter(5,10));
		transporters.add(new Transporter(3,33));
		transporters.add(new Transporter(31,5));
		transporters.add(new Transporter(18,27));

		var i = 0;
		while (i < transporters.length) {
			transporters.members[i].target = transporters.members[i + 1];
			transporters.members[1].arrayPos = i;
			transporters.members[1].arrayPos = i;
			transporters.members[i + 1].target = transporters.members[i];
			switch (i) {

				case 0:
					transporters.members[i].curColor = "red";
					transporters.members[i + 1].curColor = "red";
				case 2:
					transporters.members[i].curColor = "green";
					transporters.members[i + 1].curColor = "green";
				case 4:
					transporters.members[i].curColor = "blue";
					transporters.members[i + 1].curColor = "blue";

			}

		    i += 2;
		}
		add(transporters);
	}

	public function rotateClockwise() {
		switch (Reg.gravityDir) {
			case "up":
				Reg.gravityDir = "right";
				hud.notifyGravChange("right");
			case "right":
				Reg.gravityDir = "down";
				hud.notifyGravChange("down");
			case "down":
				Reg.gravityDir = "left";
				hud.notifyGravChange("left");
			case "left":
				Reg.gravityDir = "up";
				hud.notifyGravChange("up");
		}
		FlxTimer.start(warningTime,switchGravityNow);

	}

	public function rotateCounterClockwise() {
		switch (Reg.gravityDir) {
			case "up":
				Reg.gravityDir = "left";
				hud.notifyGravChange("left");
			case "right":
				Reg.gravityDir = "up";
				hud.notifyGravChange("up");
			case "down":
				Reg.gravityDir = "right";
				hud.notifyGravChange("right");
			case "left":
				Reg.gravityDir = "down";
				hud.notifyGravChange("down");
		}
		FlxTimer.start(warningTime,switchGravityNow);
	}

	public function switchGravity(curGrav:Int) {
		switch ((5)) {
			case 1:
				Reg.gravityDir = "left";
				hud.notifyGravChange("left");
			case 2:
				Reg.gravityDir = "right";
				hud.notifyGravChange("right");
			case 3:
				Reg.gravityDir = "up";
				hud.notifyGravChange("up");
			case 4:
				Reg.gravityDir = "down";
				hud.notifyGravChange("down");
		}
		FlxTimer.start(warningTime,switchGravityNow);
	}

	public function switchGravityNow(t:FlxTimer) {
		player.changeGravity();
		//FlxTimer.start(gravTime,switchGravity);

	}

	private function parseObjects() {
		var spikeMap:FlxTilemap = new FlxTilemap();

		spikeMap.loadMap(Assets.getText("data/mapCSV_Group2_Map1.csv"), "images/tiles.png",16,16);

		for (ty in 0...spikeMap.heightInTiles) {

			for (tx in 0...spikeMap.widthInTiles) {

				if (spikeMap.getTile(tx,ty) == 2) {
					spikes.add(new Spike(tx,ty));
				}
				/*
				if (spikeMap.getTile(tx,ty) == 1) {
					crates.add(new Crate(tx,ty));
				}
				*/
				if (spikeMap.getTile(tx,ty) == 3) {
					coins.add(new Coin(tx,ty));
				}
			}
		}
	}

}