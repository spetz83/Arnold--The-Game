package net.blueearth.atg.states
{
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	
	public class GameOverState extends FlxState
	{
		
		[Embed(source='assets/images/bg.png')]
		private var Bg:Class;
		
		[Embed(source='assets/images/gameover/handshake.jpg')]
		private var Handshake:Class;
		
		[Embed(source='assets/images/gameover/jesse.jpg')]
		private var Jesse:Class;
		
		[Embed(source='assets/images/gameover/mud.jpg')]
		private var Mud:Class;
		
		[Embed(source='assets/images/gameover/predator.jpg')]
		private var Predator:Class;
		
		[Embed(source='assets/audio/winner.mp3')]
		private var SoundWinner:Class;
		
		
		public function GameOverState()
		{
			super();
		}
		
		override public function create():void
		{
			var bg:FlxSprite = new FlxSprite(0, 0, Bg);
			add(bg);
			
			var handshake:FlxSprite = new FlxSprite(0, 0, Handshake);
			add(handshake);
			
			var jesse:FlxSprite = new FlxSprite(FlxG.width-150, FlxG.height-113, Jesse);
			add(jesse);
			
			var mud:FlxSprite = new FlxSprite(0, FlxG.height-113, Mud);
			add(mud);
			
			var predator:FlxSprite = new FlxSprite(FlxG.width-144, 0, Predator);
			add(predator);
			
			var logoLarge:FlxText = new FlxText(FlxG.width*0.5 - 100, 120, 200, "You Win!");
			logoLarge.setFormat(null, 30, 0xFF0000, "center");
			add(logoLarge);
			
			FlxG.play(SoundWinner);
		}
		
		override public function update():void
		{
			/*if(FlxG.keys.Z)
			{
				FlxG.switchState(new MainState());
			}
			else if(FlxG.keys.X)
			{
				FlxG.switchState(new Instructions());
			}*/
			super.update();
		}
	}
}