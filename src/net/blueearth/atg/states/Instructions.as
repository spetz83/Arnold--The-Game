package net.blueearth.atg.states
{
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	
	public class Instructions extends FlxState
	{
		
		[Embed(source='assets/images/bg.png')]
		private var Bg:Class;
		
		public function Instructions()
		{
			super();
		}
		
		override public function create():void
		{
			var bg:FlxSprite = new FlxSprite(0, 0, Bg);
			add(bg);
			
			var instructions1:FlxText = new FlxText(FlxG.width*0.5 - 200, 20, 400, "Instructions:");
			instructions1.setFormat(null, 25, 0x000000, "center");
			add(instructions1);
			
			var instructions2:FlxText = new FlxText(FlxG.width*0.5 - 200, 80, 400, "You are in the Jungle.");
			instructions2.setFormat(null, 20, 0x00FF00, "center");
			add(instructions2);
			
			var instructions3:FlxText = new FlxText(FlxG.width*0.5 - 200, 120, 400, "Kill the predators in order to get to da choppa.");
			instructions3.setFormat(null, 20, 0x00FF00, "center");
			add(instructions3);
			
			
			var instructions4:FlxText = new FlxText(FlxG.width*0.5 - 200, 200, 400, "Press [x] to Continue");
			instructions4.setFormat(null, 25, 0xFF0000, "center");
			add(instructions4);
		}
		
		override public function update():void
		{
			if(FlxG.keys.X)
			{
				FlxG.switchState(new MainState());
			}
			super.update();
		}
	}
}