package view.odometer {
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;

	//	An array of OdometerDigit objects to enforce type checking
	public class OdometerDigits extends EventDispatcher {
		
		import mx.controls.Alert;
		
		//	'internal' makes it visible within package only
		internal var _digits:Array = new Array();
		
		private var _length:uint = new uint();
		
		//	Public constructor
		public function OdometerDigits(target:IEventDispatcher=null) {
			super(target);
		}
		public function get digits():OdometerDigits {
			return _digits as OdometerDigits;
		}
		public function get length():uint {
			return _length;
		}
		public function addDigit(value:OdometerDigit):uint {
				_length = _digits.push(value);
				 return _length;
		}
		public function getDigit(i:uint):OdometerDigit {
			if (i >= length) {
				Alert.show("Index " + i + " exceeds number of availabe digits.", "OdometerDigit.getDigit(i)");
				return null;
			}
			else {
				return _digits[i];
			}
		}
	}
}