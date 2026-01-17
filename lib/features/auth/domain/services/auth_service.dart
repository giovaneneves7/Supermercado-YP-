import 'package:app_supermercado_ype/features/auth/domain/repositories/auth_repository_interface.dart';
import 'package:app_supermercado_ype/features/auth/domain/services/auth_service_interface.dart';
import 'package:app_supermercado_ype/features/settings/controllers/settings_controller.dart';

/// @author Giovane Neves
class AuthService implements AuthServiceInterface{

  final AuthRepositoryInterface authRepository;

  AuthService({required this.authRepository});

  @override
  Future<void> registerUser(Map<String, dynamic> body) async{

    await authRepository.add(body);

    SettingsController.markFirstAccessComplete();


  }

}