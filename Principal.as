////////////////////////////////////////////////////////////////////////////
// CLASSE: Pincipal
// Auteur: Mélyna Richer Leblond
// Décembre 2016
//
// Classe gérant le jeu
// 
//
// NOTE: L'auteur de cette classe en autorise l'usage,
// la modification et l'adaptation sans restrictions.
////////////////////////////////////////////////////////////////////////////
package {
	import flash.display.*;
	import flash.events.*;
	import flash.ui.Keyboard;
	import flash.sampler.NewObjectSample;
	import flash.net.*

	public class Principal extends MovieClip {
		private var _className: String = Nav.PRINCIPAL;
		private var tNodes: Array = [];
		private var _node: Node;
		private static var _nodeSequence: Array = [];
		private var _ennemiFaible: Tank_faible;
		private var _ennemiFort: Tank_fort;

		private var _courTour: Defense; //Tour courante  (sélectionnée depuis le menu)
		private var _courTuile: Tuile; //Tuile courante	(sur laquelle se tient une tour sélectionnée)

		private var level: Array = new Array(); //Tableau contenant toutes les tuiles du jeu
		private var tTuilesChemin: Array = []; //Tableau contenant toutes les tuiles qui font partie du chemin
		private var tTours: Array = []; //Tableau contenant toutes les tours placées sur le jeu
		private var _courFortune: uint;
		private var _coutTour: uint;
		private var _coutTProjectile: uint;
		private var _coutTZone: uint;
		private var _nbVies:uint;

		private var objXML: XML;
		private var loader: URLLoader;
		private var _node1: Node;
		private var _node2: Node;
		private var _node3: Node;
		private var _node4: Node;
		private var _node5: Node;
		private var _node6: Node;
		private var _node7: Node;
		private var _node8: Node;
		private var _node9: Node;

		// CONSTRUCTEUR ------------------
		public function Principal() {

			loader = new URLLoader();
			loader.load(new URLRequest("fichierXML.xml"));
			loader.addEventListener(Event.COMPLETE, traiterXML);
			trace(">>>>>> " + _className + " créé");
			
			addEventListener(Event.REMOVED_FROM_STAGE, removedFromStage);
			trace(">> " + _className + " init");

			btFin.addEventListener(MouseEvent.CLICK, goFin);
			btIntro.addEventListener(MouseEvent.CLICK, goIntro);

		}
		
		private function traiterXML(e: Event): void {
			objXML = new XML(e.target.data);

			_courFortune=objXML.joueur.fortune;
			_coutTProjectile = objXML.tour.(@categorie == "projectile").cout;
			_coutTZone = objXML.tour.(@categorie == "zone").cout;
			_nbVies = objXML.joueur.vies;

			init();
		}
		
		private function init(): void {
			trace(">> " + _className + " addedToStage");

			level = [
				[0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0],
				[0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
				[0, 0, 3, 1, 1, 1, 1, 1, 4, 0, 0],
				[0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0],
				[0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0],
				[0, 0, 8, 1, 1, 7, 0, 0, 1, 0, 0],
				[0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0],
				[0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0],
				[10, 1, 9, 0, 0, 6, 1, 1, 5, 0, 0],
				[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
			];

			construireNiveau();
			
			
			menuAchat_mc.tourP_cout_txt.text = ""+_coutTProjectile;
			menuAchat_mc.tourZ_cout_txt.text = ""+_coutTZone;


			menuAchat_mc.btn_Tour_projectile.addEventListener(MouseEvent.MOUSE_DOWN, AjoutTourP);
			menuAchat_mc.btn_Tour_zone.addEventListener(MouseEvent.MOUSE_DOWN, AjoutTourZ);
			stage.addEventListener(MouseEvent.MOUSE_UP, onMouseDownHandler);
			stage.addEventListener(Event.ENTER_FRAME, onEnterFrameHandler);
		}

		private function construireNiveau(): void {
			var _tuile: Tuile;
			for (var i: uint = 0; i < level.length; i++) {
				for (var j: uint = 0; j < level[i].length; j++) {
					if (level[i][j] > 0) {
						_tuile = new Tuile(true);
						tTuilesChemin.push(_tuile);

						if (level[i][j] > 1) {
							var _nodePosX: Number = j * 60 + 30;
							var _nodePosY: Number = i * 60 + 30;

							switch (level[i][j]) {
								case 2:
									_node1 = new Node();
									_node1.x = _nodePosX;
									_node1.y = _nodePosY;
									addChild(_node1);
									break;
								case 3:
									_node2 = new Node();
									_node2.x = _nodePosX;
									_node2.y = _nodePosY;
									addChild(_node2);
									break;
								case 4:
									_node3 = new Node();
									_node3.x = _nodePosX;
									_node3.y = _nodePosY;
									addChild(_node3);
									break;
								case 5:
									_node4 = new Node();
									_node4.x = _nodePosX;
									_node4.y = _nodePosY;
									addChild(_node4);
									break;
								case 6:
									_node5 = new Node();
									_node5.x = _nodePosX;
									_node5.y = _nodePosY;
									addChild(_node5);
									break;
								case 7:
									_node6 = new Node();
									_node6.x = _nodePosX;
									_node6.y = _nodePosY;
									addChild(_node6);
									break;
								case 8:
									_node7 = new Node();
									_node7.x = _nodePosX;
									_node7.y = _nodePosY;
									addChild(_node7);
									break;
								case 9:
									_node8 = new Node();
									_node8.x = _nodePosX;
									_node8.y = _nodePosY;
									addChild(_node8);
									break;
								case 10:
									_node9 = new Node();
									_node9.x = _nodePosX;
									_node9.y = _nodePosY;
									addChild(_node9);
									break;
							}
						}
					} else {
						_tuile = new Tuile();

					}
					_tuile.x = j * 60;
					_tuile.y = i * 60;
					addChild(_tuile)
					_tuile.addEventListener(MouseEvent.ROLL_OVER, TurnOnTile);
					_tuile.addEventListener(MouseEvent.ROLL_OUT, TurnOfTile);
				}

			}
			tNodes = [_node1, _node2, _node3, _node4, _node5, _node6, _node7, _node8, _node9];
			
			addEventListener(Event.ENTER_FRAME, loop);
		}

		//this function is called when mouse is rolled over the tile
		function TurnOnTile(event: MouseEvent) {
			_courTuile = event.currentTarget as Tuile;
			if (checkPlacable(_courTuile) && _courTour != null) {
				_courTuile.gotoAndStop(3);
			}
		}

		//this function is called when mouse is rolled out of the tile
		function TurnOfTile(event: MouseEvent) {
			var prevTile = event.currentTarget as Tuile;
			if (prevTile.currentFrame == 3) {
				prevTile.gotoAndStop(1);
			}
		}
		//this function checks if a tower can be placed on a tile
		function checkPlacable(_tuile: Tuile): Boolean {
			for (var i: int = 0; i < tTuilesChemin.length; ++i) {
				if (tTuilesChemin[i] == _tuile)
					return false;
			}
			return true;
		}
		function onEnterFrameHandler(event: Event) {

			if (_courTour != null) { // set position of the tower to that of mouse
				_courTour.x = mouseX + 1 + _courTour.width / 2;
				_courTour.y = mouseY + 1 + _courTour.height / 2;
			}
		}

		//this function will create a Tower movieClip if user clicked on Tower Button
		function AjoutTourP(event: MouseEvent) {
			if (_courTour == null) {
				_courTour = new Tour_projectile();
				addChild(_courTour);
				_courTour.alpha = 0.5;
			}
		}
		function AjoutTourZ(event: MouseEvent) {
			if (_courTour == null) {
				_courTour = new Tour_zone();
				addChild(_courTour);
				_courTour.alpha = 0.5;
			}
		}

		//this function will place the tower when user clicks on the stage
		function onMouseDownHandler(event: MouseEvent) {
			if (_courTour != null) {
				if (checkPlacable(_courTuile)) { //check if placable
					_coutTour = _courTour.getCout();

					if ((_courFortune - _coutTour) >= 0) { //check if there is enough gold to place the 
						if (mouseX < 660) { //tower
							tTours.push(_courTour);
							_courFortune -= _coutTour;
							_courTour.x = _courTuile.x + _courTuile.width / 2; //place the tower on the tile
							_courTour.y = _courTuile.y + _courTuile.height / 2;
							_courTour.alpha = 1;
							_courTour = null;
							tTuilesChemin.push(_courTuile); //add the current Tile into nonPlacableTiles

							//menuAchat_mc.fortune_txt.text = _courFortune;
						} //after placing the tower
					}else{
						trace("pas assez d'argent!");
					}
				}
				if (mouseX > 660 && mouseX < 800) {
					removeChild(_courTour);
					_courTour = null;
				}
			}


		}
		private function loop(e: Event): void {
			var rand = Math.floor(Math.random() * 100);
			if (rand < 2) {
				var _randEnnemi = Math.floor(Math.random() * 3) + 1;
				if (_randEnnemi < 3) {
					_ennemiFaible = new Tank_faible();
					addChild(_ennemiFaible);
				} else {
					_ennemiFort = new Tank_fort();
					addChild(_ennemiFort);
				}

			}
			menuAchat_mc.fortune_txt.text = ""+_courFortune;
			menuAchat_mc.vies_txt.text = ""+_nbVies;
		}

		public function perteVie() {
			_nbVies--;

		}
		private function removedFromStage(e: Event): void {
			trace(">> " + _className + " removedFromStage"); // retirer ici tous les écouteurs problématiques // (en particulier ENTER_FRAME)
		}
		private function goFin(e: MouseEvent): void {
			Nav.go(Nav.FIN, this);
		}
		private function goIntro(e: MouseEvent): void {
			Nav.go(Nav.INTRO, this);
		}

		public function getXML() {
			return objXML;
		}
		public function getTableauNodes() {
			return tNodes;
		}
	} //classe
} //package