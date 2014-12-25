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
		

	//import beta.units.Mine;
	import beta.units.Asteroid;
	//import beta.units.EnemyGun;
	//import beta.units.Enemy;
	//import beta.units.EnemyCurvyThrusterShip;
	//import beta.units.EnemyBasicThrusterShip;
	//import beta.units.EnemyBasicAttackingShip;
	//import beta.units.EnemyForkedAttackingShip;


	
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
			debug.SetFlags(b2DebugDraw.e_shapeBit | b2DebugDraw.e_jointBit | b2DebugDraw.e_aabbBit | b2DebugDraw.e_pairBit | b2DebugDraw.e_centerOfMassBit);

			world.SetDebugDraw(debug);
			setInterval(function(world:b2World) {
				world.Step(3, 1, 1);
				world.DrawDebugData();
			}, 25,world);
			
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
				var enemy:Enemy = getRandomEnemy();
				enemy.setBoxModelPosition(new b2Vec2(20, Math.random() * 10));
				enemy.activate();
			},1500)

			function getRandomEnemy() {
				var enemies = [
					new Asteroid(world)
					//new EnemyBasicThrusterShip(),
					//new EnemyCurvyThrusterShip, 
					//new Mine(), 
					//new EnemyBasicAttackingShip(),
					//new EnemyForkedAttackingShip(), 
					//new BasicGunCountPowerup(),
					//new BasicHealthPowerup()
				];
				return enemies[Math.floor(Math.random() * enemies.length)];
			}
			
			gameContainer.addEventListener(Hero.NAME + ":" + DestructibleObject.DESTROYED, handleHeroDie);
			
			
			function handleHeroDie(e) {
				spawnHero();
			}
			
			
			

			
		}
		
	}

}