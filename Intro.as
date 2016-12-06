package {	import flash.display.*;	import flash.events.*;	public class Intro extends MovieClip {
		private var _className:String=Nav.INTRO;
				// CONSTRUCTEUR ------------------		public function Intro() {			trace(">>>>>> "+_className+" créé");      
			
			addEventListener(Event.ADDED_TO_STAGE, addedToStage);
			addEventListener(Event.REMOVED_FROM_STAGE, removedFromStage);
			trace(">> "+_className+" init");
			
			btPrincipal.addEventListener(MouseEvent.CLICK,goPrincipal);
			btInstructions.addEventListener(MouseEvent.CLICK,goInstructions);
			btCredits.addEventListener(MouseEvent.CLICK,goCredits);		}
		private function addedToStage(e:Event):void {
			trace(">> "+_className+" addedToStage");
		}
				private function removedFromStage(e:Event):void {			trace(">> "+_className+" removedFromStage");			// retirer ici tous les écouteurs problématiques			// (en particulier ENTER_FRAME)		}				private function goPrincipal(e:MouseEvent):void {			Nav.go(Nav.PRINCIPAL,this);		}
		
		private function goInstructions(e:MouseEvent):void {
			Nav.go(Nav.INSTRUCTIONS,this);
		}
		
		private function goCredits(e:MouseEvent):void {
			Nav.go(Nav.CREDITS,this);
		}			}//classe}//package