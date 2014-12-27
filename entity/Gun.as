package beta.entity 
{
	import beta.core.TimekeepingObject;
	import beta.physics.BoxHelpers;
	import Box2D.Collision.Shapes.b2CircleShape;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Dynamics.b2Fixture;
	import Box2D.Dynamics.b2FixtureDef;
	import Box2D.Dynamics.b2World;
	/**
	 * ...
	 * @author daniel
	 */
	public class Gun extends TimekeepingObject
	{
		private var _body:b2Body;
		private var _positionOffset:b2Vec2;
		private var _rotationOffset:Number;
		private var _world:b2World;
		private var _canFire = true;
		private var _coolDown = 150;
		

		
		public function Gun(body:b2Body, positionOffset:b2Vec2 = null, rotationOffset:Number = 0) 
		{
			super();
			
			_body = body;
			_positionOffset = positionOffset;
			_rotationOffset = rotationOffset;
			
			_world = _body.GetWorld();
			
		}
		
		public function fire() 
		{
			if (!_canFire) return;
			
			var tempFixtureDef:b2FixtureDef = new b2FixtureDef();
			var shape:b2CircleShape = new b2CircleShape(0.1);
			shape.SetLocalPosition(_positionOffset);
			tempFixtureDef.shape = shape;
			var tempFixture:b2Fixture = _body.CreateFixture(tempFixtureDef);
			var bulletPosition:b2Vec2 = BoxHelpers.getFixturePosition(tempFixture);
			_body.DestroyFixture(tempFixture);	
			
			var childBodyDef:b2BodyDef = new b2BodyDef();
			childBodyDef.position = bulletPosition;
			childBodyDef.bullet = true;
			childBodyDef.angle = _body.GetAngle();
			childBodyDef.type = b2Body.b2_dynamicBody;
			var childBody:b2Body = _world.CreateBody(childBodyDef);
			
			var childFixtureDef:b2FixtureDef = new b2FixtureDef();
			childFixtureDef.shape = new b2CircleShape(0.1);
			childFixtureDef.filter.maskBits = Ship.BULLET_BIT;
			childBody.CreateFixture(childFixtureDef)
			
			var angle = _body.GetAngle() + _rotationOffset;
			var force = childBody.GetMass();
			var vector = BoxHelpers.getPointAtAngleDistance(angle, force);
			childBody.ApplyForce(vector, childBody.GetPosition());
			
			_canFire = false;
			
		}
		
		override protected function tick() {
			if (cycle % _coolDown === 0) {
				_canFire = true;
			}
			super.tick();
		}
		
	}

}