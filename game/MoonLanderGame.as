package beta.game 
{
	/**
	 * ...
	 * @author daniel
	 */
	import beta.entity.MoonLander;
	import beta.models.MoonLanderModel;
	import beta.displays.DebugDisplay;
	public class MoonLanderGame 
	{
		
		public var accumulatedScoreCurrentLevel;
		
		
		
		public function MoonLanderGame(level:Object,display) 
		{
			
		}
		
				
		public function start() {
						
			createMoonSurface(level.topography);
			createPlatforms(level.platforms);
			createDoodads(level.doodads);
			
			moonLanderModel = new MoonLanderModel(_world, currentLevel.startingPosition);
			lander = new MoonLander(moonLanderModel.chassis,level.startingFuel);
			accumulatedScoreCurrentLevel = 0;
			
			debugDisplay.visible = true;
			debugDisplay.WASDControl(stage, lander);		
			
			shipAlive = true;
			successfulLanding = false;
			levelRunning = true;
			queuedToExitGameLevel = false;
		}
		
		public function createDoodads(doodads) {
			doodads.forEach(function(doodad) {
				if (doodad.doodadType === 'bonus') {
					//trace("create bonus.");
					var body = createBonusBody();
					doodad.body = body;
					body.SetPosition(doodad.position);
					body.SetUserData(doodad);
					bonusBodies.push(body);
				}				
			})
			
		}
		public function createBonusBody() {
			var bonusBodyDef:b2BodyDef = new b2BodyDef();
			bonusBodyDef.type = b2Body.b2_staticBody;
			var bonusBody:b2Body = _world.CreateBody(bonusBodyDef);
			
			var bonusFixtureDef:b2FixtureDef = new b2FixtureDef();
			bonusFixtureDef.restitution = 0.1;
			bonusFixtureDef.friction = 1;
			bonusFixtureDef.filter.categoryBits = 0x0010;
			bonusFixtureDef.filter.maskBits = 0x0001;
			bonusFixtureDef.isSensor = true;
			
			var bonusShape:b2PolygonShape = new b2PolygonShape();
			bonusShape.SetAsBox(1, 1);
			bonusFixtureDef.shape = bonusShape;
			bonusBody.CreateFixture(bonusFixtureDef);
			
			
			return bonusBody;
		}
	
		
		
		public function destroyLander() {
			if (!shipAlive) return;
			lander.destroy();
			moonLanderModel.explode();			
			shipAlive = false;
			
			
		}
		
		public function endLevel() {
			if (levelRunning) {	
				//trace("end level.");
				levelRunning = false;
				debugDisplay.visible = false;
				destroyLander();
				clearAllBodies();
			}
		}
		
		function clearAllBodies() {
			moonPeakBodies.forEach(function(b) {
				_world.DestroyBody(b);
			});
			
			platformBodies.forEach(function(b) {
				_world.DestroyBody(b);
			});
			
			
			bonusBodies.forEach(function(b) {
				_world.DestroyBody(b);
			});
			
			
		}
		
	
		public function getPeak(width = 10, leftHeight = 0,midHeight = 2,rightHeight = 1) {
			var peakBodyDef:b2BodyDef = new b2BodyDef();
			var ZERO = 0;
		
			peakBodyDef.type = b2Body.b2_staticBody;
		
			var peakBody:b2Body = _world.CreateBody(peakBodyDef);
			var height:Number = 1000;
			var crustHeight:Number = 600;
			peakBody.SetUserData({type:'moon'});
			
			var peakFixtureDef:b2FixtureDef = new b2FixtureDef();
			peakFixtureDef.restitution = 0.1;
			peakFixtureDef.friction = 1;
			peakFixtureDef.filter.categoryBits = 0x0010;
			peakFixtureDef.filter.maskBits = 0x0001;
			
			var peakShape:b2PolygonShape = new b2PolygonShape();
			var leftLowerPoint = new b2Vec2(ZERO, height);
			var rightLowerPoint = new b2Vec2(width, height);
			var leftUpperPoint = new b2Vec2(ZERO, height - leftHeight - crustHeight);
			var middleUpperPoint = new b2Vec2(width / 2, height - midHeight - crustHeight);
			var rightUpperPoint = new b2Vec2(width, height - rightHeight - crustHeight);

			peakShape.SetAsArray([rightLowerPoint,leftLowerPoint,leftUpperPoint,middleUpperPoint,rightUpperPoint]);
			
			peakFixtureDef.shape = peakShape;
			
			peakBody.CreateFixture(peakFixtureDef);
			
			return peakBody;
		}
		
		public function getPlatform(width = 5) {
			var platformBodyDef:b2BodyDef = new b2BodyDef();
			platformBodyDef.type = b2Body.b2_staticBody;
			var platformBody:b2Body = _world.CreateBody(platformBodyDef);
			
			var platformFixtureDef:b2FixtureDef = new b2FixtureDef();
			platformFixtureDef.restitution = 0.1;
			platformFixtureDef.friction = 1;
			platformFixtureDef.filter.categoryBits = 0x0010;
			platformFixtureDef.filter.maskBits = 0x0001;
			
			var platformShape:b2PolygonShape = new b2PolygonShape();

			platformShape.SetAsBox(width, 2);
			platformFixtureDef.shape = platformShape;
			platformBody.CreateFixture(platformFixtureDef);
			
			
			return platformBody;
		}

	
		
		public function createMoonSurface(topography) {
		
			var distanceFromLeftSoFar:Number = 0;
			topography.forEach(function(topo,index) {
				
				var peak:b2Body = getPeak(topo[0],topo[1],topo[2],topo[3]);
				peak.SetPosition(new b2Vec2(distanceFromLeftSoFar, 70));
				distanceFromLeftSoFar += topo[0]
				moonPeakBodies.push(peak);
			});
			
			
		}
		
		public function createPlatforms(platforms) {
		
			platforms.forEach(function(platform) {	
		
				var platformBody:b2Body = getPlatform(platform.width);
				platformBody.SetPosition(platform.position);
				platform.type = 'platform';
				platformBody.SetUserData(platform);
				
				platformBodies.push(platformBody);
			});
			
			
		}
		
	}

}