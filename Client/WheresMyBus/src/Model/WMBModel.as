package Model
{
	
	[Bindable]
	public class WMBModel implements IWMBModel
	{
		
		private static var _instance:WMBModel;
		//metodo para implementar o modelo singleton
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
	}
}