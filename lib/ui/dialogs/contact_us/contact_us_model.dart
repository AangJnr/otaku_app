
import 'package:otaku_katarougu_app/utils/validators.dart';

import '../../../domain/model/category/category.dart';
import '../../views/viewmodel.dart';

class ContactUsDialogModel extends ViewModel {
String _email = '';

String get email => _email;
bool get isEmailValid => Validators.validateEmail(_email).isEmpty == true;
  void subscribe(Category category) {}

  void updateEmail(String? value) {
    _email = value??'';
    rebuildUi();
  }
}
