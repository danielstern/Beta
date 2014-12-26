package beta.games {
	import beta.core.DestructibleObject;
	import beta.units.enemies.Boss;
	import Box2D.Common.Math.b2Vec2;
	import flash.display.MovieClip;
	import flash.display.Stage;
	
	public class BossTestGame extends BasicTestGame
	{
		
		public function BossTestGame(gameContainer:MovieClip,stage:Stage) 
		{
			super(gameContainer, stage);			
			
		}
		
		override public function start() {
			super.start();
			var boss = spawnBoss();	
		}
		
		public function spawnBoss(e = null) {
			var boss:Boss = getBoss();
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