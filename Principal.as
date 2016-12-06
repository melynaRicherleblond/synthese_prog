package{	import flash.display.*;	import flash.events.*;	import flash.sampler.NewObjectSample;
	import flash.net.*
	public class Principal extends MovieClip {
		private var _className:String=Nav.PRINCIPAL;
		private var tNodes:Array;
		private var _ennemi:Ennemi;
		
		private var objXML :XML;
		private var loader: URLLoader;
				// CONSTRUCTEUR ------------------		public function Principal() {
			
			loader = new URLLoader();
			loader.load(new URLRequest("fichierXML.xml"));
			
			loader.addEventListener(Event.COMPLETE, traiterXML);
						trace(">>>>>> "+_className+" créé");  
			
			addEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.REMOVED_FROM_STAGE, removedFromStage);
			trace(">> "+_className+" init");
			
			btFin.addEventListener(MouseEvent.CLICK,goFin);
			btIntro.addEventListener(MouseEvent.CLICK,goIntro);
			
			tNodes= [node_mc_1,node_mc_2,node_mc_3,node_mc_4,node_mc_5,node_mc_6,node_mc_7,node_mc_8,node_mc_9];		}
		private function init(e:Event):void {
			trace(">> "+_className+" addedToStage");
			
			addEventListener(Event.ENTER_FRAME,loop);
			
			
		}		
		
		private function loop(e:Event):void{
			var rand=Math.floor(Math.random()*100);
			if(rand<2){
				_ennemi= new Ennemi();
				addChild(_ennemi);
			}
		}
		
		private function traiterXML(e:Event):void{
			objXML = new XML(e.target.data);

			menuAchat_mc.fortune_txt.text = objXML.joueur.fortune;
			menuAchat_mc.vies_txt.text = objXML.joueur.vies;
			
		}
		
		public function perteVie(){
			var nbVies= parseInt(menuAchat_mc.vies_txt.text);
			nbVies--;
			menuAchat_mc.vies_txt.text = nbVies;
			
		}
				private function removedFromStage(e:Event):void {			trace(">> "+_className+" removedFromStage");			// retirer ici tous les écouteurs problématiques			// (en particulier ENTER_FRAME)		}		private function goFin(e:MouseEvent):void {			Nav.go(Nav.FIN,this);		}		private function goIntro(e:MouseEvent):void {			Nav.go(Nav.INTRO,this);		}
		
		public function getTableauNodes(){
			return tNodes;
		}	}//classe}//package