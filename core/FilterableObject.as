package beta.core {
	import flash.display.*;
	import flash.events.Event;
	import flash.filters.ColorMatrixFilter;
	
	public class FilterableObject extends DisplayableObject
	{
		private var willClearFilters = false;
		private var timeUntilFiltersCleared = 0;
		
		public function FilterableObject() {
			super();
		}
		
		public function turnRed() {			
			var matrix:Array = new Array();
			matrix=matrix.concat([1,1,1,0,0]);// red
			matrix=matrix.concat([0,0,0,0,0]);// green
			matrix=matrix.concat([0,0,0,0,0]);// blue
			matrix=matrix.concat([0,0,0,1,0]);// alpha
			var my_filter:ColorMatrixFilter=new ColorMatrixFilter(matrix);
			filters=[my_filter];
		}
		
		protected function clearFilters() {
			filters = [];
		}
		
		protected function clearFiltersAfter(count) {
			doAfter(count, clearFilters);
		}
		
		public function turnWhite() {			
			var matrix:Array = new Array();
			matrix=matrix.concat([1,1,1,0,0]);
			matrix=matrix.concat([1,1,1,0,0]);
			matrix=matrix.concat([1,1,1,0,0]);
			matrix=matrix.concat([1,1,1,0,0]);
			var my_filter:ColorMatrixFilter=new ColorMatrixFilter(matrix);
			filters=[my_filter];
		}		
	}
}


