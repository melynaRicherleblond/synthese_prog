﻿package {
		private var _className:String=Nav.PRINCIPAL;
		
			
			addEventListener(Event.ADDED_TO_STAGE, addedToStage);
			addEventListener(Event.REMOVED_FROM_STAGE, removedFromStage);
			trace(">> "+_className+" init");
			
			btFin.addEventListener(MouseEvent.CLICK,goFin);
			btIntro.addEventListener(MouseEvent.CLICK,goIntro);
		private function addedToStage(e:Event):void {
			trace(">> "+_className+" addedToStage");
		}
		