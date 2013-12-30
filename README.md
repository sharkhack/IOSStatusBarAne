IOSStatusBarAne
===============

Statusbar theme was getting changed when CameraRoll  or ios native window had opened.
Here is the ane file to fix this bug in adobe air 3.9 >

ENJOY! :)

ios status bar refresh  native extension with ane file.
ios7 status bar bug solution fixed.
ios7 cameraroll  as there after status bar not refresh bug solution fixed.
Adobe Air i0S7 StatusBar Overlays stage, Adobe Air 3.9 bug fixed.

ane file path: https://github.com/sharkhack/IOSStatusBarAne/blob/master/AS3LIB/IOSApplicationSettings/release/IOSApplicationSettings.ane

how to use and test code path: https://github.com/sharkhack/IOSStatusBarAne/blob/master/FLEX_TEST/textapplication.mxml

FOR IOS -> AIR MOBILE APPLICATION STATUS BAR OVERLAY PADDING - AS3

if(Capabilities.version.indexOf("IOS") == 0)
{
        var osInfo:Array = Capabilities.os.split(" ");
        var versionNumber:Number = parseFloat(osInfo[2]);
        isIos = true;
        if(versionNumber >= 7) 
        {
                isIos7 = true;
                // for ios7 status bar overlay padding bug…
                var t:Number = height>=960 ? 40 : 20;
                setStyle(“paddingTop”,t);
        }
}

//STATUS BAR THEME REFRESH

callLater(refreshStatusBar);


refresh statusbar;

/**
Settings.UIStatusBarStyleDefault
Settings.UIStatusBarStyleLightContent
Settings.UIStatusBarStyleBlackOpaque
Settings.UIStatusBarStyleBlackTranslucent
**/

com.azer.IOSApplicationSettings.Settings::RefreshStatusBar(Settings.UIStatusBarStyleLightContent);
