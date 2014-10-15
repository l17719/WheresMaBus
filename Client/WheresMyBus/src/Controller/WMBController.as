package Controller
{
	import Model.VO.RequestVO;
	import Model.WMBModel;

	[Bindable]
	public class WMBController implements IWMBController
	{
		
		private static var _instance:WMBController;
		
		private var _instanciaModel:WMBModel= WMBModel.GetInstance();
		
		
		//metodo para implementar o modelo singleton
		public static function GetInstance():WMBController{
			if(_instance==null){
				_instance= new WMBController();
			}
			return _instance;
		}
		
		
		public function WMBController()
		{
			_instance= this;
				
		}
		
		public function ControllerCheckOnlineService():void
		{
			// TODO Auto Generated method stub
			
		}
		
		public function ControllerGetMyCoordinates():void
		{
			// TODO Auto Generated method stub
			
		}
		
		public function ControllercheckGPSAvailable():Boolean
		{
			return _instanciaModel.ModelcheckGPSAvailable();
		}
		
		public function ControllergetMapData():void
		{
			// TODO Auto Generated method stub
			
		}
		
		public function ControllersendCoordinates(value:RequestVO):void
		{
			// TODO Auto Generated method stub
			
		}
		
		
		
		public function ControllerSetGpsAvailableActive(value:Boolean):void
		{
			_instanciaModel.ModelSetGpsAvailableActive(value);
			
		}
		
		public function ControllerGetGpsAvailableActive():Boolean
		{
			// TODO Auto Generated method stub
			return _instanciaModel.ModelGetGpsAvailableActive();
		}
		
		public function ControllerObtemChave():String
		{
			// TODO Auto Generated method stub
			return _instanciaModel.ModelObtemChave();
		}
		
		public function ControllerSetMyCoordinates(tmpdata:RequestVO):void
		{
			_instanciaModel.ModelSetMyCoordinates(tmpdata);
			
		}
	}
}