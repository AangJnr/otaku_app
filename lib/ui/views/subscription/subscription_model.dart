import 'package:otaku_katarougu_app/app/app.logger.dart';
import 'package:otaku_katarougu_app/app/app.router.dart';
import 'package:otaku_katarougu_app/main.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.dialogs.dart';
import '../../../app/app.locator.dart';
import '../../../domain/model/category/category.dart';
import '../../../domain/model/profile/profile.dart';
import '../../../domain/repository/user_repository.dart';
import '../viewmodel.dart';

class SubscriptionModel extends ViewModel {
  final _userRepository = locator<UserRepository>();
  List<Category> _categories = [];
  int _index = 1;
  int get index => _index;
  List<Category> get categories => _categories;

  @override
  void init({String? key, Profile? profile}) async {
    (await runBusyFuture(_userRepository.getCategories())).when((data) {
      _categories = data;
      setIndex(1);
      rebuildUi();
    }, (error) {
      getLogger('SubscriptionModel').e(error.toString());
      showError();
    });
  }

  showError() {
    routerService.navigateTo(UnknownViewRoute(
        title: "Uh Oh!.",
        message: "Something bad happened\nTry a page refresh?",
        pageRoute: const SubscriptionViewRoute()));
  }

  void setIndex(int newIndex) {
    if (_categories.isNotEmpty) {
      _index = newIndex;
      if (categories[newIndex].theme != null) {
        MainApp.appTheme = categories[newIndex].theme!;
      }
      rebuildUi();
    }
  }

  void showEnterEmailToSubscribeDialog() {
    locator<DialogService>().showCustomDialog(
        variant: DialogType.subscriptionAlert,
        title: '',
        description:
            "Get access to features such as ${categories[index].features.fold('', (previousValue, element) => "$previousValue$element\n")} \nPlease enter your email to subscribe",
        data: categories[index]);
  }
}
