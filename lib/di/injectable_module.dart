import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class InjectableModule {
  @lazySingleton
  ImagePicker get imagePicker => ImagePicker();
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
