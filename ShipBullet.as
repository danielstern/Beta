package beta
{
	import flash.display.*;
	import flash.events.Event;
	import beta.core.*;
	
	public class ShipBullet extends Bullet
	{
		public function ShipBullet() {
			collisionType = 'friend';
			collidesWith = 'enemy';	
		}
	}
}


