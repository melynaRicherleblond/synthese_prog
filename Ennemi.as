package  {
	import flash.display.*;
	import flash.events.*;
	
	public class Ennemi extends MovieClip{
		private var pos:uint =0;
		private var node:Object;
		private var vx:Number=0;
		private var vy:Number=0;
		private var vitesse:Number=4;
		
		private var posX:Number;
		private var posY:Number;
		private var lesNodes:Array;
		
		public function Ennemi() {
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		private function init(e:Event):void {
			trace("un ennemi est sur le stage");
			lesNodes = Principal(parent).getTableauNodes();
			placer();
			addEventListener(Event.ENTER_FRAME,loop);
		}
		
		private function placer():void{
			posX=lesNodes[pos].x;
			posY=lesNodes[pos].y;
			
			this.x=posX;
			this.y=posY;
			
			if(pos+1<lesNodes.length){
				node=lesNodes[pos+1];
				
				var dX:Number=node.x-posX;
				var dY:Number=node.y-posY;
				var angle:Number=Math.atan2(dY,dX);
				
				this.rotation=angle*180/Math.PI;
				
				vx=Math.cos(angle)*vitesse;
				vy=Math.sin(angle)*vitesse;
			}

		}
		
		private function loop(e:Event):void{
			posX+=vx;
			posY+=vy;
			
			this.x=posX;
			this.y=posY;
			
			var dx:Number=posX -node.x;
			var dy:Number=posY -node.y;
			if(dx*dx+dy*dy<vitesse*vitesse){
				pos++;
				placer();
				
				if(pos+1 ==lesNodes.length) {
					//Principal(parent).perteVie();
					removeEventListener(Event.ENTER_FRAME,loop);
				}
			}
		}
	}
	
}
