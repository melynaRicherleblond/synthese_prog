package {	import flash.display.*;	import flash.events.*;	import flash.sampler.NewObjectSample;
	public class Principal extends MovieClip {
		private var _className:String=Nav.PRINCIPAL;
		private var tNodes:Array;
		private var pos:uint =0;
		private var node:Object;
		private var vx:Number=0;
		private var vy:Number=0;
		private var vitesse:Number=4;
		
		private var posX:Number;
		private var posY:Number;
		
		private var _ennemi:Ennemi;
				// CONSTRUCTEUR ------------------		public function Principal() {			trace(">>>>>> "+_className+" créé");  
			
			addEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.REMOVED_FROM_STAGE, removedFromStage);
			trace(">> "+_className+" init");
			
			btFin.addEventListener(MouseEvent.CLICK,goFin);
			btIntro.addEventListener(MouseEvent.CLICK,goIntro);
			
			tNodes= [node_mc_1,node_mc_2,node_mc_3,node_mc_4,node_mc_5,node_mc_6,node_mc_7,node_mc_8,node_mc_9];
			addEventListener(Event.ENTER_FRAME,loop);		}
		private function init(e:Event):void {
			trace(">> "+_className+" addedToStage");
			
			_ennemi= new Ennemi();
			addChild(_ennemi);
			
			placer();
			
		}
		private function placer():void{
			posX=tNodes[pos].x;
			posY=tNodes[pos].y;
			
			_ennemi.x=posX;
			_ennemi.y=posY;
			
			if(pos+1<tNodes.length){
				node=tNodes[pos+1];
				
				var dX:Number=node.x-posX;
				var dY:Number=node.y-posY;
				var angle:Number=Math.atan2(dY,dX);
				
				_ennemi.rotation=angle*180/Math.PI;
				
				vx=Math.cos(angle)*vitesse;
				vy=Math.sin(angle)*vitesse;
			}

		}
		
		private function loop(e:Event):void{
			posX+=vx;
			posY+=vy;
			
			_ennemi.x=posX;
			_ennemi.y=posY;
			
			var dx:Number=posX -node.x;
			var dy:Number=posY -node.y;
			if(dx*dx+dy*dy<vitesse*vitesse){
				pos++;
				placer();
				
				if(pos+1 ==tNodes.length) removeEventListener(Event.ENTER_FRAME,loop);
			}
		}
				private function removedFromStage(e:Event):void {			trace(">> "+_className+" removedFromStage");			// retirer ici tous les écouteurs problématiques			// (en particulier ENTER_FRAME)		}		private function goFin(e:MouseEvent):void {			Nav.go(Nav.FIN,this);		}		private function goIntro(e:MouseEvent):void {			Nav.go(Nav.INTRO,this);		}	}//classe}//package