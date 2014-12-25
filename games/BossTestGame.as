package beta.games {
	import beta.components.*;
	import beta.core.*;
	import beta.events.*;
	import beta.powerups.*;
	import beta.representations.*;
	import beta.units.*;
	import Box2D.Common.Math.*;
	import Box2D.Dynamics.*;
	import com.kircode.EasyKeyboard.*;
	import flash.display.*;
	import flash.utils.*;
		



	
	public class BossTestGame extends BasicTestGame
	{
		
		public function BossTestGame(gameContainer:MovieClip,stage:Stage) 
		{
			super(gameContainer, stage);			
			var boss = spawnBoss();	
		
			
		}
		
		public function  spawnBoss(e = null) {
			var boss:ThornedObject = getBoss();
			boss.setBoxModelPosition(new b2Vec2(20, 4));
			boss.activate();
			boss.addEventListener(DestructibleObject.DESTROYED, spawnBoss);
			return boss;
		}
		
		public function getBoss() {
			var enemies = [
				Boss
			];
			var Constructor = enemies[Math.floor(Math.random() * enemies.length)];
			return new Constructor(world);
		}
		
	}

}