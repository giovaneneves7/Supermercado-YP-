import 'package:app_supermercado_ype/interfaces/repository_interface.dart';

/// @author Giovane Neves
abstract class AuthRepositoryInterface implements RepositoryInterface {

  @override
  Future getList();

}