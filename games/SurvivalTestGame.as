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
		

	import beta.units.enemies.Mine;
	import beta.units.enemies.Asteroid;
	import beta.units.*;
	import beta.powerups.*;


	
	public class SurvivalTestGame extends BasicTestGame
	{
	
		public function SurvivalTestGame(gameContainer:MovieClip,stage:Stage) 
		{
			super(gameContainer, stage);			
			//spawnHero();
			setInterval(spawnEnemy, 1000);	
				
			function handleHeroDie(e) {
				spawnHero();
			}

			
		}
		
		override public function tick() {
			super.tick();
			if (cycle % 1000 === 0) {
				spawnEnemy();
			}
			
			if (cycle % 5500 === 0) {
				spawnPowerup();
			}
		}
		
	}

}