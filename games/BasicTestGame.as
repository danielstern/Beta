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
		

	import beta.units.enemies.*;
	import beta.units.*;
	import beta.powerups.*;
	
	import beta.components.ships.*;


	
	public class BasicTestGame 
	{
		protected var world:b2World;
		public var boxScale = 30;
		public var controlledObject:ControllableObject;
		public var keyboard:EasyKeyboard
		protected var gameHeight;
		protected var gameWidth;
		public var cycle = 0;
		private var active = false;
		private var timer;
		public var hero:Hero;
		protected var container; 
		public var lastTime;
	
		public function BasicTestGame(gameContainer:MovieClip,stage:Stage) 
		{
			container = gameContainer;
			keyboard = new EasyKeyboard(stage);
			gameHeight = gameContainer.containerHeight;
			gameWidth = gameContainer.containerWidth;					
			
		}
		
		private function onInterval() {
			if (active) {
				tick();
			}
		}
		
		public function start() {
			active = true;
			
			lastTime = getTimer();
			

			world = new b2World(new b2Vec2(0, 0), false); 
			var debug:b2DebugDraw = new b2DebugDraw();
			debug.SetSprite(container);
			debug.SetDrawScale(boxScale);
			debug.SetAlpha(1);
			debug.SetFillAlpha(1);
			debug.SetLineThickness(1);
			//debug.SetFlags(b2DebugDraw.e_shapeBit | b2DebugDraw.e_jointBit | b2DebugDraw.e_aabbBit | b2DebugDraw.e_pairBit | b2DebugDraw.e_centerOfMassBit);
			debug.SetFlags(b2DebugDraw.e_shapeBit);

			world.SetDebugDraw(debug);
			timer = setInterval(onInterval, 1);
			
			hero = spawnHero();
			
		}
		
		public function stop() {
			active = false;
		}
		
		public function tick() {
			var currentTime = getTimer();
			var dt = (currentTime - lastTime) / 2;
			cycle++;
			//world.Step(dt,dt,dt);
			//world.Step(dt,1,1);
			world.Step(1,2,2);
			world.DrawDebugData();
			lastTime = currentTime;
			
		}
		
		public function  spawnEnemy() {
			var enemy:ThornedObject = getRandomEnemy();
			trace("Spawn enemy: ", enemy);
			enemy.setBoxModelPosition(new b2Vec2(20, Math.random() * 10));
			//enemy.setBoxModelPosition(new b2Vec2(20, 5));
			enemy.activate();
		}
		
		public function spawnPowerup():Powerup {
			var powerup:Powerup = getRandomPowerup();
			powerup.setBoxModelPosition(new b2Vec2(20, Math.random() * 10));
			powerup.activate();
			return powerup;
		}
		
		public function handleHeroDie(e) {
			spawnHero();
		}
			
		
		public function getRandomEnemy() {
			var enemies = [
				Asteroid,
				EnemyBasicThrusterShip,
				EnemyCurvyThrusterShip,
				Mine,
				EnemyRandomThrusterShip,
				EnemyBasicShootingShip,
				EnemyForkedShootingShip
			];
			var Constructor = enemies[Math.floor(Math.random() * enemies.length)];
			return new Constructor(world);
		}
		
		public function getRandomPowerup() {
			var powerUps = [
				BasicGunCountPowerup,
				BasicHealthPowerup
			];
			var Constructor = powerUps[Math.floor(Math.random() * powerUps.length)];
			return new Constructor(world);
		}
		
	
		
		public function spawnHero(e = null) { 
				
			var hero:Gunship = new BasicHeroShip(world);
			
			controlledObject = hero;
			hero.activate();					
			
			keyboard.addEasyListener("W", controlledObject.startUp, controlledObject.stopUp);
			keyboard.addEasyListener("A", controlledObject.startLeft, controlledObject.stopLeft);
			keyboard.addEasyListener("S", controlledObject.startDown, controlledObject.stopDown);
			keyboard.addEasyListener("D", controlledObject.startRight, controlledObject.stopRight);
			keyboard.addListener(32, controlledObject.startAction1, controlledObject.stopAction1);
			
			//var rep = new BasicRepresentation(hero,boxScale);
			//gameContainer.addChild(rep);
			
			hero.addEventListener(DestructibleObject.DESTROYED, spawnHero);
			hero.addEventListener(SpawnedChildEvent.SPAWNED, function(e:SpawnedChildEvent) {
				//trace("Hero spawned a child.");
				//gameContainer.addChild(new BasicRepresentation(e.child, boxScale));
			});
			
			return hero;
				
		}
		
	}

}