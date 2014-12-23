package beta.units {
	
	public class EnemyShip extends Enemy
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
			stabilizersEnabled = true;
			
		}
	}
}


