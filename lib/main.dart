import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:login_signup_demo/routes/app_routes.dart';
import 'package:login_signup_demo/routes/app_screens.dart';

import 'configs/AppColors.dart';
import 'configs/Utils.dart';
import 'localization/translation.dart';
import 'screens/splash_screen.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

AndroidNotificationChannel? channel;

FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;
late FirebaseMessaging messaging;

void notificationTapBackground(NotificationResponse notificationResponse) {
  print('notification(${notificationResponse.id}) action tapped: '
      '${notificationResponse.actionId} with'
      ' payload: ${notificationResponse.payload}');
  if (notificationResponse.input?.isNotEmpty ?? false) {
    print(
        'notification action tapped with input: ${notificationResponse.input}');
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  messaging = FirebaseMessaging.instance;
  messaging = FirebaseMessaging.instance;

  await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  //If subscribe based sent notification then use this token
  final fcmToken = await messaging.getToken();
  print("fcm token=== $fcmToken");

  //If subscribe based on topic then use this
  await messaging.subscribeToTopic('flutter_notification');

  // Set the background messaging handler early on, as a named top-level function
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  if (!kIsWeb) {
    channel = const AndroidNotificationChannel(
        '123', // id
        'flutter_notification_title', // title
        importance: Importance.high,
        enableLights: true,
        enableVibration: true,
        showBadge: true,
        playSound: true);

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    final android = const AndroidInitializationSettings('@drawable/ic_notification');
    final iOS = const DarwinInitializationSettings();
    final initSettings = InitializationSettings(android: android, iOS: iOS);

    await flutterLocalNotificationsPlugin!.initialize(initSettings,
        onDidReceiveNotificationResponse: notificationTapBackground,
        onDidReceiveBackgroundNotificationResponse: notificationTapBackground);

    await messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  String language = "";

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    setDefaultLanguage();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void setDefaultLanguage() async {
    language = await Utils.getPrefString("language");
    if (language.isEmpty) {
      language = "en";
      Utils.setPrefString("language", "en");
    }
    Utils.locale.value = Locale(language, '');
    Utils.locale.notifyListeners();
    Get.updateLocale(Utils.locale.value);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark));
    return ValueListenableBuilder(
        valueListenable: Utils.locale,
        builder: (BuildContext context, Locale value, _) {
          return GetMaterialApp(
            title: "Password Manager",
            initialRoute: Routes.Splash,
            home: SplashScreen(),
            debugShowCheckedModeBanner: false,
            defaultTransition: Transition.cupertino,
            color: AppColors().colorBlue,
            getPages: AppScreens.screens,
            navigatorKey: Utils.navigatorKey,
            translationsKeys: AppTranslation.translationsKeys,
            locale: value,
            builder: (context, child) {
              //to remove shadow(glow) while scrolling
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.1),
                child: ScrollConfiguration(
                  behavior: MyBehavior(),
                  child: child!,
                ),
              );
            },
            theme: ThemeData(
              fontFamily: 'Poppins',
              primaryColor: Colors.white,
              brightness: Brightness.light,
              buttonColor: AppColors().colorBlue,
              accentColor: AppColors().colorBlue,
              focusColor: AppColors().colorDarkText,
              hintColor: AppColors().colorLightText,
            ),
            darkTheme: ThemeData(
              brightness: Brightness.light,
              primaryColor: AppColors().colorWhite,
            ),
            fallbackLocale: const Locale('en', ''),
            textDirection: TextDirection.ltr,
            enableLog: true,
          );
        });
  }
}

class MyBehavior extends ScrollBehavior {
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
