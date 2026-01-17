import 'package:get/get.dart';
import 'package:app_supermercado_ype/api/api.dart';
import 'package:app_supermercado_ype/features/auth/controllers/auth_controller.dart';
import 'package:app_supermercado_ype/features/auth/domain/repositories/auth_repository.dart';
import 'package:app_supermercado_ype/features/auth/domain/repositories/auth_repository_interface.dart';
import 'package:app_supermercado_ype/features/auth/domain/services/auth_service.dart';
import 'package:app_supermercado_ype/features/auth/domain/services/auth_service_interface.dart';
import 'package:app_supermercado_ype/features/notification/controllers/notification_controller.dart';

Future<void> init() async {

  Api api = Api();
  Get.lazyPut(() => api);

  // INFO: Repositories
  AuthRepositoryInterface authRepository = AuthRepository(apiClient: Get.find());
  Get.lazyPut(() => authRepository);

  // INFO: Services
  AuthServiceInterface authService = AuthService(authRepository: Get.find());
  Get.lazyPut(() => authService);

  // INFO: Controllers
  Get.lazyPut(() => AuthController(authService: Get.find()));
  Get.put(NotificationController(), permanent: true);

}