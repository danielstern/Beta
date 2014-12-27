package beta.entity 
{
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Dynamics.b2World;
	/**
	 * ...
	 * @author daniel
	 */
	public class Gun 
	{
		private var _body:b2Body;
		private var _positionOffset:b2Vec2;
		private var _rotationOffset:Number;
		private var _world:b2World;
		
		public function Gun(body:b2Body, positionOffset:b2Vec2 = null, rotationOffset:Number = 0) 
		{
			_body = body;
			_positionOffset = positionOffset;
			_rotationOffset = rotationOffset;
			
			_world = _body.GetWorld();
			
		}
		
		public function fire() 
		{
			var childBodyDef:b2BodyDef = new b2BodyDef();
			childBodyDef.position = _body.GetPosition();
			childBodyDef.bullet = true;
			var child = _world.CreateBody(childBodyDef);
			
		}
		
	}

}