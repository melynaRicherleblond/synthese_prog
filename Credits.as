package{
	import flash.display.*;
	import flash.events.*;

	public class Credits extends MovieClip{
		private var _className: String = Nav.CREDITS;

		// CONSTRUCTEUR ------------------
		public function Credits() {
			trace(">>>>>> " + _className + " créé");

			addEventListener(Event.ADDED_TO_STAGE, addedToStage);
			addEventListener(Event.REMOVED_FROM_STAGE, removedFromStage);

			btIntro.addEventListener(MouseEvent.CLICK, goIntro);
		}

		private function addedToStage(e: Event): void {
			trace(">> " + _className + " addedToStage");
		}

		private function removedFromStage(e: Event): void {
			trace(">> " + _className + " removedFromStage");
			// retirer ici tous les écouteurs problématiques
			// (en particulier ENTER_FRAME)
		}

		private function goIntro(e: MouseEvent): void {
			Nav.go(Nav.INTRO, this);
		}

	}

}