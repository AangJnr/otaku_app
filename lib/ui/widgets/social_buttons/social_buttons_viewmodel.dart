import '../../views/viewmodel.dart';

class SocialButtonsViewModel extends ViewModel {
  bool _isVisible = false;
  bool get isWidgetVisible => _isVisible;

  void toggleVisibility() {
    _isVisible = !_isVisible;
    rebuildUi();
  }
}
