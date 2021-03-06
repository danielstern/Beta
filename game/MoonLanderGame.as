package beta.game 
{
	/**
	 * ...
	 * @author daniel
	 */
	import beta.entity.MoonLander;
	import beta.models.MoonLanderModel;
	import beta.displays.DebugDisplay;
	import flash.display.MovieClip;
	import flash.events.EventDispatcher;
	import flash.utils.clearInterval;
	
	import beta.displays.DebugDisplay;
	import beta.entity.MoonLander;
	import beta.game.MoonLanderGame;
	import beta.models.MoonLanderModel;
	import beta.physics.BoxHelpers;
	import Box2D.Collision.Shapes.b2PolygonShape;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Dynamics.b2FixtureDef;
	import Box2D.Dynamics.b2World;
	import Box2D.Dynamics.Contacts.b2ContactEdge;
	import flash.display.MovieClip;
	import flash.events.Event;
	import com.kircode.EasyKeyboard.*;
	import flash.events.MouseEvent;
	import flash.utils.setInterval;
	import beta.game.Levels;
	
	public class MoonLanderGame extends MovieClip
	{
		
		private var accumulatedScoreCurrentLevel;		
		private var queuedToExitGameLevel = false;		
		private var _world:b2World;
		private var debugDisplay:DebugDisplay;
		private var moonLanderModel:MoonLanderModel;
		private var gameWidth = 550;
		private var gameHeight = 400;
		private var lander:MoonLander;
		private var shipAlive = false;
		private var successfulLanding = false;
		private var moonPeakBodies = [];
		private var bonusBodies = [];
		private var platformBodies = [];
		private var closePlatformMinDistance = 60;
		private var REGULAR_ZOOM = 1.5;
		private var CLOSE_ZOOM = 3;
		private var ADJUSTED_LUNAR_GRAVITY = 0.1622 / 4;
		private var maxSafeLandingXVelocity = 0.7;
		private var maxSafeLandingYVelocity = 0.7;
		private var timer;
		
		private var _level;
		private var _target:MovieClip;
		private var _stage;
		
		private var platformScore = 0;
		private var bonusScore = 0;
		
		//
		public var devMeta;
		private var _upgrade:LanderUpgrader;
		//
		
		public function MoonLanderGame(level:Object,target:MovieClip,upgrader:LanderUpgrader) 
		{
			super();
			_level = level;
			_target = target;
			//_stage = stage;
			_upgrade = upgrader;
			
			devMeta = _target.devMeta;
		}
		
		public function start() {
			
			_world = new b2World(new b2Vec2(0, ADJUSTED_LUNAR_GRAVITY),false);
			createDisplay();
						
			createMoonSurface(_level.topography);
			createPlatforms(_level.platforms);
			createDoodads(_level.doodads);
			
			moonLanderModel = new MoonLanderModel(_world, _level.startingPosition);
			lander = new MoonLander(moonLanderModel.chassis,(_level.startingFuel + _upgrade.extraFuelCount) * _upgrade.fuelModifier, _upgrade.thrusterAccelerationModifier,_upgrade.thrusterPowerModifier);
			accumulatedScoreCurrentLevel = 0;
			
			//WASDControl(_stage, lander);		
			
			shipAlive = true;
			successfulLanding = false;
			queuedToExitGameLevel = false;
			
			timer = setInterval(function() {
				tick();
			},33);
		}
	
		
		public function getLanderEntity() {
			return lander;
		}

		public function tick() {
			
			if (!queuedToExitGameLevel) {	
		
				var shipPos:b2Vec2 = moonLanderModel.chassis.GetPosition();
				var closePlatform = getClosestPlatformToShip();					
				
				if (closePlatform) {
					debugDisplay.setZoom(CLOSE_ZOOM);
					debugDisplay.setFocus(closePlatform.position);
					_target.space.x = -closePlatform.position.x / 7;
					_target.space.y = -closePlatform.position.y / 7;
				} else {
					debugDisplay.setZoom(REGULAR_ZOOM);
					debugDisplay.setFocus(shipPos);
					_target.space.x = -shipPos.x / 7;
					_target.space.y = -shipPos.y /7;
				}
					
						
				getEntitiesTouchingShip().forEach(function(data) {
					if (data.type == 'moon') {
						destroyLander()
						gameLose();
					}
					
					if (data.type === 'doodad' && data.doodadType === 'bonus' ) {
						
						accumulatedScoreCurrentLevel += data.points;
						bonusScore+= data.points;
						_world.DestroyBody(data.body);						
						
					}
					
					if (data.type == 'platform') {
						handleLandOnPlatform(data);					
					}
				
				});
				
				
				
				if (shipAlive) {
					lander.step();
				}
				 
					
				updateOnscreenMeta();
				checkShipWithinBounds();
						
			
			}
			 
			
			_world.Step(1, 30, 30);
			_world.ClearForces();
				
			
		}
		
				
		public function updateOnscreenMeta() {					

			var vxDisplay = _target.vxDisplay;
			var vyDisplay = _target.vyDisplay;
			var fuelDisplay = _target.fuelDisplay;
			var scoreDisplay = _target.scoreDisplay;
			
			
			var vx = moonLanderModel.chassis.GetLinearVelocity().x.toFixed(2);
			var vy = moonLanderModel.chassis.GetLinearVelocity().y.toFixed(2);
			var shipPos = moonLanderModel.chassis.GetPosition();
			
			devMeta.text = "x:" + shipPos.x.toFixed(2) + ",y:" + shipPos.y.toFixed(2);
	
			fuelDisplay.text = "FUEL: " + lander.getFuel().toFixed(0);
			
			vxDisplay.text = "VX:" + vx +'m/s';
			vyDisplay.text = "VY:" +  vy + 'm/s';
			
			if (getClosestPlatformToShip(40) && getClosestPlatformToShip(40).platformType === 'goal') {
				if (vx > maxSafeLandingXVelocity || vx < -maxSafeLandingXVelocity) {
					vxDisplay.textColor = 0xFF0000;
				} else {
					vxDisplay.textColor = 0x00FF00;
				}
				
				if (vy > maxSafeLandingYVelocity) {
					vyDisplay.textColor = 0xFF0000;
				} else {
					vyDisplay.textColor = 0x00FF00;
				}
				
			} else {
				vxDisplay.textColor = 0xFFFFFF;
				vyDisplay.textColor = 0xFFFFFF;
			}
			
			
			scoreDisplay.text = "SCORE: " + accumulatedScoreCurrentLevel.toFixed(0);
			
		}
		
		public function createDisplay() {
			debugDisplay = new DebugDisplay(_world, 1, gameWidth, gameHeight);
			_target.addChild(debugDisplay);

		}
		
		public function handleLandOnPlatform(platform) {
			var landerMinX = moonLanderModel.getMinX();
			var landerMaxX = moonLanderModel.getMaxX();
			var platFormMinX = platform.position.x - platform.width;
			var platFormMaxX = platform.position.x + platform.width;
			var vx = moonLanderModel.chassis.GetLinearVelocity().x.toFixed(2);
			var vy = moonLanderModel.chassis.GetLinearVelocity().y.toFixed(2);
			
			if (platform.platformType === 'start') {
				devMeta.text = "READY FOR TAKEOFF.";
				if (lander.getFuel() < 1) {
					destroyLander();
				}
			} else if (platform.platformType === 'goal') {
				if (landerMinX < platFormMinX || landerMaxX > platFormMaxX) {
					destroyLander();
					gameLose();
					devMeta.text = "TOO FAR OFF THE EDGE."		
				} else if (vx > maxSafeLandingXVelocity * _upgrade.safeLandingSpeedModifier || vy > maxSafeLandingYVelocity *  _upgrade.safeLandingSpeedModifier) {
					destroyLander()
					gameLose();
					devMeta.text = "APPROACH VELOCITY TOO HIGH."
				} else {
					successfulLanding = true;
					devMeta.text = "LANDING SUCCESSFUL. +" + platform.points;
					accumulatedScoreCurrentLevel += platform.points;
					platformScore = platform.points;
					gameWin();
				}	
			}		
		}
		
		public function gameWin() {
			if (!queuedToExitGameLevel) {			
				dispatchGameEndEvent(GameEndEvent.WIN);
				queueGameExit();
			}
		}
		
		
		
		public function gameLose() {
			if (!queuedToExitGameLevel) {			
				queueGameExit();
				dispatchGameEndEvent(GameEndEvent.LOSE);
			}		
		}
		
		public function dispatchGameEndEvent(type) {
			var gameEndEvent:GameEndEvent = new GameEndEvent(type);
			gameEndEvent.fuelRemaining = lander.getFuel();
			gameEndEvent.platformPoints = platformScore;
			gameEndEvent.bonusPoints = bonusScore;
			gameEndEvent.fuelSpent = _level.startingFuel - lander.getFuel();
			gameEndEvent.level = _level;
			gameEndEvent.game = this;
			dispatchEvent(gameEndEvent);
		}
		
		public function kill(e = null) {
			clearInterval(timer);
			clearAllBodies();
		}
		
		public function queueGameExit() {
			queuedToExitGameLevel = true;
			
		}
		
		
		public function getClosestPlatformToShip(distance = null) {
			var shipPos:b2Vec2 = moonLanderModel.chassis.GetPosition();
			distance = distance || closePlatformMinDistance;
			var closePlatform;
			
			_level.platforms.forEach(function(platform) {
				var platformPos:b2Vec2 = platform.position;
				var dist = BoxHelpers.distanceTwoVectors(shipPos, platformPos);
				if (dist < distance) {
					closePlatform = platform;
				}
			});
					
			return closePlatform;
					
		}
		
		public function checkShipWithinBounds() {
			var shipPastLeft = moonLanderModel.getMinX() - _level.minX;
			var shipPastRight = moonLanderModel.getMaxX() - _level.maxX;
			if (shipPastLeft < 10) {
				devMeta.text = "WARNING: LOSING CONNECTION TO SHUTTLE.";
			}
			if (shipPastLeft < -100) {
				destroyLander();
				gameLose();
				devMeta.text = "CONNECTION LOST.";
			}
			
			if (shipPastRight > 10) {
				devMeta.text = "WARNING: LOSING CONNECTION TO SHUTTLE.";
			}
			if (shipPastRight > 100) {
				destroyLander();
				gameLose();
				devMeta.text = "CONNECTION LOST.";
			}
		}
		
				
		public function getEntitiesTouchingShip() {
			var entities = [];
			
			moonLanderModel.bodies.forEach(function(_body) {
				var body:b2Body = _body;
				var contacts:b2ContactEdge = body.GetContactList();
				while (contacts) {
					if (contacts.contact.IsTouching()) {					
						var dataA = contacts.contact.GetFixtureA().GetBody().GetUserData();
						var dataB = contacts.contact.GetFixtureB().GetBody().GetUserData();
						if (dataA) {
							if (dataA.type == 'moon'  || dataA.type == 'platform' || dataA.type == 'doodad') {
								entities.push(dataA);
							}
						}
						if (dataB) {
							if (dataB.type == 'moon'  || dataB.type == 'platform' || dataB.type == 'doodad') {
								entities.push(dataB);
							}
						}
							
					}
					contacts = contacts.next;
				};
			});
			
			return entities;
		}

		public function createDoodads(doodads) {
			doodads.forEach(function(doodad) {
				if (doodad.doodadType === 'bonus') {
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
		
		public function destroyLander() {
			if (shipAlive) {			
				lander.destroy();
				moonLanderModel.explode();			
				shipAlive = false;			
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
			
			bonusBodies = [];
			platformBodies = [];
			moonPeakBodies = [];
						
		}		
	}

}