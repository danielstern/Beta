package beta.games {
	import beta.components.*;
	import beta.core.*;
	import beta.events.SpawnedChildEvent;
	import beta.representations.BasicRepresentation;
	import beta.units.*;
	import Box2D.Common.Math.*;
	import Box2D.Dynamics.*;
	import com.kircode.EasyKeyboard.*;
	import flash.display.*;
	import flash.utils.*;
		

	import beta.units.Mine;
	import beta.units.Asteroid;
	import beta.units.*;
	import beta.powerups.*;


	
	public class BasicTestGame 
	{
		protected var world:b2World;
		public var boxScale = 30;
	
		public function BasicTestGame(gameContainer:MovieClip,stage:Stage) 
		{
			var controlledObject:ControllableObject;
			var keyboard:EasyKeyboard = new EasyKeyboard(stage);
			//var sounds = new BasicSoundOutput(gameContainer);
			var gameHeight = gameContainer.containerHeight;
			var gameWidth = gameContainer.containerWidth;	
			
			
			
			world = new b2World(new b2Vec2(0, 0), false); 
			var debug:b2DebugDraw = new b2DebugDraw();
			debug.SetSprite(gameContainer);
			debug.SetDrawScale(boxScale);
			debug.SetAlpha(1);
			debug.SetFillAlpha(1);
			debug.SetLineThickness(1);
			//debug.SetFlags(b2DebugDraw.e_shapeBit | b2DebugDraw.e_jointBit | b2DebugDraw.e_aabbBit | b2DebugDraw.e_pairBit | b2DebugDraw.e_centerOfMassBit);
			debug.SetFlags(b2DebugDraw.e_shapeBit);

			world.SetDebugDraw(debug);
			setInterval(function(world:b2World) {
				world.Step(1,1,1);
				world.DrawDebugData();
			}, 1,world);
			
			function spawnHero() { 
				
				var hero:Gunship = new BasicHeroShip(world);
				
				controlledObject = hero;
				hero.activate();					
				
				keyboard.addEasyListener("W", controlledObject.startUp, controlledObject.stopUp);
				keyboard.addEasyListener("A", controlledObject.startLeft, controlledObject.stopLeft);
				keyboard.addEasyListener("S", controlledObject.startDown, controlledObject.stopDown);
				keyboard.addEasyListener("D", controlledObject.startRight, controlledObject.stopRight);
				keyboard.addListener(32, controlledObject.startAction1, controlledObject.stopAction1);
				
				var rep = new BasicRepresentation(hero,boxScale);
				gameContainer.addChild(rep);
				
				hero.addEventListener(DestructibleObject.DESTROYED, spawnHero);
				hero.addEventListener(SpawnedChildEvent.SPAWNED, function(e:SpawnedChildEvent) {
					//trace("Hero spawned a child.");
					//gameContainer.addChild(new BasicRepresentation(e.child, boxScale));
				})
					
			}
			
			
			spawnHero();
			
			
			setInterval(function() {
				var enemy:ThornedObject = getRandomEnemy();
				trace("Spawn enemy: ", enemy);
				enemy.setBoxModelPosition(new b2Vec2(20, Math.random() * 10));
				enemy.activate();
			},1000)

			function getRandomEnemy() {
				var enemies = [
					Asteroid,
					EnemyBasicThrusterShip,
					EnemyCurvyThrusterShip,
					Mine,
					EnemyRandomThrusterShip,
					EnemyBasicShootingShip,
					EnemyForkedShootingShip,
					BasicGunCountPowerup,
					BasicHealthPowerup
				];
				var Constructor = enemies[Math.floor(Math.random() * enemies.length)];
				return new Constructor(world);
			}
			
			gameContainer.addEventListener(Hero.NAME + ":" + DestructibleObject.DESTROYED, handleHeroDie);
			
			
			function handleHeroDie(e) {
				spawnHero();
			}
			
			
			

			
		}
		
	}

}