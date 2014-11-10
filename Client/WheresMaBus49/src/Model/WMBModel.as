package Model
{
	import Model.VO.RequestVO;
	
	import Service.WMBService;
	
	[Bindable]
	public class WMBModel implements IWMBModel
	{
		
		
		//variavel para conter os dados da appkey
		private var appKey:String="Fmjtd%7Cluurnuubng%2C8w%3Do5-9wrxga";
		
		// variavel de instancia para conter a instacia do service
		private var instanciaService:WMBService= WMBService.GetInstance();
		
		private var _GPSAvailable:Boolean;
		
		private var _SelectedLocationVO:RequestVO;
		
		//metodo para implementar o modelo singleton
		private static var _instance:WMBModel;
		
		
		public function ModelCheckOnlineService():void
		{
			// TODO Auto Generated method stub
			instanciaService.ServiceCheckOnlineService();
		}
		
		public function ModelGetMyCoordinates():void
		{
			// TODO Auto Generated method stub
			instanciaService.ServiceGetMyCoordinates();
		}
		
		public function ModelgetMapData():void
		{
			// TODO Auto Generated method stub
			
		}
		
		public function ModelsendCoordinates(value:RequestVO):void
		{
			// TODO Auto Generated method stub
			instanciaService.ServicesendCoordinates(value);
		}
		
		//
		
		

		public function get GPSAvailable():Boolean
		{
			return _GPSAvailable;
		}

		public function set GPSAvailable(value:Boolean):void
		{
			_GPSAvailable = value;
		}

		public static function GetInstance():WMBModel{
			if(_instance==null){
				_instance= new WMBModel();
			}
			return _instance;
		}
		public function WMBModel()
		{
			_instance=this;
		}
		
		
		public function ModelcheckGPSAvailable():Boolean
		{
			// TODO Auto Generated method stub
			return instanciaService.ServicecheckGPSAvailable();
		}
		
		//
		
		
		
		public function ModelSetGpsAvailableActive(value:Boolean):void
		{
			GPSAvailable=value;
			
		}
		
		public function ModelGetGpsAvailableActive():Boolean
		{
			// TODO Auto Generated method stub
			return GPSAvailable;
		}
		
		public function ModelObtemChave():String
		{
			// TODO Auto Generated method stub
			return appKey;
		}
		
		public function ModelSetMyCoordinates(tmpdata:RequestVO):void
		{
			_SelectedLocationVO= tmpdata;
			
		}
	}
}