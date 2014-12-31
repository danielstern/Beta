package beta.game {
	/**
	 * ...
	 * @author daniel
	 */
	public class Levels 
	{
		import Box2D.Common.Math.b2Vec2;
		
		public function Levels() 
		{
			
		}
		//
		//public function getRandomFormation(totalLength, maxHeight, minHeight) {
			//
		//}
		
		public static var level1:Level = new Level({
			name:"A Dream of Atomic Energy",
			minX: 500,
			maxX: 1050,
			maxScore: 1100,
			startingFuel: 500,
			startingPosition:new b2Vec2(740, 423),
			baseStartingFuel:1000,
			topography:[
				[100, 15, 20, 15],
				[100, 15, 20, 15],
				[100, 15, 20, 15],
				[100, 15, 20, 15],
				[100, 15, 20, 15],
				[10, 15, 140, 120],
				[15, 120, 160, 130],
				[14, 130, 170, 110],
				[12, 110, 130, 80],
				[10,80,50,30],
				[10,30,105,100],
				[30,100,105,100],
				[30, 100, 120, 77],
				[10, 77, 90, 85],
				[10, 85, 150, 130],
				[20, 130, 180, 160],
				[20, 160, 170, 110],
				[10, 110, 130, 80],
				[10, 80, 90, 60],
				[20, 60, 75, 20],
				[10, 15, 25, 20],
				[15, 20, 35, 32],
				[14, 32, 55, 40],
				[28, 40, 70, 60],
				[10,10,50,30],
				[10,30,105,100],
				[30,100,105,100],
				[30, 100, 120, 77],
				[10, 77, 90, 85],
				[10, 85, 150, 130],
				[20, 130, 180, 160],
				[20, 160, 190, 140],
				[10, 140, 220, 200],
				[10, 200, 210, 190],
				[40, 190, 195, 190],
				[30, 190, 210, 30],
				[120, 30, 60, 25]
			],
			platforms:[ 
			{
				position:new b2Vec2(740, 430),
				width: 10,
				platformType:'start'
			},
			{
				position:new b2Vec2(580, 360),
				platformType:'goal',
				difficulty:'med',
				width: 15,
				points:500
			},
			{
				position:new b2Vec2(830, 360),
				platformType:'goal',
				difficulty:'easy',
				width: 20,
				points:300
			},
			{
				position:new b2Vec2(980, 270),
				platformType:'goal',
				difficulty:'hard',
				width: 10,
				points:1000
			},
			],
			doodads:[
			{
				position:new b2Vec2(740, 400),
				type:'doodad',
				doodadType:'bonus',
				points:250
			}
			]
		});
		
	}

}