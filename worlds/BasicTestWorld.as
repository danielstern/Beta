package beta.worlds 
{
	import beta.components.Bullet;
	import beta.components.Gunship;
	import beta.containers.BoxWorldContainer;
	import beta.core.ControllableObject;
	import beta.core.DestructibleObject;
	import beta.core.ActivatableObject;
	import beta.components.Gun;
	import beta.core.UpgradableObject;
	import beta.extras.BasicSoundOutput;
	import beta.containers.BasicContainer;
	import Box2D.Collision.Shapes.b2CircleShape;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Dynamics.b2DebugDraw;
	import Box2D.Dynamics.b2Fixture;
	import Box2D.Dynamics.b2FixtureDef;
		
	import Box2D.Dynamics.b2World;

	import beta.powerups.BasicGunCountPowerup;
	import beta.powerups.BasicHealthPowerup;
	import beta.units.Mine;
	import beta.units.BasicHeroShip;
	import beta.units.Asteroid;
	import beta.units.Hero;
	import beta.units.EnemyGun;
	import beta.units.Enemy;
	import beta.units.EnemyCurvyThrusterShip;
	import beta.units.EnemyBasicThrusterShip;
	import beta.units.EnemyBasicAttackingShip;
	import beta.units.EnemyForkedAttackingShip;
	import beta.powerups.Powerup;
	import com.kircode.EasyKeyboard.*;
	import flash.display.*;
	import flash.utils.*;


	import beta.containers.MetaDisplayingContainer;
	
	public class BasicTestWorld 
	{
		public function BasicTestWorld(gameContainer:BoxWorldContainer,stage:Stage) 
		{
			var controlledObject:ControllableObject;
			var keyboard:EasyKeyboard = new EasyKeyboard(stage);
			var sounds = new BasicSoundOutput(gameContainer);
			var gameHeight = gameContainer.containerHeight;
			var gameWidth = gameContainer.containerWidth;		
			
			function spawnHero() { 
				setTimeout(function() {
					var hero:Gunship = new BasicHeroShip();
					gameContainer.addChild(hero);
					controlledObject = hero;
					hero.activate();					
					
					keyboard.addEasyListener("W", controlledObject.startUp, controlledObject.stopUp);
					keyboard.addEasyListener("A", controlledObject.startLeft, controlledObject.stopLeft);
					keyboard.addEasyListener("S", controlledObject.startDown, controlledObject.stopDown);
					keyboard.addEasyListener("D", controlledObject.startRight, controlledObject.stopRight);
					keyboard.addListener(32, controlledObject.startAction1, controlledObject.stopAction1);
					
					//hero.x = 50;
					//hero.y = 150;
					
					
				
					
					//heroBody.ApplyForce(new b2Vec2(5, 5));
				
					
					
				},700);
			}
			
			
			spawnHero();
			
			
			//setInterval(function() {
				//var enemy:ActivatableObject = getRandomEnemy();
				//enemy.x = gameWidth - 5;
				//enemy.y = Math.random() * gameHeight -25;
				//gameContainer.addChild(enemy);
				//enemy.activate();
			//},1000)

			function getRandomEnemy() {
				var enemies = [
					new Asteroid(),
					new EnemyBasicThrusterShip(),
					new EnemyCurvyThrusterShip, 
					new Mine(), 
					new EnemyBasicAttackingShip(),
					new EnemyForkedAttackingShip(), 
					new BasicGunCountPowerup(),
					new BasicHealthPowerup()
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