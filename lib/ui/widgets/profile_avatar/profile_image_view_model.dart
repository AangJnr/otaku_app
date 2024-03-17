import 'package:otaku_katarougu_app/ui/views/base/view_state.dart';

import '../../../domain/model/user.dart';
import '../../views/base/viewmodel.dart';

class ProfileImageViewModel extends ViewModel<BaseViewState> {
  User get user => sessionManager.getUser();
}
