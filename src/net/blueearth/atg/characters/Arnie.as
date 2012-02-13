package net.blueearth.atg.characters
{
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	
	public class Arnie extends FlxSprite
	{
		[Embed(source='assets/images/hero/hero.png')]
		private var Hero:Class;
		private var _jumpPower:int;
		
		
		
		public function Arnie(X:Number=0, Y:Number=0, SimpleGraphic:Class=null)
		{
			super(X, Y);
			loadGraphic(Hero, true, true, 40, 60, true);
			
			width = 30;
			height = 55;
			//offset.x = 1;
			//offset.y = 1;
			centerOffsets();
			
			var runSpeed:int = 80;
			
			drag.x = runSpeed*8;
			acceleration.y = 420;
			
			_jumpPower = 250;
			maxVelocity.x = runSpeed;
			maxVelocity.y = _jumpPower;
			
			addAnimation('idle', [0]);
			addAnimation('run', [1, 2, 3, 4, 5, 6, 0], 40);
		}
		
		override public function update():void
		{
			acceleration.x = 0;
			if(FlxG.keys.A)
			{
				facing = LEFT;
				acceleration.x -= drag.x;
			}
			else if(FlxG.keys.D)
			{
				facing = RIGHT;
				acceleration.x += drag.x;
			}
			if(FlxG.keys.justPressed("SPACE") && !velocity.y)
			{
				velocity.y = -_jumpPower;
				//FlxG.play(SndJump);
			}
			
			if(velocity.y != 0)
			{
				/*if(_aim == UP) play("jump_up");
				else if(_aim == DOWN) play("jump_down");
				else play("jump");*/
				
			}
			else if(velocity.x == 0)
			{
				play('idle');
			}
			else
			{
				play('run');
			}
		}
	}
}