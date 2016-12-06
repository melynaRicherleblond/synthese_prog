package  {
	import flash.display.*;
	import flash.events.*;
	
	public class Ennemi extends MovieClip{
		
		
		public function Ennemi() {
			trace("ennemi!");
			addEventListener(Event.ADDED_TO_STAGE, init);
			
			
		}
		
		private function init(e:Event):void {
			trace("un ennemi est sur le stage");
		}
	}
	
}
