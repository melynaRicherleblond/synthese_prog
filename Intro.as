﻿package {
		private var _className:String=Nav.INTRO;
		
			
			addEventListener(Event.ADDED_TO_STAGE, addedToStage);
			addEventListener(Event.REMOVED_FROM_STAGE, removedFromStage);
			trace(">> "+_className+" init");
			
			btPrincipal.addEventListener(MouseEvent.CLICK,goPrincipal);
			btInstructions.addEventListener(MouseEvent.CLICK,goInstructions);
			btCredits.addEventListener(MouseEvent.CLICK,goCredits);
		private function addedToStage(e:Event):void {
			trace(">> "+_className+" addedToStage");
		}
		
		
		private function goInstructions(e:MouseEvent):void {
			Nav.go(Nav.INSTRUCTIONS,this);
		}
		
		private function goCredits(e:MouseEvent):void {
			Nav.go(Nav.CREDITS,this);
		}