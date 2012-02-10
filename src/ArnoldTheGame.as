package
{
	import net.blueearth.atg.states.MainState;
	import net.blueearth.atg.states.MenuState;
	
	import org.flixel.FlxG;
	import org.flixel.FlxGame;
	
	[SWF(width='800', height='600', backgroundColor='#ffffff', frameRate='30')]
	
	public class ArnoldTheGame extends FlxGame
	{
		public function ArnoldTheGame()
		{
			super(400, 300, MainState, 2);
		}
	}
}