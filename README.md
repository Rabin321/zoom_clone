# Title

Zoom Clone using flutter and firebase

## Features

1. Login Screen
2. Google Sign In
3. Firebase Features
4. Create New Meeting
5. Join Meeting
6. Invite Others
7. Raise Hand
8. Screen Recorder
9. Live Stream
10. Mute/Unmute Audio/Video
11. Add Meeting Password
12. Chat
13. Picture in Picture
14. See Meeting History
15. Switch Front/Rear Camera
16. Change Display Name while Joining
17. Enter Tile View
18. Share Youtube Video
19. End Call
20. Log Out



## Packages

```flutter 
dependencies:
  cloud_firestore: ^3.1.13
  firebase_core: ^1.15.0
  firebase_auth: ^3.3.15
  google_sign_in: ^5.3.0
  jitsi_meet: ^4.0.0
  intl: ^0.17.0
```

## Used
Jitsi Meet, Firebase Auth, FIrestore.


### android>app>proguard-rules.pro


```
#=== Flutter Wrapper ===#
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.**  { *; }
-keep class io.flutter.**  { *; }
-keep class io.flutter.plugins.**  { *; }

#=== Jitsi ===#
# Source: https://github.com/jitsi/jitsi-meet/blob/master/android/app/proguard-rules.pro
# Check above link for changes if release builds are broken again

# Copyright (c) Facebook, Inc. and its affiliates.
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.

# Add project specific ProGuard rules here.
# By default, the flags in this file are appended to flags specified
# in /usr/local/Cellar/android-sdk/24.3.3/tools/proguard/proguard-android.txt
# You can edit the include path and order by changing the proguardFiles
# directive in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# Add any project specific keep options here:

# React Native

# Keep our interfaces so they can be used by other ProGuard rules.
# See http://sourceforge.net/p/proguard/bugs/466/
-keep,allowobfuscation @interface com.facebook.proguard.annotations.DoNotStrip
-keep,allowobfuscation @interface com.facebook.proguard.annotations.KeepGettersAndSetters
-keep,allowobfuscation @interface com.facebook.common.internal.DoNotStrip

# Do not strip any method/class that is annotated with @DoNotStrip
-keep @com.facebook.proguard.annotations.DoNotStrip class *
-keep @com.facebook.common.internal.DoNotStrip class *
-keepclassmembers class * {
    @com.facebook.proguard.annotations.DoNotStrip *;
    @com.facebook.common.internal.DoNotStrip *;
}

-keepclassmembers @com.facebook.proguard.annotations.KeepGettersAndSetters class * {
  void set*(***);
  *** get*();
}

-keep class * extends com.facebook.react.bridge.JavaScriptModule { *; }
-keep class * extends com.facebook.react.bridge.NativeModule { *; }
-keepclassmembers,includedescriptorclasses class * { native <methods>; }
-keepclassmembers class *  { @com.facebook.react.uimanager.UIProp <fields>; }
-keepclassmembers class *  { @com.facebook.react.uimanager.annotations.ReactProp <methods>; }
-keepclassmembers class *  { @com.facebook.react.uimanager.annotations.ReactPropGroup <methods>; }

-dontwarn com.facebook.react.**
-keep,includedescriptorclasses class com.facebook.react.bridge.** { *; }

# okhttp

-keepattributes Signature
-keepattributes *Annotation*
-keep class okhttp3.** { *; }
-keep interface okhttp3.** { *; }
-dontwarn okhttp3.**

# okio

-keep class sun.misc.Unsafe { *; }
-dontwarn java.nio.file.*
-dontwarn org.codehaus.mojo.animal_sniffer.IgnoreJRERequirement
-keep class okio.** { *; }
-dontwarn okio.**

# WebRTC

-keep class org.webrtc.** { *; }
-dontwarn org.chromium.build.BuildHooksAndroid

# Jisti Meet SDK

-keep class org.jitsi.meet.** { *; }
-keep class org.jitsi.meet.sdk.** { *; }

# We added the following when we switched minifyEnabled on. Probably because we
# ran the app and hit problems...

-keep class com.facebook.react.bridge.CatalystInstanceImpl { *; }
-keep class com.facebook.react.bridge.ExecutorToken { *; }
-keep class com.facebook.react.bridge.JavaScriptExecutor { *; }
-keep class com.facebook.react.bridge.ModuleRegistryHolder { *; }
-keep class com.facebook.react.bridge.ReadableType { *; }
-keep class com.facebook.react.bridge.queue.NativeRunnable { *; }
-keep class com.facebook.react.devsupport.** { *; }

-dontwarn com.facebook.react.devsupport.**
-dontwarn com.google.appengine.**
-dontwarn com.squareup.okhttp.**
-dontwarn javax.servlet.**

# ^^^ We added the above when we switched minifyEnabled on.

# Rule to avoid build errors related to SVGs.
-keep public class com.horcrux.svg.** {*;}

# Hermes
-keep class com.facebook.hermes.unicode.** { *; }
```



##  Screenshots

<img src ="https://user-images.githubusercontent.com/53074799/166102201-be16db2b-4738-4d00-a695-b6b30c2b08b8.PNG" width="300" height="600">
<img src ="https://user-images.githubusercontent.com/53074799/166102203-b889b203-0e36-4c51-b628-24e92500972a.PNG" width="300" height="600">
<img src ="https://user-images.githubusercontent.com/53074799/166102204-ad164b05-0495-447c-ac1d-e1015d59152b.PNG" width="300" height="600">
<img src ="https://user-images.githubusercontent.com/53074799/166102190-f08402e5-7fe6-4027-a4ee-4362b9a3b4b3.PNG" width="300" height="600">
<img src ="https://user-images.githubusercontent.com/53074799/166102193-f447c0d9-5028-4ce7-9090-eabb06f6ca76.PNG"  width="300" height="600">
<img src ="https://user-images.githubusercontent.com/53074799/166102195-24ddb660-9229-448e-8a33-0394959e1366.PNG"  width="300" height="600">
<img src ="https://user-images.githubusercontent.com/53074799/166102196-5cb611f1-a84f-4ff9-b708-95d94d639abb.PNG"  width="300" height="600">
<img src ="https://user-images.githubusercontent.com/53074799/166102197-ca379480-57cd-47f4-b37e-bcdc79d75924.PNG"  width="300" height="600">
<img src ="https://user-images.githubusercontent.com/53074799/166102199-3d4b20af-35d3-4050-8ae5-161496527b78.PNG"  width="300" height="600">
<img src ="https://user-images.githubusercontent.com/53074799/166102200-4844e6f8-82e6-4b03-8f2c-e9e5416803f7.PNG"  width="300" height="600">

