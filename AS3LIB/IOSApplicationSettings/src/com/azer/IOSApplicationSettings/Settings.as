//  Created by Azer Bulbul on 12/29/13.
//  Copyright (c) 2013 Azer Bulbul. All rights reserved.
package com.azer.IOSApplicationSettings
{
	import flash.external.ExtensionContext;
	
	public class Settings
	{
		
		private static var _instance : Settings;
		private static var ext:ExtensionContext = null;
		
		public static const UIStatusBarStyleDefault:String = "UIStatusBarStyleDefault";
		public static const UIStatusBarStyleLightContent:String = "UIStatusBarStyleLightContent";
		public static const UIStatusBarStyleBlackOpaque:String = "UIStatusBarStyleBlackOpaque";
		public static const UIStatusBarStyleBlackTranslucent:String = "UIStatusBarStyleBlackTranslucent";
		
		public function Settings()
		{
			if (!_instance)
			{
				if(ext == null){
					ext = ExtensionContext.createExtensionContext("com.azer.IOSApplicationSettings",null);
					
				}
				_instance = this;
			}
		}
		
		public static function getInstance() : Settings
		{
			return _instance ? _instance : new Settings();
		}
		
		/**
		 * TODO:
		 * - ios statusbar refresh
		 * @param statusbarstyle is String ("UIStatusBarStyleDefault", "UIStatusBarStyleLightContent", "UIStatusBarStyleBlackOpaque", "UIStatusBarStyleBlackTranslucent")
		 * 
		 * @author Azer BULBUL
		 */
		public function RefreshStatusBar(statusbarstyle:String):void
		{
			ext.call('RefreshStatusBar',statusbarstyle);
		}
		
		/**
		 * TODO:
		 * -ios statusbar hidden apparance
		 * @param hidden String(YES/NO). NO : StatusBar be shown. and YES : StatusBar is not shown.
		 * 
		 * @author Azer BULBUL
		 */
		public function StatusbarHidden(hidden:String='NO'):void{
			ext.call('HiddenhStatusBar',hidden);
		}
		
	}
}