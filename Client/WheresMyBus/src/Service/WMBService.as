package Service
{
	import Model.VO.RequestVO;
	
	import flash.display.Sprite;
	
	[Bindable]
	public class WMBService extends Sprite implements IWMBService
	{
		public function WMBService()
		{
			super();
		}
		
		public function ServicesendCoordinates(value:RequestVO):void
		{
		}
		
		public function ServicegetMapData():void
		{
		}
		
		public function ServicecheckGPSAvailable():Boolean
		{
			return false;
		}
	}
}