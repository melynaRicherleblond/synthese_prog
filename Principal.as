package{	import flash.display.*;	import flash.events.*;	import flash.sampler.NewObjectSample;
	import flash.net.*
	public class Principal extends MovieClip {
		private var _className:String=Nav.PRINCIPAL;
		//private var tNodes:Array;
		private var tNodes:Array=[];
		private var _ennemiFaible:Tank_faible;
		private var _ennemiFort:Tank_fort;
		
		private var level:Array = new Array();
		
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
			
			//tNodes= [node_mc_1,node_mc_2,node_mc_3,node_mc_4,node_mc_5,node_mc_6,node_mc_7,node_mc_8,node_mc_9];		}
		private function init(e:Event):void {
			trace(">> "+_className+" addedToStage");
			
			addEventListener(Event.ENTER_FRAME,loop);
			
			level = [
			[0,0,1,0,0,0,0,0,0,0,0],
			[0,0,1,0,0,0,0,0,0,0,0],
			[0,0,2,1,1,1,1,1,3,0,0],
			[0,0,0,0,0,0,0,0,1,0,0],
			[0,0,0,0,0,0,0,0,1,0,0],
			[0,0,7,1,1,6,0,0,1,0,0],
			[0,0,1,0,0,1,0,0,1,0,0],
			[0,0,1,0,0,1,0,0,1,0,0],
			[9,1,8,0,0,5,1,1,4,0,0],
			[0,0,0,0,0,0,0,0,0,0,0],
			];
			
			construireNiveau();
		}		
		
		private function construireNiveau():void{
			var _tuile:Tuile;
			for (var i:uint=0;i<level.length;i++){
				for (var j:uint=0;j<level[i].length;j++){
					if(level[i][j]==1){
						_tuile = new Tuile(true);
					}else if(level[i][j]>1){
						_tuile = new Tuile(true,level[i][j]);
					}else{
						_tuile = new Tuile();
					}
					_tuile.x = j*60;
					_tuile.y = i*60;
					addChild(_tuile)
				}
				
			}
		}
		private function loop(e:Event):void{
			var rand=Math.floor(Math.random()*100);
			if(rand<2){
				var _randEnnemi=Math.floor(Math.random()*3)+1;
				if(_randEnnemi<3){
					_ennemiFaible= new Tank_faible();
					addChild(_ennemiFaible);
				}else{
					_ennemiFort= new Tank_fort();
					addChild(_ennemiFort);
				}
				
			}
		}
		public function addNode(leNode,nbNode){
			trace(leNode,nbNode,leNode.x,leNode.y);
			tNodes.push(leNode+nbNode);
			tNodes.sort();
			trace(tNodes);
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