package view.odometer {
	
	import flash.events.EventDispatcher;

	public class Odometer extends EventDispatcher {
		
		import view.odometer.*;
		import mx.controls.Alert;
		
		//	public constructor
		public function Odometer(digits:OdometerDigits=null) {
			super();
			if (digits != null) {
				this.digits = digits;
			}
		}
		
		public var digits:OdometerDigits = new OdometerDigits(); //	Array of OdometerDigits
		private var stringValue:String = new String();
		
		
		private var _quickChange:Boolean = true;
		private var _duration:uint = 300;
		private var _hideHighorderZeroes:Boolean = false;
		private var _value:Number = new Number();
		
		//	Setters and getters for foregoing
		//	18-May-09 - to reduce cycle sucking by this Odometer
		public function set quickChange(value:Boolean):void {
			_quickChange = value;
		}
		public function get quickChange():Boolean {
			return _quickChange;
		}
		
		public function set duration(value:uint):void {
			_duration = value;
		}
		public function get duration():uint {
			return _duration;
		}
		//	End of 18-may-09
		
		public function set hideHighorderZeroes(value:Boolean):void {
			_hideHighorderZeroes = value;
		}
		public function set hideHighOrderZeroes(value:Boolean):void {
			_hideHighorderZeroes = value;
		}
		public function get hideHighorderZeroes():Boolean {
			return _hideHighorderZeroes;
		}
		public function get hideHighOrderZeroes():Boolean {
			return _hideHighorderZeroes;
		}
		
		public function set value(newValue:Number):void {
			var tmpValue:Number = newValue;
			var maxValue:Number = Math.pow(10, digits.length) - 1;
			if (newValue > maxValue) tmpValue = newValue - maxValue;
			_value = tmpValue;
			stringValue = value.toFixed(0);	//	Strip fractional portion and decimal point
			var didge:OdometerDigit = new OdometerDigit();
			var numeral:uint = new uint();
			var increment:int = new int();
			var j:uint = stringValue.length;					//	j indexes stringValue from last to first
			for (var i:uint = 0; i < stringValue.length; i++) {	//	i indexes digits[] from first to last
				j--;
				numeral = uint(stringValue.substr(j, 1));		//	The new value of this digit
				if (quickChange) {
					didge = digits.getDigit(i);
					didge.numeral = numeral;
					didge.visible = true;	//	B/C a Digit may just now have become significant
				}
				else {
					increment = numeral - digits.getDigit(i).numeral;	//	Amount of change for 
					if (increment < 0) increment += 10;					//	the current digit
					digits.getDigit(i).alpha = digits.getDigit(i).maxAlpha;
					digits.getDigit(i).change(OdometerDigitChangeDuration.SPEEDY, increment);
				}
			}
			//	Ensure unused high-order digits are either returned to zero or hidden
			while (i < digits.length) {
				didge = digits.getDigit(i);
				didge.numeral = 0;
				if (hideHighorderZeroes) {
					didge.visible = false;
				}
				else {
					if (didge.numeral != 0) {	//	Roll only non-zero digits
						increment = 10 - digits.getDigit(i).numeral;
						digits.getDigit(i).change(OdometerDigitChangeDuration.SPEEDY, increment);
					}
				}
				++i;	
			}
		}	// function get value()
		public function get value():Number {
			return _value;
		}
		
		public function addDigit(digit:OdometerDigit):uint {
			var len:uint = digits.addDigit(digit);
			return len;
		}
	}
}