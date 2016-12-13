package  {
	import flash.display.*;
	import flash.events.*;
	
	public class Tuile extends MovieClip{
		private var _estChemin:Boolean;
		
		public function Tuile(estChemin:Boolean=false) {
			_estChemin = estChemin;
			addEventListener(Event.ADDED_TO_STAGE,init);
		}
		private function init(e:Event):void{
			if (_estChemin){
				this.gotoAndStop(2);
			}else {
				this.gotoAndStop(1);
			}
			
		}

	}
	
}
