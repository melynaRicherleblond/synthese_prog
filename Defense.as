﻿package  {
	import flash.display.*;
	import flash.events.Event;
	import flash.sampler.NewObjectSample;
	import flash.net.*
	
	public class Defense extends MovieClip{
		protected var leXML:XML;
		protected var _cout:uint;
		
		public function Defense() {
			// constructor code
			addEventListener(Event.ADDED_TO_STAGE,init);
		}
		private function init(e:Event):void{
			leXML=Principal(parent).getXML();

		}
		public function getCout(){
			return _cout;
		}

	}
	
}
