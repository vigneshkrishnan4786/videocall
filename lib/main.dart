import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CallPage(callID: 'userID'),
    );
  }
}

class CallPage extends StatelessWidget {
  const CallPage({Key? key, required this.callID}) : super(key: key);
  final String callID;
  

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
        appID:
            14417963, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
        appSign:
            'd3046f7f16f9d1979ffa49f3169a45be006e6e45da11d24c289d5b1280ffadc0', // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
        userID: 'user_id',
        userName: localUserID,
        callID: callID,

        // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
        config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
          ..avatarBuilder = (BuildContext context, Size size,
              ZegoUIKitUser? user, Map extraInfo) {
            return user != null
                ? Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://your_server/app/avatar/${user.id}.png',
                        ),
                      ),
                    ),
                  )
                : const SizedBox();
          });
  }
}
