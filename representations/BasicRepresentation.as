package beta.representations 
{
	import beta.core.ThornedObject;
	import flash.display.MovieClip;
	import flash.display.Shape;
	
	import flash.events.Event;
	
	public class BasicRepresentation extends MovieClip 
	{
		public var target:ThornedObject;
		public var scale;
		
		public function BasicRepresentation(_target:ThornedObject,_scale) 
		{
			target = _target;
			scale = _scale;
			super();
			
		
			var circle:Shape = new Shape();
			circle.graphics.clear();
			circle.graphics.lineStyle(2,0x000000);
			circle.graphics.beginFill(0x990000);
			circle.graphics.drawCircle(0,0,5);
			circle.graphics.endFill();
			addChild(circle);		
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame );
		}
		
		protected function onEnterFrame(e) {
				x = target.getBoxModelPosition().x * scale;			
				y = target.getBoxModelPosition().y * scale;			
				
				//scaleX = 1 / scale;
				//scaleY = 1 / scale;
				
				if (target.killed) {
					removeEventListener(Event.ENTER_FRAME, onEnterFrame);
					
				}
		}
		
		
		
	}

}