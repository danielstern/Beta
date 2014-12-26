package beta.units.enemies {
	import beta.components.guns.Gun;
	import Box2D.Common.Math.b2Vec2;
	public class EnemyBasicShootingShip extends EnemyRandomThrusterShip 
	{
		
		public function EnemyBasicShootingShip(world) 
		{
			super(world);
			movesRandomly = false;
			addGuns();
		}
		
		protected function addGuns() {
			var gun:Gun = addGun(new Gun(world),new b2Vec2(-0.5,0));
			gun.bulletsCollideWith = 'friend';
			gun.startFiring();
			gun.cooldownTime = 500;
		}
		
		override protected function tick() {
			super.tick();
			if (!killed) {
				gunsStartFiring();
			}
		}
		
	}

}