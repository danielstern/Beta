package beta
{
	import flash.display.*;
	import flash.events.Event;
	
	public class ShipBullet extends Bullet
	{
		public function ShipBullet() {
			collisionType = 'friend';
			collidesWith = 'enemy';	
		}
	}
}


