import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationProvider{
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  
  /*FirebaseMessaging.onMessage.listen((RemoteMessage message){
    print("Got a message while in foreground..!");
    print("The message data: ${message.data}");
    if(message.notification != null){
      print("Message also contain a notification: ${message.notification}");
    }
  });*/

  void askPermissions()async{
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true
  );
  print("User granted permission: ${settings.authorizationStatus}");
  }

  Future<String> getDeviceToken() async{
    String token = await _firebaseMessaging.getToken();
    return token;
  }

}