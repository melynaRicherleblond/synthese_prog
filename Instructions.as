package  {
	import flash.display.*;
	import flash.events.*;
	
	public class Instructions extends MovieClip{
		private var _className:String=Nav.INSTRUCTIONS;
		
		public function Instructions() {
			trace(">>>>>> "+_className+" créé");
			
			addEventListener(Event.ADDED_TO_STAGE, addedToStage);
			addEventListener(Event.REMOVED_FROM_STAGE, removedFromStage);
			
			btPrincipal.addEventListener(MouseEvent.CLICK,goPrincipal);
			btIntro.addEventListener(MouseEvent.CLICK,goIntro);
		}
		
		private function addedToStage(e:Event):void {
			trace(">> "+_className+" addedToStage");
		}
		
		private function removedFromStage(e:Event):void {
			trace(">> "+_className+" removedFromStage");
			// retirer ici tous les écouteurs problématiques
			// (en particulier ENTER_FRAME)
		}
		
		private function goPrincipal(e:MouseEvent):void {
			Nav.go(Nav.PRINCIPAL,this);
		}
		
		private function goIntro(e:MouseEvent):void {
			Nav.go(Nav.INTRO,this);
		}

	}
	
}
