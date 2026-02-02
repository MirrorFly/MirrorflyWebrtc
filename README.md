# **MirrorFly WebRTC SDK For Voice & Video Calls**

## **Introduction**

Enable browser-based video calling and voice communication in your web application with this WebRTC SDK integration guide. MirrorFly's customizable white-label solution delivers pre-built WebRTC functionality with straightforward client-side implementation and extensive configuration options. This readme details required libraries, dependency management, supplementary capabilities, and step-by-step setup instructions.

# **Key Product Offerings**

MirrorFly helps build omni-channel communication apps for any kind of business

- [**In-app Messaging**](https://www.mirrorfly.com/chat-api-solution.php) - Connect users individually or as groups via instant messaging features.
- [**HD Video Calling**](https://www.mirrorfly.com/video-call-solution.php) - Engage users over face-to-face conversations anytime, and from anywhere.
- [**HQ Voice Calling**](https://www.mirrorfly.com/voice-call-solution.php) - Deliver crystal clear audio calling experiences with latency as low as 3ms.
- [**AI Voice Agent**](https://www.mirrorfly.com/conversational-ai/voice-agent/) - Build custom AI voicebots that can understand, act and respond to user questions.
- [**AI Chatbot**](https://www.mirrorfly.com/conversational-ai/chatbot/) - Deploy white-label AI chatbots that drive autonomous conversations across any web or mobile app.
- [**Live Streaming**](https://www.mirrorfly.com/live-streaming-sdk.php) - Broadcast video content to millions of viewers around the world, within your own enterprise app.

[**Requirements**](https://www.mirrorfly.com/docs/audio-video/android/v2/quick-start/#requirements)

The requirements for the Audio & Video Chat SDK for Android are:

- **Android**: Lollipop 5.0 (API Level 21) or higher
- **Java**: Version 7 or higher
- **Gradle**: 8.6.0 or higher
- **Kotlin:** 2.0.20 or higher
- **targetSdkVersion / compileSdkVersion:** 35 or above

### [**Getting Started**](https://www.mirrorfly.com/docs/audio-video/android/v2/quick-start/#things-to-be-noted-before-you-get-started)

**Step 1:** Register [here](https://www.mirrorfly.com/contact-sales.php) to get a MirrorFly User account.  
**Step 2:** [Login](https://console.mirrorfly.com/) to your Account  
**Step 3:** Get the License key from the application Info’ section

![MirrorFly License Key](https://www.mirrorfly.com/docs/assets/images/license-key-a1173e922ebff14b6ae1a2428f822eec.png)

### [**Video Call SDK Integration**](https://www.mirrorfly.com/docs/audio-video/android/v2/quick-start/#integrate-the-video-calling-sdk-for-android-app-video-tutorial)

**Step 1:** Create a new project or open an existing project in Android Studio.

**Step 2:**

- For Gradle 6.8 or higher, add the following code to your settings.gradle file.
- For Gradle 6.7 or lower, add the code to your root build.gradle file.

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

**Step 3:** Add the following dependencies in the app/build.gradle file.

```gradle
dependencies {
    implementation 'com.mirrorfly.sdk:mirrorflysdk:7.13.31'
}
```

**Step 4**: Add the below line in the gradle.properties file, to avoid imported library conflicts.

```properties
android.enableJetifier=true
```

**Step 5**: Add required runtime permissions for calls [click here](https://www.mirrorfly.com/docs/audio-video/android/v2/android-permissions)

## [**Initialize SDK For Calls**](https://www.mirrorfly.com/docs/audio-video/android/v2/quick-start/#initialize-sdk-for-calls)

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

```xml
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.example.uikitapplication">

    <application
        android:name=".MyApplication"
        android:icon="@mipmap/ic_launcher"
        android:label="@string/app_name"
        android:roundIcon="@mipmap/ic_launcher_round"
        android:theme="@style/AppTheme">

        <activity android:name=".MainActivity">
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />
                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity>

    </application>
</manifest>
```

## [**Registration**](https://www.mirrorfly.com/docs/audio-video/android/v2/quick-start/#registration)

```java
FlyCore.registerUser(USER_IDENTIFIER, (isSuccess, throwable, data) -> {
    if (isSuccess) {
        Boolean isNewUser = (Boolean) data.get("is_new_user");
        String userJid = (String) data.get("userJid");
        JSONObject responseObject = (JSONObject) data.get("data");
        String username = responseObject.getString("username");
    }
});
```

## [**Connect to the Chat Server**](https://www.mirrorfly.com/docs/audio-video/android/v2/quick-start/#connect-to-the-chat-server)

After successful registration, the Chat SDK automatically attempts to connect to the chat server.

## [**Observe Connection Events**](https://www.mirrorfly.com/docs/audio-video/android/v2/quick-start/#observe-connection-events)

```java
ChatManager.setConnectionListener(new ChatConnectionListener() {
    @Override
    public void onConnected() {}

    @Override
    public void onDisconnected() {}

    @Override
    public void onConnectionFailed(@NonNull FlyException e) {}

    @Override
    public void onReconnecting() {}
});
```

## [**Initialize Call SDK**](https://www.mirrorfly.com/docs/audio-video/android/v2/quick-start/#initialize-call-sdk)

```java
@Override
public void onCreate() {
    super.onCreate();

    CallManager.setCallActivityClass(CALL_UI_ACTIVITY.class);

    CallManager.setMissedCallListener((isOneToOneCall, userJid, groupId, callType, userList, callMetaDataArray) -> {
        // show missed call notification
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

```java
CallManager.configureCallActivity(ACTIVITY);
CallManager.bindCallService();
CallManager.unbindCallService();
```

### [**Preparing user jid**](https://www.mirrorfly.com/docs/audio-video/android/v2/quick-start/#preparing-user-jid)

```java
FlyUtils.getJid(USER_NAME);
```

## [**Make a call**](https://www.mirrorfly.com/docs/audio-video/android/v2/quick-start/#make-a-call)

### [**Make a voice call**](https://www.mirrorfly.com/docs/audio-video/android/v2/quick-start/#make-a-voice-call)

```java
CallManager.makeVoiceCall("TO_JID", CALL_METADATA, (isSuccess, flyException) -> {
    if (isSuccess) {
        Log.d("MakeCall", "call success");
    }
});
```

## [**Receive a call**](https://www.mirrorfly.com/docs/audio-video/android/v2/quick-start/#receive-a-call)

[**Answer the call**](https://www.mirrorfly.com/docs/audio-video/android/v2/quick-start/#answer-the-call)

```java
CallManager.answerCall((isSuccess, flyException) -> {
    if (isSuccess) {
        Log.d("AnswerCall", "call answered success");
    }
});
```

### [**Decline the call**](https://www.mirrorfly.com/docs/audio-video/android/v2/quick-start/#decline-the-call)

```java
CallManager.declineCall();
```

## [**Disconnect the ongoing call**](https://www.mirrorfly.com/docs/audio-video/android/v2/quick-start/#disconnect-the-ongoing-call)

```java
CallManager.disconnectCall();
```

## Deployment Models

- **Self-hosted** – Deploy your client on your own data centers, private cloud or third-party servers.
- **Cloud** – Host your client on MirrorFly’s multi-tenant cloud servers.

Learn more: [https://www.mirrorfly.com](https://www.mirrorfly.com)

---

## Resources

- [Developer Documentation](https://www.mirrorfly.com/docs)
- [Product Tutorials](https://www.mirrorfly.com/tutorials)
- [MirrorFly Flutter Solution](https://www.mirrorfly.com/flutter)
- [Dart Documentation](https://dart.dev)
- [Pub.dev Documentation](https://pub.dev)
- [NPM Documentation](https://www.npmjs.com)

---

## Hire Experts

Need a tech team to build your enterprise app? Hire a full team of experts. From concept to launch, we handle every step of the development process.

---

## Round-the-clock Support

Our experts are available 24/7 to help you.

---

## Join Our Team

Visit our careers page: [https://www.mirrorfly.com/careers](https://www.mirrorfly.com/careers)

---

## Get the Latest Updates

- [Blog](https://www.mirrorfly.com/blog)
- [Facebook](https://www.facebook.com/mirrorfly)
- [Twitter](https://twitter.com/mirrorfly)
- [LinkedIn](https://www.linkedin.com/company/mirrorfly)
- [YouTube](https://www.youtube.com/@mirrorfly)
- [Instagram](https://www.instagram.com/mirrorfly)
