package beta.game 
{
	import Box2D.Common.Math.b2Vec2;
	import flash.media.Microphone;
	//import flash.media.Microphone;
	/**
	 * ...
	 * @author daniel
	 */
	public class Level 
	{
		public var name:String;
		public var minX:Number;
		public var maxX:Number
		public var maxScore:Number;
		public var startingFuel:Number;
		public var startingPosition:b2Vec2;
		public var baseStartingFuel:Number;
		public var topography:Array;
		public var doodads:Array;
		public var platforms:Array
		
		public function Level(options) 
		{
			name  =options.name
			minX  =options.minX
			maxX =options.maxX
			maxScore=options.maxScore
			startingFuel=options.startingFuel
			startingPosition=options.startingPosition
			baseStartingFuel=options.baseStartingFuel
			topography=options.topography
			doodads=options.doodads
			platforms=options.platforms				
		}
		
	}

}