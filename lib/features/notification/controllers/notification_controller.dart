import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:app_supermercado_ype/helper/route_helper.dart';

/// @author Giovane Neves
class NotificationController extends GetxController {

  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  @override
  void onInit() {
    super.onInit();
    _setupFcm();
  }

  Future<void> _setupFcm() async {

    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('Permissão de notificação concedida.');

      await _messaging.subscribeToTopic('posts');
      print('Inscrito no tópico "posts"');

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        print('Mensagem recebida em foreground: ${message.notification?.title}');

        if (message.notification != null) {
          Get.snackbar(
            message.notification!.title ?? 'Nova Postagem!',
            message.notification!.body ?? 'Confira as novidades no app.',
            backgroundColor: Colors.white,
            colorText: Colors.black87,
            icon: const Icon(Icons.notifications_active, color: Colors.blue),
            snackPosition: SnackPosition.TOP,
            margin: const EdgeInsets.all(10),
            duration: const Duration(seconds: 5),
            onTap: (_) {
              Get.toNamed(RouteHelper.getWebViewScreen());
            },
          );
        }
      });

    } else {
      print('Permissão de notificação negada.');
    }
  }

  Future<String?> getToken() async {
    return await _messaging.getToken();
  }
}