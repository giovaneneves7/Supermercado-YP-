import 'package:get/get.dart';
import 'package:app_supermercado_ype/features/auth/domain/services/auth_service_interface.dart';

/// @author Giovane Neves
class AuthController extends GetxController implements GetxService {

  final AuthServiceInterface authService;

  AuthController({required this.authService});

  Future<void> registerUser(Map<String, dynamic> data) async{

    await authService.registerUser(data);
    update();

  }

}