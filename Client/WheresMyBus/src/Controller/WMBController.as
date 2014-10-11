package Controller
{
	[Bindable]
	public class WMBController implements IWMBController
	{
		
		private static var _instance:WMBController;
		
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
	}
}