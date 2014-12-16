package Controller
{
	import Model.DummyModel;
	import Model.VO.DataResponseVo;
	import Model.VO.RequestVO;
	import Model.WMBModel;

	[Bindable]
	public class WMBController implements IWMBController
	{
		
		private static var _instance:WMBController;
		
		private var _instanciaModel:WMBModel= WMBModel.GetInstance();
		
		private var _instanciaDummyModel:DummyModel= DummyModel.GetInstance();
		
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
			_instanciaModel.ModelCheckOnlineService();
			
		}
		
		public function ControllerGetMyCoordinates():void
		{
			_instanciaModel.ModelGetMyCoordinates();
			
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
			_instanciaModel.ModelsendCoordinates(value);
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
		
		
		
		public function ControllerSetMyCoordinates(tmpdata:RequestVO):void
		{
			_instanciaModel.ModelSetMyCoordinates(tmpdata);
			
		}
		
		public function ControllerGetServiceOnline():Boolean
		{
			// TODO Auto Generated method stub
			return _instanciaModel.GetServiceOnline();
		}
		
		public function ControllerSetServiceOnline(value:Boolean):void
		{
			// TODO Auto Generated method stub
			_instanciaModel.SetServiceOnline(value);
			
		}
		
		
		
		
		
		//dumydatainit
		public function ControllerInitDummy():void{
			if (_instanciaDummyModel.DummyInitialized){
				return;
			}
			_instanciaDummyModel.GeraDadosDummyBus();
			_instanciaDummyModel.GeraDadosDummyUser();
			_instanciaDummyModel.DummyInitialized= true;
		}
		
		public function GetDummyUser(value:Boolean):RequestVO{
			return _instanciaDummyModel.ObtemLocalizacaoDummyUser(value);
		}
		
		public function GetDummyBus(value:Boolean):DataResponseVo{
			return _instanciaDummyModel.ObtemLocalizacaoDummyBus(value);
		}
		//
	}
}