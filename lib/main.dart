import 'package:app_supermercado_ype/features/auth/screens/signup_screen.dart';
import 'package:app_supermercado_ype/features/settings/controllers/settings_controller.dart';
import 'package:app_supermercado_ype/features/webview/screens/webview_screen.dart';
import 'package:app_supermercado_ype/helper/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:app_supermercado_ype/features/notification/handler/notification_handler.dart';
import 'package:app_supermercado_ype/helper/get_di.dart' as di;
import 'package:get_storage/get_storage.dart';


void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  } catch (e) {
    print("------------------------------------------------");
    print("ERRO DE INICIALIZAÇÃO DO FIREBASE (IGNORADO): $e");
    print("------------------------------------------------");
  }
  await GetStorage.init();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: RouteHelper.routes,
      locale: const Locale('pt', 'BR'),
      fallbackLocale: const Locale('en', 'US'),
      home: SettingsController.isFirstAccess ? SignupScreen() : WebViewScreen(),
    );
  }
}