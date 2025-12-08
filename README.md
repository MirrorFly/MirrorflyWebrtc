<p align="center">
  <img  src="https://dasa7d6hxd0bp.cloudfront.net/images/mirrorfly.webp" data-canonical-src="https://dasa7d6hxd0bp.cloudfront.net/images/mirrorfly.webp" width="400"  alt=""/>
</p>

# **MirrorFly React Native SDK For Video Chat & Calls**

Integrate Real-time Messaging, Audio & Video Calling into Android, and iOS apps with MirrorFly React Native SDK. 

With support for RTMP and WebRTC, 1000+ communication features, 500+ AI-powered features, MirrorFly lets you build any app with complete customization and control over features and security. Above this, the solution gives full data sovereignty and deployment flexibility (on-premise/ on-cloud). 

# **🤹 Key Product Offerings** 

MirrorFly helps build omni-channel communication apps for any kind of business

**💬 [In-app Messaging](https://www.mirrorfly.com/chat-api-solution.php)** \- Connect users individually or as groups via instant messaging features.  
**🎯 [HD Video Calling](https://www.mirrorfly.com/video-call-solution.php)**\- Engage users over face-to-face conversations anytime, and from anywhere.   
**🦾 [HQ Voice Calling](https://www.mirrorfly.com/voice-call-solution.php)** \- Deliver crystal clear audio calling experiences with latency as low as 3ms.   
🤖 [**AI Voice Agent**](https://www.mirrorfly.com/conversational-ai/voice-agent/) \- Build custom  AI voicebots that can understand, act and respond to user questions.   
**🤖 [AI Chatbot](https://www.mirrorfly.com/conversational-ai/chatbot/)** \- Deploy white-label AI chatbots that drive autonomous conversations across any web or mobile app.  
**🦾 [Live Streaming](https://www.mirrorfly.com/live-streaming-sdk.php)** \- Broadcast video content to millions of viewers around the world, within your own enterprise app. 

### **⚒️React Native SDK For Android & iOS**

### [**Requirements**](https://www.mirrorfly.com/docs/chat/reactnative/quick-start#requirements)

The requirements for chat SDK for React Native Mobile App are:

* React-Native \>= 0.73.0 \<=0.79.5  
* Node Version \>= 18.20.4  
* npm \- 10.7.0

**iOS**

To enable/disable New Architecture in Podfile:

```txt
ENV['RCT_NEW_ARCH_ENABLED'] = '0'  # Use '1' to enable, '0' to disable
```

**Android**

To enable/disable New Architecture in gradle.properties:

```txt
newArchEnabled=false  # Use 'true' to enable, 'false' to disable
```

### [**Getting Started**](https://www.mirrorfly.com/docs/chat/reactnative/quick-start#things-to-be-noted-before-you-get-started)

##### [**SDK License Key**](https://www.mirrorfly.com/docs/chat/reactnative/quick-start#sdk-license-key)

**Note:** Skip this part if you are already having your license key.

You must obtain an SDK License Key to integrate the MirrorFly Chat SDK into your app. The MirrorFly server uses this key to authenticate your app’s SDK instance.

##### [**To get the License Key**](https://www.mirrorfly.com/docs/chat/reactnative/quick-start#to-get-the-license-key)**,**

Step 1: Register [here](https://www.mirrorfly.com/contact-sales.php) to get a MirrorFly User account.  

Step 2: [Login](https://console.mirrorfly.com/) to your Account  

Step 3: Get the License key from the application Info’ section  

<img  src="https://www.mirrorfly.com/docs/assets/images/license-key-a1173e922ebff14b6ae1a2428f822eec.png" data-canonical-src="https://www.mirrorfly.com/docs/assets/images/license-key-a1173e922ebff14b6ae1a2428f822eec.png" width="100%"  alt=""/>

# **Real-time Chat Integration**

## [Integrate the Chat SDK](https://www.mirrorfly.com/docs/chat/reactnative/quick-start#integrate-the-chat-sdk)

**Step 1:** Update all your packages.json files.

**Step 2:** Check your package files for any duplicates if the app isn’t working on iOS.

#### [**Integrate Using Npm package**](https://www.mirrorfly.com/docs/chat/reactnative/quick-start#integrate-using-npm-package)

Step 3: Install MirrorFly SDK in your React Native app.

```bash
npm i mirrorfly-reactnative-sdk@2.4.1
```

Step 4: Import the SDK into your application where you want

```js
import { SDK } from "mirrorfly-reactnative-sdk";
```

## [NPM Package Addition](https://www.mirrorfly.com/docs/chat/reactnative/quick-start#adding-npm-package-dependencies-to-integrate-the-chat-sdk)

```json
{
  "@react-native-community/netinfo": "^11.4.1",
  "react-native-get-random-values": "1.11.0", //must use version >=1.7.1
  "realm": "^20.1.0",
  "react-native-fs": "^2.20.0",
  "moment": "2.30.1",
  //add the below calls related dependencies
  "react-native-webrtc": "124.0.4",           // must use version "124.0.4"
  "react-native-background-timer": "^2.4.1",
  "react-native-permissions": "^5.2.1"
}
```

## [React Native Messaging SDK Initialization](https://www.mirrorfly.com/docs/chat/reactnative/quick-start#initialize-the-react-native-messaging-sdk)

Before you initialize the real-time React Native Chat SDK, make sure you have the data that tracks changes in the client app’s connection status.

Paste your license key into the `licenseKey` parameter, then use the method below to pass this data to the SDK for processing.

In your app file (e.g., App.tsx or App.js), import the SDK and call the `initializeSDK` function with the required parameters.

```js
const initializeObj = {
  apiBaseUrl: `API_URL`,
  licenseKey: `LICENSE_KEY`,
  isTrialLicenseKey: `TRIAL_MODE`,
  callbackListeners: {},
};

await SDK.initializeSDK(initializeObj);
```

### [**Sandbox Details**](https://www.mirrorfly.com/docs/chat/reactnative/quick-start#sandbox-details)

You can get the apiUrl and licenseKey details from the Overview section in the MirrorFly Console dashboard.

![license-key][image3]

```js
function connectionListener(response) {
  if (response.status === "CONNECTED") {
    console.log("Connection Established");
  } else if (response.status === "DISCONNECTED") {
    console.log("Disconnected");
  }
}

const initializeObj = {
  apiBaseUrl: "https://api-preprod-sandbox.mirrorfly.com/api/v1",
  licenseKey: "XXXXXXXXXXXXXXXXX",
  isTrialLicenseKey: true,
  callbackListeners: {
    connectionListener,
  },
};

await SDK.initializeSDK(initializeObj);
```

#### [**Example Response**](https://www.mirrorfly.com/docs/chat/reactnative/quick-start#example-response)

```json
{
  "statusCode": 200,
  "message": "Success"
}
```

### [**Device ID Module**](https://www.mirrorfly.com/docs/chat/reactnative/quick-start#device-id-module)

Download DeviceId Module files

[Download](https://s3.ap-south-1.amazonaws.com/app.mirrorfly.com/rn_device_id_dependency.zip)

**Step 1:** Download the Android files from the link above, locate the required files, and copy them into the `android/app/src/main/java/com` directory.

**Step 2:** Download the iOS files from the link above, locate the required files, and add them to your project in Xcode using **Add Files to [Your Project]**. Then follow the steps below.

## [Register User](https://www.mirrorfly.com/docs/chat/reactnative/quick-start#register-user)

**Step 1:** You can use the below given method to register a new user.

**Step 2:** After you register, the system provides a username and password. Use these credentials to connect to the server through the [connect method](https://www.mirrorfly.com/docs/chat/reactnative/quick-start#connect-to-mirrorfly-server).

```js
// "This method was deprecated and will be removed in the future release"
 await SDK.register(
USER_IDENTIFIER,
FCE_TOKEN,
VOIP_DEVICE_TOKEN,
MODE,
REGISTER_META_DATA,
FORCE_REGISTER
);

// "The above method is migrated as below"
const registerObject = {
  userIdentifier,
  fcmtoken,
  voipDeviceToken,
  mode,
  registerMetaData,
  forceRegister,
};

await SDK.register(registerObject);
```

#### [**Sample Response:**](https://www.mirrorfly.com/docs/chat/reactnative/quick-start#sample-response)

```json
{
  "statusCode": 200,
  "message": "Success",
  "data": {
    "username": "123456789",
    "password": "987654321"
  }
}
```

## [Connect to MirrorFly Server](https://www.mirrorfly.com/docs/chat/reactnative/quick-start#connect-to-mirrorfly-server)

**Step 1:** Use the credentials you received during [registration](https://www.mirrorfly.com/docs/chat/reactnative/quick-start#register-user) to establish a connection with the server.

**Step 2:** After you establish the connection successfully, the server returns a statusCode of 200. If the connection fails, you receive an execution error instead.

**Step 3:** You can also track the connection status through the [connectionListener](https://www.mirrorfly.com/docs/chat/reactnative/callback-listeners#connection-listener) callback function.

**Step 4:** If the server connection fails, the callback returns an error message.

```js
await SDK.connect(`USERNAME`, `PASSWORD`);
```

#### [**Sample Response:**](https://www.mirrorfly.com/docs/chat/reactnative/quick-start#sample-response-1)

```json
{
  "message": "Login Success",
  "statusCode": 200
}
```

## [Send a Message](https://www.mirrorfly.com/docs/chat/reactnative/quick-start#send-a-message)

Finally, to send a message to another user you can use the below given method,

```js
await SDK.sendTextMessage(
  `TO_USER_JID`,
  `MESSAGE_BODY`,
  `MESSAGE_ID`,
  `REPLY_TO`
);
```

#### [**Response Format:**](https://www.mirrorfly.com/docs/chat/reactnative/quick-start#response-format)

```json
{
  "message": "",   // String - Success/Error Message
  "statusCode": "" // Number - status code
}
```

## [Receive a Message](https://www.mirrorfly.com/docs/chat/reactnative/quick-start#receive-a-message)

To receive messages from another user, implement the `messageListener` function. This function triggers whenever you receive a new message or a related event in one-to-one or group chats. When [initializing the SDK](https://www.mirrorfly.com/docs/chat/reactnative/quick-start#initialize-chat-sdk), add the callback method below as part of the setup.

```js
function messageListener(response) {
  console.log("Message Listener", response);
}
```

# **Voice & Video Calling Integration**

**Note:** Before making the call, make sure you have implemented the [helper](https://www.mirrorfly.com/docs/audio-video/reactnative/callback-listeners#helper-object) object.

## [Make a voice call](https://www.mirrorfly.com/docs/audio-video/reactnative/making-a-call#make-a-voice-call)

You can initiate a voice call by passing the callee’s user JID into the `makeVoiceCall` method. Once the call is successfully initiated, the [callStatusListener](https://www.mirrorfly.com/docs/audio-video/reactnative/callback-listeners#call-status-listener) callback will be triggered, providing updates on the callee’s call status.

**Note:** If one- to-one call feature is unavailable for your plan, then it will throw 403 exception

```js
await SDK.makeVoiceCall(['USER1_JID']);
```

#### [**Response Format**](https://www.mirrorfly.com/docs/audio-video/reactnative/making-a-call#response-format)

```json
{
  "statusCode": 200, // Number - status code
  "message": "",     // String - Success/Error Message
  "callType": "",    // String - Call Type - "audio"
  "roomId": ""       // String - Unique room ID
}
```

### [**Make a video call**](https://www.mirrorfly.com/docs/audio-video/reactnative/making-a-call#make-a-video-call)

Initiate a call by passing the callee’s user JID to the `makeVideoCall` method. After the call is successfully initiated, the `callStatusListener` callback will be triggered, providing the callee’s call status.

**Caution:** If the one-to-one call feature is not available for your plan, the method will throw a 403 exception.

```js
await SDK.makeVideoCall(['USER1_JID']);
```

#### **Response Format**  
(https://www.mirrorfly.com/docs/audio-video/reactnative/making-a-call#response-format-1)

```json
{
  "statusCode": 200, // Number - status code
  "message": "",     // String - Success/Error Message
  "callType": "",    // String - Call Type - "video"
  "roomId": ""       // String - Unique room ID
}
```

#### [**Response Params**](https://www.mirrorfly.com/docs/audio-video/reactnative/making-a-call#response-params-1)

To receive the user track, ensure that a [userTrackListener](https://www.mirrorfly.com/docs/audio-video/reactnative/callback-listeners#user-track-listener) callback is already registered in the caller’s client app. When you initiate a call, this callback will return both your track and the callee’s track. Use the `localUser` and `userJid` parameters to differentiate between users. Both audio and video tracks are provided in the same callback. Pass the received track object to the corresponding audio or video element based on its type.

## [Receive incoming call](https://www.mirrorfly.com/docs/audio-video/reactnative/making-a-call#receive-incoming-call)

To receive incoming calls, register the [incomingCallListener](https://www.mirrorfly.com/docs/audio-video/reactnative/callback-listeners#incoming-call-listener) callback in the callee’s client app. When a user makes a call, the callee receives the call data through this callback.

```js
// Callback Response Argument Structure
{
  allUsers: ["USER1_JID", "USER2_JID"],
  callMode: "onetoone",
  callTime: 1681905421215,
  callType: "audio|video",
  from: "USER_JID|FROM_USER_JID",
  groupId: null,
  localUser: BOOLEAN,
  roomId: "wmupbheao",
  roomLink: "ndy-bmkb-eui",
  status: "calling",
  to: "FROM_USER_JID",
  toUsers: ["USER_JID"],
  userDetails: {},
  userJid: "FROM_USER_JID",
  usersStatus: [{}]
}
```

### [**Answer a call**](https://www.mirrorfly.com/docs/audio-video/reactnative/making-a-call#answer-a-call)

To answer a call use the `answerCall` method.

```js
await SDK.answerCall();
```

#### [**Response Format**](https://www.mirrorfly.com/docs/audio-video/reactnative/making-a-call#response-format-2)

```json
{
  "statusCode": 200, // Number - status code
  "message": ""      // String - Success/Error Message
}
```

### [**End a call**](https://www.mirrorfly.com/docs/audio-video/reactnative/making-a-call#end-a-call)

To end a call use the `endCall` method.

```js
await SDK.endCall();
```

#### [**Response Format**](https://www.mirrorfly.com/docs/audio-video/reactnative/making-a-call#response-format-3)

```json
{
  "statusCode": 200, // Number - status code
  "message": ""      // String - Success/Error Message
}
```

### [**Decline a call**](https://www.mirrorfly.com/docs/audio-video/reactnative/making-a-call#decline-a-call)

Use the `declineCall` method to decline any incoming call

```js
await SDK.declineCall();
```

#### [**Response Format**](https://www.mirrorfly.com/docs/audio-video/reactnative/making-a-call#response-format-4)

```json
{
  "statusCode": 200, // Number - status code
  "message": ""      // String - Success/Error Message
}
```

# **☁️ Deployment Models \- Self-hosted and Cloud**

MirrorFly offers full freedom with the hosting options:  
**Self-hosted:** Deploy your client on your own data centers, private cloud or third-party servers.  
[Check out our multi-tenant cloud hosting](https://www.mirrorfly.com/self-hosted-chat-solution.php)  
**Cloud:** Host your client on MirrorFly’s multi-tenant cloud servers.   
[Check out our multi-tenant cloud hosting](https://www.mirrorfly.com/multi-tenant-chat-for-saas.php)

# **📱 Mobile Client**

MirrorFly offers a fully-built client SafeTalk that is available in:
- iOS
- Android


You can use this client as a messaging app, or customize, rebrand & white-label it as your chat client. 

# **📚 Learn More**

* [Developer Documentation](https://www.mirrorfly.com/docs/chat/reactnative/quick-start/): MirrorFly React Native  
* [MirrorFly React Native](https://www.mirrorfly.com/react-native-chat-sdk.php) Solution   
* [MirrorFly React Native Sample App](https://github.com/MirrorFly/MirrorFly-ReactNative-Sample)  
* [MirrorFly React Native UI Kit](https://www.mirrorfly.com/docs/uikit/web/quick-start/)  
* [Product Tutorials](https://www.mirrorfly.com/tutorials/)  
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

