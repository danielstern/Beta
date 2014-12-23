package beta
{
	import flash.display.*;
	import flash.events.Event;
	import flash.geom.Point;
	import beta.core.*;
	
	public class EnemyGun extends Gun
	{
		public function EnemyGun() {
			super();
			cooldownTime = 100;
		}
		
		
		override protected function getBullet() {
			return new EnemyBullet();			
		}
	}
}


