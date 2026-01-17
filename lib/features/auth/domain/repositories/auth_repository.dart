import 'package:app_supermercado_ype/api/api.dart';
import 'package:app_supermercado_ype/features/auth/domain/repositories/auth_repository_interface.dart';
import 'package:app_supermercado_ype/util/app_constants.dart';

class AuthRepository implements AuthRepositoryInterface {

  final Api apiClient;

  AuthRepository({required this.apiClient});


  @override
  Future getList() async {

    throw UnimplementedError();

  }

  @override
  Future add(Map<String, dynamic> body) async{

    try {

      await Api.post(
          uri: AppConstants.REGISTER_USER_ROUTE,
          body: body
      );


    } catch (e) {
      rethrow;
    }
  }

  @override
  Future delete(int? id) {
    throw UnimplementedError();
  }

  @override
  Future get(String? id) {
    throw UnimplementedError();
  }

  @override
  Future update(Map<String, dynamic> body, int? id) {
    throw UnimplementedError();
  }

}