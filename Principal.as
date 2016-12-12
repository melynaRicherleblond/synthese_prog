package {
	import flash.display.*;
	import flash.events.*;
	import flash.sampler.NewObjectSample;
	import flash.net.*
	public class Principal extends MovieClip {
		private var _className: String = Nav.PRINCIPAL;
		private var tNodes: Array = [];
		//private var tNodes2:Array=[];
		private var _node: Node;
		private static var _nodeSequence: Array = [];
		private var _ennemiFaible: Tank_faible;
		private var _ennemiFort: Tank_fort;

		private var level: Array = new Array();

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

			addEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.REMOVED_FROM_STAGE, removedFromStage);
			trace(">> " + _className + " init");

			btFin.addEventListener(MouseEvent.CLICK, goFin);
			btIntro.addEventListener(MouseEvent.CLICK, goIntro);

		}
		private function init(e: Event): void {
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
		}

		private function construireNiveau(): void {
			var _tuile: Tuile;
			for (var i: uint = 0; i < level.length; i++) {
				for (var j: uint = 0; j < level[i].length; j++) {
					if (level[i][j] > 0) {
						_tuile = new Tuile(true);

						if (level[i][j] > 1) {
							switch (level[i][j]) {
								case 2:
									_node1 = new Node();
									_node1.x = j * 60+30;
									_node1.y = i * 60+30;
									addChild(_node1);
									break;
								case 3:
									_node2 = new Node();
									_node2.x = j * 60+30;
									_node2.y = i * 60+30;
									addChild(_node2);
									break;
								case 4:
									_node3 = new Node();
									_node3.x = j * 60+30;
									_node3.y = i * 60+30;
									addChild(_node3);
									break;
								case 5:
									_node4 = new Node();
									_node4.x = j * 60+30;
									_node4.y = i * 60+30;
									addChild(_node4);
									break;
								case 6:
									_node5 = new Node();
									_node5.x = j * 60+30;
									_node5.y = i * 60+30;
									addChild(_node5);
									break;
								case 7:
									_node6 = new Node();
									_node6.x = j * 60+30;
									_node6.y = i * 60+30;
									addChild(_node6);
									break;
								case 8:
									_node7 = new Node();
									_node7.x = j * 60+30;
									_node7.y = i * 60+30;
									addChild(_node7);
									break;
								case 9:
									_node8 = new Node();
									_node8.x = j * 60+30;
									_node8.y = i * 60+30;
									addChild(_node8);
									break;
								case 10:
									_node9 = new Node();
									_node9.x = j * 60+30;
									_node9.y = i * 60+30;
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
				}

			}
			tNodes= [_node1,_node2,_node3,_node4,_node5,_node6,_node7,_node8,_node9];
			//trace(_node1.x,_node1.y);
		addEventListener(Event.ENTER_FRAME, loop);
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
		}
		public function addNode(leNode, nbNode) {
			trace(leNode, nbNode, leNode.x, leNode.y);
			//tNodes.push(leNode+nbNode);
			//tNodes.sort();
			//trace(tNodes);
			//_nodeSequence.push({leNode:Node,nbNode});
			trace(_nodeSequence);
		}

		private function traiterXML(e: Event): void {
			objXML = new XML(e.target.data);

			menuAchat_mc.fortune_txt.text = objXML.joueur.fortune;
			menuAchat_mc.vies_txt.text = objXML.joueur.vies;

		}

		public function perteVie() {
			var nbVies = parseInt(menuAchat_mc.vies_txt.text);
			nbVies--;
			menuAchat_mc.vies_txt.text = nbVies;

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

		public function getTableauNodes() {
			return tNodes;
		}
	} //classe
} //package