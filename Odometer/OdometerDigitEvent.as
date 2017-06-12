package view.odometer {
	import flash.events.Event;

	public class OdometerDigitEvent extends Event {
		public static const ROLL_STARTING:String = "rollStarting";
		public static const ROLLING:String = "rolling";
		public static const	ROLL_ENDING:String = "rollEnding";
		public static const ROLL_ENDED:String = "rollEnded";
		public static const LAST_STARTING:String = "lastStarting";
		public static const LAST_ROLLING:String = "lastRolling";
		public static const LAST_ENDING:String = "lastEnding";
		public static const	LAST_ENDED:String = "lastEnded";
		
		public var numeral:uint = new uint;
		public var changeDuration:Number = new Number();
		public var timerTicks:uint = new uint();
		
		public function OdometerDigitEvent(type:String, changeDuration:Number = 1.0, timerTicks:uint = 20, numeral:uint = 0) {
			super(type);
			this.changeDuration = changeDuration;
			this.timerTicks = timerTicks;
			this.numeral = numeral;
		}
		override public function clone():Event {
			return new OdometerDigitEvent(type, changeDuration, timerTicks, numeral);
		}
		
	}
}