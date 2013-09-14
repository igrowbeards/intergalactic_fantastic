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

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState {

	public var player:Player;
	public var level:FlxTilemap;
	public var transporters:FlxTypedGroup<Transporter>;

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
	}

	override public function destroy():Void {
		super.destroy();
	}

	override public function update():Void {
		super.update();
		FlxG.collide(player,level);
		FlxG.overlap(player,transporters,transport);
	}

	private function transport(p:FlxSprite,t:FlxSprite) {
		var trans = cast(t,Transporter);
		var transTarg = cast(trans.target,Transporter);
		trans.deactivate();
		transTarg.deactivate();
		p.x = transTarg.x;
		p.y = transTarg.y + 16;
	}

	private function addPorters() {

		transporters = new FlxTypedGroup();
		transporters.add(new Transporter(9,10));
		transporters.add(new Transporter(22,2));
		transporters.add(new Transporter(4,25));
		transporters.add(new Transporter(34,37));
		transporters.add(new Transporter(19,27));
		transporters.add(new Transporter(9,35));

		var i = 0;
		while (i < transporters.length) {
			transporters.members[i].target = transporters.members[i + 1];
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

}