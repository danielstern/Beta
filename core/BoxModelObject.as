package beta.core {
	import beta.containers.BoxWorldContainer;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2World;
	
	public class BoxModelObject extends ConstrainableObject
	{	
		private var hasBoxModel = true;
		protected var boxModelBody:b2Body;
		protected var boxContainer:BoxWorldContainer;

		public function BoxModelObject() {
			
			super();	
			
	
		}
		
		override protected function kill() {
			super.kill();
		}
		
		override protected function onAddedToStage(e) {
			super.onAddedToStage(e);
			var _container:* = parent;
			boxContainer = _container;
		}
		
		override protected function tick() {
			super.tick();
		}
		
		public function setBoxModelBody(body:b2Body) {
			boxModelBody = body;			
		}
	}
}


