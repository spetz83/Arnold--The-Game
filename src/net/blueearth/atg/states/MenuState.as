package net.blueearth.atg.states
{
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	
	public class MenuState extends FlxState
	{
		
		[Embed(source='assets/images/arnold.png')]
		private var Arnold:Class;
		
		[Embed(source='assets/images/bg.png')]
		private var Bg:Class;
		
		public function MenuState()
		{
			super();
		}
		
		override public function create():void
		{
			var bg:FlxSprite = new FlxSprite(0, 0, Bg);
			add(bg);
			
			var arnold:FlxSprite = new FlxSprite(20, 80, Arnold);
			add(arnold);
			
			var logoLarge:FlxText = new FlxText(FlxG.width*0.5 - 100, 15, 200, "Arnold:");
			logoLarge.setFormat(null, 30, 0x000000, "center");
			add(logoLarge);
			
			var logoSmall:FlxText = new FlxText(FlxG.width*0.5 - 100, 65, 200, "The Game");
			logoSmall.setFormat(null, 27, 0x00FF00, "center");
			add(logoSmall);
			
			var instructions1:FlxText = new FlxText(FlxG.width*0.5 - 100, 225, 200, "Press [z] to Start");
			instructions1.setFormat(null, 13, 0xFF0000, "center");
			add(instructions1);
			
			var instructions2:FlxText = new FlxText(FlxG.width*0.5 - 100, 250, 200, "Press [x] for Instructions");
			instructions2.setFormat(null, 13, 0xFF0000, "center");
			add(instructions2);
		}
		
		override public function update():void
		{
			if(FlxG.keys.Z)
			{
				FlxG.switchState(new MainState());
			}
			else if(FlxG.keys.X)
			{
				FlxG.switchState(new Instructions());
			}
			super.update();
		}
	}
}