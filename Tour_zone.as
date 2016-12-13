package  {
	import flash.display.*;
	import flash.events.Event;
	import flash.sampler.NewObjectSample;
	import flash.net.*
	
	public class Tour_zone extends Defense{

		public function Tour_zone() {
			// constructor code
			addEventListener(Event.ADDED_TO_STAGE,init);
		}
		private function init(e:Event):void{
			_cout=leXML.tour.(@categorie=="zone").cout;
			trace(_cout);
		}

	}
	
}
