import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:app_supermercado_ype/util/app_constants.dart';

/// @author Giovane Neves
class SettingsController extends GetxController implements GetxService {

  static final _box = GetStorage();
  static final String _isFirstAcess = AppConstants.IS_FIRST_ACCESS_KEY;

  static bool get isFirstAccess => _box.read(_isFirstAcess) ?? true;

  static Future<void> markFirstAccessComplete() async {
    await _box.write(_isFirstAcess, false);
  }

}