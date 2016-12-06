//////////////////////////////////////////////////////////////////////////// CLASSE STATIQUE: Nav// Auteur: Yanick Bourdel// Automne 2015/////////////////////////////////////////////////////////////////////////package{	import flash.display.*;	import flash.events.*;	import flash.utils.*;	public class Nav{
		public static const INTRO:String="Intro";
		public static const INSTRUCTIONS:String="Instructions";
		public static const CREDITS:String="Credits";
		public static const PRINCIPAL:String="Principal";
		public static const FIN:String="Fin";				private static var _main:Main=null;		private static var _ecrans:Dictionary=new Dictionary();		public static function setMain(unMain:Main) {			_main=unMain;		}		public static function go(destination:String,ecranOrigine:MovieClip=null):void {						if (ecranOrigine!=null && _main!=null) _main.removeChild(ecranOrigine);
			            if(_main==null) _main=Main(ecranOrigine);
						if (_ecrans[destination]==null) {				var classe:Class=Class(getDefinitionByName(destination));				_ecrans[destination]=new classe();				//_ecrans[destination].init();			}			_main.addChild(_ecrans[destination]);		}			}//classe}//package