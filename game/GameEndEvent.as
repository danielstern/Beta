package beta.game 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author daniel
	 */
	public class GameEndEvent extends Event 
	{
		public static var WIN:String = 'win';
		public static var LOSE:String = 'lose';
		public var fuelRemaining:Number;
		public var fuelSpent:Number;
		public var bonusPoints:Number;
		public var platformPoints:Number;
		public var level;
		public var game:MoonLanderGame;
		public function GameEndEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{
			super(type, bubbles, cancelable);
			
		}
		
	}

}