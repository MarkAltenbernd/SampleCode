<?xml version="1.0" encoding="utf-8"?>
<mx:Application xmlns:mx="http://www.adobe.com/2006/mxml" layout="absolute" 
	xmlns:odom="copart.WallOfMonitors.view.odometer.*" 
	xmlns:copart="copart.WallOfMonitors.view.*"  
	xmlns:ilog="http://www.ilog.com/2007/ilog/flex" 
	width="285" height="100"
	creationComplete="initApp()">
	<mx:Script>
		<![CDATA[
			
			import copart.WallOfMonitors.view.odometer.Odometer;
			import copart.WallOfMonitors.view.odometer.OdometerDigits;
			import copart.WallOfMonitors.view.odometer.OdometerDigitEvent;
			import copart.WallOfMonitors.view.odometer.OdometerDigitChangeDuration;
			
			import flash.utils.Timer;
			import flash.events.TimerEvent;
			
			private var digits:OdometerDigits;
			private var odometer:Odometer;
			
			private function initApp():void {
			/*	First method for instantiating an Odometer
			//	Populate an OdometerDigits array and pass it to the Odometer constructor
				digits = new OdometerDigits();
				digits.addDigit(odoDigit_00);
				digits.addDigit(odoDigit_01);
				digits.addDigit(odoDigit_02);
				digits.addDigit(odoDigit_03);
				digits.addDigit(odoDigit_04);
				digits.addDigit(odoDigit_05);
				digits.addDigit(odoDigit_06);
				digits.addDigit(odoDigit_07);
				digits.addDigit(odoDigit_08);
				digits.addDigit(odoDigit_09);
				odometer = new Odometer(digits); //*/
			//*	Second method for instantiating an Odometer
			//	Create an Odometer and add the digits, obviating an OdometerDigits array
				odometer = new Odometer();
				odometer.addDigit(odoDigit_00);
				odometer.addDigit(odoDigit_01);
				odometer.addDigit(odoDigit_02);
				odometer.addDigit(odoDigit_03);
				odometer.addDigit(odoDigit_04);
				odometer.addDigit(odoDigit_05);
				odometer.addDigit(odoDigit_06);
				odometer.addDigit(odoDigit_07);
				odometer.addDigit(odoDigit_08);
				odometer.addDigit(odoDigit_09);
				odometer.hideHighOrderZeroes = false;
				odometer.quickChange = false;
			}
			private function changeValue():void {
				odometer.value = Number(tiValue.text);
			}
		]]>
	</mx:Script>
	<odom:OdometerDigit id="odoDigit_00" horizontalCenter="110" y="15"/>
	<odom:OdometerDigit id="odoDigit_01" horizontalCenter="90" y="15"/>
	<odom:OdometerDigit id="odoDigit_02" horizontalCenter="59" y="15"/>
	<odom:OdometerDigit id="odoDigit_03" horizontalCenter="38" y="15"/>
	<odom:OdometerDigit id="odoDigit_04" horizontalCenter="16" y="15"/>
	<odom:OdometerDigit id="odoDigit_05" horizontalCenter="-15" y="15"/>
	<odom:OdometerDigit id="odoDigit_06" horizontalCenter="-36" y="15"/>
	<odom:OdometerDigit id="odoDigit_07" horizontalCenter="-57" y="15"/>
	<odom:OdometerDigit id="odoDigit_08" horizontalCenter="-88" y="15"/>
	<odom:OdometerDigit id="odoDigit_09" horizontalCenter="-109" y="15"/>
	<mx:Button y="60.4" label="Change" id="btnChange" click="changeValue()" horizontalCenter="86" />
	<mx:Label x="140" y="29.4" text="," fontSize="20" width="14" fontWeight="bold" color="#333333"/>
	<mx:Label x="66" y="29.4" text="," fontSize="20" width="14" fontWeight="bold" color="#333333"/>
	<mx:Label x="210.7" y="19.35" text="." height="51.6" fontSize="32" width="18" fontWeight="normal" color="#333333"/>
	<mx:TextInput x="28" y="60" id="tiValue" width="147.7" fontSize="12"/>
	
</mx:Application>
