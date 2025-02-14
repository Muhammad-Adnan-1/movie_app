
abstract class AppResultCallback{
  void onSuccess({String? type, dynamic parameters});
  void onError(String message);
}