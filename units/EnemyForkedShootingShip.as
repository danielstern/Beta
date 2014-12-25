package beta.units 
{
	import beta.components.Gun;
	import Box2D.Common.Math.b2Vec2;
	public class EnemyForkedShootingShip extends EnemyBasicShootingShip 
	{
		
		public function EnemyForkedShootingShip(world) 
		{
			super(world);
		}
		
		override protected function enemyShipAddGuns() {
			var gun:Gun = addGun(new b2Vec2(-0.5,0.5),Math.PI * 1/4);
			gun.bulletsCollideWith = 'friend';
			
			var gun2:Gun = addGun(new b2Vec2(-0.5,-0.5),Math.PI * -1/4);
			gun2.bulletsCollideWith = 'friend';
		}
		
	}

}