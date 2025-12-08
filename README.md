<p align="center">
  <img  src="https://dasa7d6hxd0bp.cloudfront.net/images/mirrorfly.webp" data-canonical-src="https://dasa7d6hxd0bp.cloudfront.net/images/mirrorfly.webp" width="400"  alt=""/>
</p>

# *MirrorFly WebRTC SDK For Voice & Video Calls**

This repository includes a custom SDK for building voice and video calling features into your existing app or web. There are over 1000 real-time communication features along with 500+ AI-powered features to build AI chatbots and AI voice agents. 

You can customize any part of the solution and deploy it on your own server. MirrorFly WebRTC SDK gives you full control over the security, data and infrastructure. Altogether you’ll only need minimal efforts to deploy a full AI-powered voice/ video calling app in 24 hrs with MirrorFly WebRTC SDK.

# **🤹 Key Product Offerings** 

MirrorFly helps build omni-channel communication apps for any kind of business

**💬 [In-app Messaging](https://www.mirrorfly.com/chat-api-solution.php)** \- Connect users individually or as groups via instant messaging features.  
**🎯 [HD Video Calling](https://www.mirrorfly.com/video-call-solution.php)**\- Engage users over face-to-face conversations anytime, and from anywhere.   
**🦾 [HQ Voice Calling](https://www.mirrorfly.com/voice-call-solution.php)** \- Deliver crystal clear audio calling experiences with latency as low as 3ms.   
🤖 [**AI Voice Agent**](https://www.mirrorfly.com/conversational-ai/voice-agent/) \- Build custom  AI voicebots that can understand, act and respond to user questions.   
**🤖 [AI Chatbot](https://www.mirrorfly.com/conversational-ai/chatbot/)** \- Deploy white-label AI chatbots that drive autonomous conversations across any web or mobile app.  
**🦾 [Live Streaming](https://www.mirrorfly.com/live-streaming-sdk.php)** \- Broadcast video content to millions of viewers around the world, within your own enterprise app. 

[**Requirements**](https://www.mirrorfly.com/docs/audio-video/android/v2/quick-start/#requirements)

The requirements for the Audio & Video Chat SDK for Android are:

* **Android**: Lollipop 5.0 (API Level 21) or higher  
* **Java**: Version 7 or higher  
* **Gradle**: 8.6.0 or higher  
* **Kotlin:** 2.0.20 or higher  
* **targetSdkVersion / compileSdkVersion:** 35 or above

### [**Getting Started**](https://www.mirrorfly.com/docs/audio-video/android/v2/quick-start/#things-to-be-noted-before-you-get-started)

**Step 1:** Register [here](https://www.mirrorfly.com/contact-sales.php) to get a MirrorFly User account.  
**Step 2:** [Login](https://console.mirrorfly.com/) to your Account  
**Step 3:** Get the License key from the application Info’ section

![license-key][image2]

### [**Video Call SDK Integration**](https://www.mirrorfly.com/docs/audio-video/android/v2/quick-start/#integrate-the-video-calling-sdk-for-android-app-video-tutorial)

**Step 1:** Create a new project or open an existing project in Android Studio.  
**Step 2:**

* If using Gradle 6.8 or higher, add the following code to your `settings.gradle` file.  
* If using Gradle 6.7 or lower, add the code to your root `build.gradle` file.

![Jcenter][image3]

```gradle
dependencyResolutionManagement {
    repositories {
        jcenter()
        maven {
            url "https://repo.mirrorfly.com/release"
        }
    }
}
```

**Step 3:** Add the following dependencies in the `app/build.gradle` file.

```gradle
dependencies {
    implementation 'com.mirrorfly.sdk:mirrorflysdk:7.13.31'
}
```

**Step 4**: Add the below line in the `gradle.properties` file, to avoid imported library conflicts.

```properties
android.enableJetifier=true
```

**Step 5**: Add required runtime permissions for calls [click here](https://www.mirrorfly.com/docs/audio-video/android/v2/android-permissions)

## [**Initialize SDK For Calls**](https://www.mirrorfly.com/docs/audio-video/android/v2/quick-start/#initialize-sdk-for-calls)

Before using the SDK, ensure the basic requirements are met. In your `Application` class, within the `onCreate()` method, use the following `ChatManager` method to provide the necessary initialization data:

![configscyAar][image4]

```java
ChatManager.initializeSDK("LICENSE_KEY", (isSuccess, throwable, data) -> {
    if (isSuccess) {
        Log.d("TAG", "initializeSDK success ");
    } else {
        Log.d("TAG", "initializeSDK failed with reason " + data.get("message"));
    }
});
```

### [**Add MyApplication**](https://www.mirrorfly.com/docs/audio-video/android/v2/quick-start/#add-myapplication)

Add the created `MyApplication` to `AndroidManifest.xml`.

```xml
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.example.uikitapplication">
    <application
        android:name=".MyApplication"  // Add this line.
        android:icon="@mipmap/ic_launcher"
        android:label="@string/app_name"
        android:roundIcon="@mipmap/ic_launcher_round"
        android:theme="@style/AppTheme">
        <activity android:name=".MainActivity">
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />
                ...
                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity>
    </application>
</manifest>
```

## [**Registration**](https://www.mirrorfly.com/docs/audio-video/android/v2/quick-start/#registration)

The following method registers a user in sandbox or live mode based on the `setIsTrialLicenceKey` setting.

```java
FlyCore.registerUser(USER_IDENTIFIER, (isSuccess, throwable, data) -> {
    if (isSuccess) {
        Boolean isNewUser = (Boolean) data.get("is_new_user");  // true - if the current user is different from the previous session's logged-in user, false - if the same user is logging in again
        String userJid = (String) data.get("userJid"); //Ex. 12345678@xmpp-preprod-sandbox.mirrorfly.com (USER_IDENTIFIER+@+domain of the chat server)
        JSONObject responseObject = (JSONObject) data.get("data");
        String username = responseObject.getString("username");
    } else {
        // Register user failed print throwable to find the exception details.
    }
});
```

## [**Connect to the Chat Server**](https://www.mirrorfly.com/docs/audio-video/android/v2/quick-start/#connect-to-the-chat-server)

Once registration is successful, the Chat SDK automatically attempts to connect to the chat server. It also observes application lifecycle changes and connects or disconnects from the chat server accordingly.

## [**Observe Connection Events**](https://www.mirrorfly.com/docs/audio-video/android/v2/quick-start/#observe-connection-events)

Once the `ChatConnectionListener` is set, you can receive connection status updates through the callback method shown below.

```java
ChatManager.setConnectionListener(new ChatConnectionListener() {
    @Override
    public void onConnected() {
        // Write your success logic here to navigate Profile Page or
        // To Start your one-one chat with your friends
    }

    @Override
    public void onDisconnected() {
        // Connection disconnected
    }

    @Override
    public void onConnectionFailed(@NonNull FlyException e) {
        // Connection Not authorized or Unable to establish connection with server
    }

    @Override
    public void onReconnecting() {
        // Automatic reconnection enabled
    }
});
```

## [**Initialize Call SDK**](https://www.mirrorfly.com/docs/audio-video/android/v2/quick-start/#initialize-call-sdk)

In your `Application` class, inside the `onCreate()` method add the below lines:

```java
@Override
public void onCreate() {
    super.onCreate();

    //set your call activity
    CallManager.setCallActivityClass(CALL_UI_ACTIVITY.class);

    CallManager.setMissedCallListener((isOneToOneCall, userJid, groupId, callType, userList, CallMetaData[] callMetaDataArray) -> {
        //show missed call notification
    });

    CallManager.setCallHelper(new CallHelper() {
        @NonNull
        @Override
        public String getNotificationContent(@NonNull String callDirection, CallMetaData[] callMetaDataArray) {
            return CallNotificationHelper.getNotificationMessage();
        }
    });

    CallManager.setCallNameHelper(new CallNameHelper() {
        @NonNull
        @Override
        public String getDisplayName(@NonNull String jid, CallMetaData[] callMetaDataArray) {
            return ContactManager.getDisplayName(jid);
        }
    });
}
```

## [**Setup your call activity**](https://www.mirrorfly.com/docs/audio-video/android/v2/quick-start/#setup-your-call-activity)

Define your Call UI activity in the `AndroidManifest.xml` as shown below.  
In your call activity’s `onCreate()` method, call the following method to configure the call activity.

```xml
<activity
    android:name="YOUR_CALL_ACTIVITY"
    android:configChanges="screenSize|smallestScreenSize|screenLayout|orientation"
    android:excludeFromRecents="true"
    android:launchMode="singleTask"
    android:resizeableActivity="false"
    android:screenOrientation="portrait"
    android:supportsPictureInPicture="true"
    android:showOnLockScreen="true"
    android:turnScreenOn="true"
    android:taskAffinity="call.video"
    tools:targetApi="o_mr1" />
```

To remove the ongoing call notification, call the following method in your call activity’s `onStart()` to notify the audio and video calling SDK.

```java
CallManager.configureCallActivity(ACTIVITY);
```

Call the following method in your call activity’s `onStop()` to notify the Call SDK to display the ongoing call notification.

```java
CallManager.bindCallService();
```

```java
CallManager.unbindCallService();
```

### [**Preparing user jid**](https://www.mirrorfly.com/docs/audio-video/android/v2/quick-start/#preparing-user-jid)

To generate a JID for any user, use the below method.

```java
FlyUtils.getJid(USER_NAME);
```

## [**Make a call**](https://www.mirrorfly.com/docs/audio-video/android/v2/quick-start/#make-a-call)

To send custom data when making a call, use the optional `metaData` parameter in all `makeCall` methods. This parameter accepts an array of type `CallMetadata`.

### [**Make a voice call**](https://www.mirrorfly.com/docs/audio-video/android/v2/quick-start/#make-a-voice-call)

The voice call feature allows users to make a one-to-one audio call with another SDK user, including optional call metadata. Use the following method to initiate a voice call:

```java
CallManager.makeVoiceCall("TO_JID", CALL_METADATA, (isSuccess, flyException) -> {
    if (isSuccess) {
        //SDK will take care of presenting the Call UI. It will present the activity that is passed using the method `CallManager.setCallActivityClass()`
        Log.d("MakeCall", "call success");
    } else {
        if (flyException != null) {
            String errorMessage = flyException.getMessage();
            Log.d("MakeCall", "Call failed with error: " + errorMessage);
            //toast error message
        }
    }
});
```

## [**Receive a call**](https://www.mirrorfly.com/docs/audio-video/android/v2/quick-start/#receive-a-call)

When you receive an audio call from another SDK user, the Call SDK will display a notification if the device is running Android 10 (API level 29) or higher. On lower Android versions, the activity set via `CallManager.setCallActivityClass()` during SDK initialization will launch with the call details. A sample call UI is provided for quick integration.

[**Answer the call**](https://www.mirrorfly.com/docs/audio-video/android/v2/quick-start/#answer-the-call)

When you receive an audio call from another SDK user, your activity may be launched depending on the Android version. When the user presses the accept button in your call UI, call the following SDK method to answer the call and notify the caller.

**Note:** If the required permissions are not granted, the call will be automatically declined even if the user attempts to answer it.

```java
CallManager.answerCall((isSuccess, flyException) -> {
    if (isSuccess) {
        Log.d("AnswerCall", "call answered success");
    } else {
        if (flyException != null) {
            String errorMessage = flyException.getMessage();
            Log.d("AnswerCall", "Call answered failed with error: " + errorMessage);
            //toast error message
        }
    }
});
```

### [**Decline the call**](https://www.mirrorfly.com/docs/audio-video/android/v2/quick-start/#decline-the-call)

When you receive an audio call from another SDK user, your activity may be launched depending on the Android version. When the user presses the decline button in your call UI, call the following SDK method to decline the call and notify the caller.

```java
CallManager.declineCall();
```

## [**Disconnect the ongoing call**](https://www.mirrorfly.com/docs/audio-video/android/v2/quick-start/#disconnect-the-ongoing-call)

Whenever you make an audio call to another SDK user and want to disconnect either before the call connects or after the conversation ends, call the following SDK method when the user presses the disconnect button in your call UI. This will end the call and notify the other participant.

```java
CallManager.disconnectCall();
```

# **☁️ Deployment Models \- Self-hosted and Cloud**

MirrorFly offers full freedom with the hosting options:  
**Self-hosted:** Deploy your client on your own data centers, private cloud or third-party servers.  
[Check out our multi-tenant cloud hosting](https://www.mirrorfly.com/self-hosted-chat-solution.php)  
**Cloud:** Host your client on MirrorFly’s multi-tenant cloud servers.   
[Check out our multi-tenant cloud hosting](https://www.mirrorfly.com/multi-tenant-chat-for-saas.php)

# **📱 Mobile Client**

MirrorFly offers a fully-built client **SafeTalk** that is available in:  
![Rocket.Chat on Apple App Store][image5] ![Rocket.Chat on Google Play][image6]   
You can use this client as a messaging app, or customize, rebrand & white-label it as your chat client. 

# **📚 Learn More**

* [Developer Documentation](https://www.mirrorfly.com/docs/)  
* [Product Tutorials](https://www.mirrorfly.com/tutorials/)  
* [Dart Documentation](https://pub.dev/packages/mirrorfly_plugin)  
* [Pubdev Documentation](https://pub.dev/packages/mirrorfly_plugin)  
* [Npmjs Documentation](https://www.npmjs.com/~contus)  
* [On-premise Deployment](https://www.mirrorfly.com/on-premises-chat-server.php)   
* [See who's using MirrorFly](https://www.mirrorfly.com/chat-use-cases.php)

# **🧑‍💻 Hire Experts**

Need a tech team to build your enterprise app? [Hire a full team of experts](https://www.mirrorfly.com/hire-video-chat-developer.php). From concept to launch, we handle every step of the development process. Get a high-quality, fully-built app ready to launch, carefully built by industry experts

# **⏱️ Round-the-clock Support**

If you’d like to take help when working with our solution, feel free to [contact our experts](https://www.mirrorfly.com/contact-sales.php) who will be available to help you anytime of the day or night. 

## **💼 Become a Part of our amazing team**

We're always on the lookout for talented developers, support specialists, and product managers. Visit our [careers page](https://www.contus.com/careers.php) to explore current opportunities.

## **🗞️ Get the Latest Updates**

* [Blog](https://www.mirrorfly.com/blog/)  
* [Facebook](https://www.facebook.com/MirrorFlyofficial/)  
* [Twitter](https://twitter.com/mirrorflyteam)  
* [LinkedIn](https://www.linkedin.com/showcase/mirrorfly-official/)  
* [Youtube](https://www.youtube.com/@mirrorflyofficial)  
* [Instagram](https://www.instagram.com/mirrorflyofficial/)
