# AnswerMe SDK Sample

This sample demonstrates how to create an SDK out of Java code which can be
easily used from Objective-C/Swift. The SDK
implements wrapper classes in Java which are exposed as Objective-C classes
using the RoboVM Objective-C to Java bridge.

This sample consists of a number of modules and sub-projects:

* The `core/` module contains the platform independent code which we want to
  expose in the SDK.
* The `sdk/` module contains the Objective-C wrapper classes for the various
  classes in `core`. The classes are still implemented in Java but will be
  made available to the Objective-C runtime when loaded.
* The Xcode project in `sdk/AnswerMeObjC/` demonstrates how to use the SDK
  from Objective-C.
* The Xcode project in `sdk/AnswerMeSwift/` demonstrates how to use the SDK
  from Swift.


## Build instructions

Run the robovmInstall gradle task in AnswerMe/sdk

This creates the SDK framework in `sdk/target/robovm/AnswerMeSDK.framework`.

The Objective-C app in `sdk/AnswerMeObjC/` can then be launched.
The Swift app in `sdk/AnswerMeSwift/` can then be launched.

*NOTE*: The Xcode project depends on
[Carthage](https://github.com/Carthage/Carthage). Carthage must be installed
in `/usr/local/bin/carthage` in order for the native app to work.

Install carthage with brew, `brew install carthage`

## Details

The entry point to the SDK is defined in the Objective-C source file
`sdk/src/main/native/init.m`. The `[AMAnswerMeSDK instance]` method will
initialize RoboVM using standard JNI and then calls the
`org.robovm.answerme.sdk.AMAnswerMeSDKImpl.initialize()` Java method via JNI.
`initialize()` registers the Objective-C classes implemented in Java with the
Objective-C runtime dynamically. Once this has been done the Objective-C code
in the app can call methods and properties on these classes just like they had
been implemented in Objective-C.

In order to link against the dynamic Java framework the
`AnswerMeSDK.framework` library has been added to the `Link Binary With
Libraries` build phase on the `AnswerMeObjC` target.

Also, a `Run Script` phase has been added to the build phases of the
`AnswerMeObjC` target. This `Run Script` phase runs `/usr/local/bin/carthage
copy-frameworks` with `$(SRCROOT)/../target/robovm/AnswerMeSDK.framework`
as input file. This is necessary to have the framework copied properly and
unnessary architectures removed from the dynamic library file when launched on
the simulator or on device. This script also takes care of signing the
framework.