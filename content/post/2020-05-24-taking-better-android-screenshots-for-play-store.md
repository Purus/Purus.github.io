---
title: Taking Better Android Screenshots for Play Store
date: 2020-05-24T09:41:29.954Z
description: Perfect screenshots via ADB
layout: post
---
If you are an Android mobile app developer, you have to take lot of screenshots for uploading to Google Play Store Console. When you take screenshots, it would be more professional if you consider few aspects.

\- Reset the battery percentage.\
- Set WiFi and network signal to full\
- Remove notification icons\
- Set clock time.

All these settings can be done by using the demo mode.  You can copy the below code in to a batch file and run it whenever you need to take screenshot from your device/emulator.

```
@ECHO OFF

echo Android Demo Mode Tool											
echo.
echo Enabling Demo Mode
adb shell settings put global sysui_demo_allowed 1
adb shell am broadcast -a com.android.systemui.demo -e command enter
echo.
echo Setting clock to 8:00
adb shell am broadcast -a com.android.systemui.demo -e command clock -e hhmm 0800
echo.
echo Setting max wifi level
adb shell am broadcast -a com.android.systemui.demo -e command network -e wifi show -e level 4
echo.
echo Setting max battery level
adb shell am broadcast -a com.android.systemui.demo -e command battery -e level 100 -e plugged false
echo.
echo Hiding all notifications
adb shell am broadcast -a com.android.systemui.demo -e command notifications -e visible false
echo.
echo Taking screenshot
adb shell screencap -p /sdcard/screenshot.png
echo.
echo Moving screenshot to PC
adb pull /sdcard/screenshot.png
adb shell rm /sdcard/screenshot.png
echo.
echo Done! Exiting demo mode
adb shell am broadcast -a com.android.systemui.demo -e command exit
```



Remember to rename each screenshot image file, before taking next.