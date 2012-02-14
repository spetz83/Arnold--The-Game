package net.blueearth.atg.characters
{
	import net.blueearth.atg.states.MainState;
	
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	
	public class Arnie extends FlxSprite
	{
		[Embed(source='assets/images/hero/hero.png')]
		private var Hero:Class;
		private var _jumpPower:int;
		
		private var _bullets:FlxGroup;
		
		public function Arnie(X:Number, Y:Number, bullets:FlxGroup)
		{
			super(X, Y);
			
			loadGraphic(Hero, true, true, 40, 60, true);
			
			_bullets = bullets;
			
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
			//setupBullets(6);
		}
		
		private function shoot():void
		{
			var xVelocity:Number;
			if(this.facing == LEFT)
			{
				xVelocity = 200;
			}
			else
			{
				xVelocity = -200;
			}
			trace("shooting");
			/*for(var i:int=0; i<_bullets.length; i++)
			{
				if(!_bullets[i].exists)
				{
					_bullets[i].reset(this.x, this.y +2, xVelocity);
					return;
				}
			}
			
			var bullet:Bullet = new Bullet(this.x, this.y+2, xVelocity);
			bullet.reset(this.x, this.y, xVelocity);
			_bullets.push(MainState.l*/
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
			
			if(FlxG.keys.justPressed("B"))
			{
				getMidpoint(_point);
				(_bullets.recycle(Bullet) as Bullet).shoot(_point, facing);
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