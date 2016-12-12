package  {
	import flash.display.*;
	import flash.events.*;
	
	public class Tuile extends MovieClip{
		//private var _node:Node;
		//private var _nodePos:uint;
		private var _estChemin:Boolean;
		//private var tNodes:Array=[];
		public function Tuile(estChemin:Boolean=false,nodePosition:uint=0) {
			// constructor code
			//_nodePos = nodePosition;
			_estChemin = estChemin;
			addEventListener(Event.ADDED_TO_STAGE,init);
			//trace(_nodePos);
		}
		private function init(e:Event):void{
			/*if (_nodePos>0){
				_node = new Node();
				addChild(_node);
				_node.x=this.x+25;
				_node.y=this.y+25;
				removeEventListener(Event.ADDED_TO_STAGE,init);
				//Principal(parent).addNode(_node,_nodePos);
				
			}*/
			if (_estChemin){
				this.gotoAndStop(2);
			}else {
				this.gotoAndStop(1);
			}
			
		}

	}
	
}
