﻿package {
		private var _className:String=Nav.FIN;
		
			
			addEventListener(Event.ADDED_TO_STAGE, addedToStage);
			addEventListener(Event.REMOVED_FROM_STAGE, removedFromStage);
			
			btPrincipal.addEventListener(MouseEvent.CLICK,goPrincipal);
			btIntro.addEventListener(MouseEvent.CLICK,goIntro);
			trace(">> "+_className+" addedToStage");
		}
		