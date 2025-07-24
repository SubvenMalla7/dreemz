class LoginStatusSingleton {
  static final LoginStatusSingleton _instance =
      LoginStatusSingleton._internal();
  bool isLoginStatus = false;

  String? userLoginDetailEntity;

  factory LoginStatusSingleton() {
    return _instance;
  }

  LoginStatusSingleton._internal();

  void setString(bool value) {
    isLoginStatus = value;
  }

  bool getString() {
    return isLoginStatus;
  }

  void setUserLoginDetailEntity(String? value) {
    userLoginDetailEntity = value;
  }
}
