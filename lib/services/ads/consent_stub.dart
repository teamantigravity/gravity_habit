/// Stub for UMP consent types on non-mobile platforms.
library;

class ConsentRequestParameters {}

class ConsentInformation {
  ConsentInformation._();
  static final instance = ConsentInformation._();

  void requestConsentInfoUpdate(
    ConsentRequestParameters params,
    void Function() onSuccess,
    void Function(dynamic error) onFailure,
  ) {
    onSuccess();
  }

  Future<bool> isConsentFormAvailable() async => false;
  void reset() {}
}

class ConsentForm {
  static void loadConsentForm(
    void Function(ConsentForm form) onLoaded,
    void Function(dynamic error) onFailed,
  ) {
    onFailed('Not supported on this platform');
  }

  void show(void Function(dynamic error) onDismissed) {
    onDismissed(null);
  }
}
