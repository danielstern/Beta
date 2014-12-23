package beta
{
	import flash.display.*;
	import flash.events.Event;
	import beta.core.*;
	
	public class EnemyShip extends Gunship
	{
		public function EnemyShip() {
			super();
			mass = 3;
			health = 25;
			xThrusterPower = 0.1;
			yThrusterPower = 0.1;
			stablizerPowerX = 10;
			stablizerPowerY = 10;
			constrainToScreen = false;			
			collisionType = "enemy";
			collidesWith = "friend";
		}
	}
}


