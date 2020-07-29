import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {

  @observable
  String email = "";

  @observable
  String password = '';

  @observable
  bool hidePassword = true;

  @observable
  bool loading = false;

  @observable
  bool loggedIn = false;

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  @action
  void changePasswordVisibility() => hidePassword = !hidePassword;

  @action
  Future<void> login() async {
    loading = true;

    await Future.delayed(Duration(seconds: 2));

    email = "";
    password = "";

    loading = false;
    loggedIn = true;
  }

  @action
  void logout() => loggedIn = false;

  // computed => when you process observables, work with their values to create something new

  @computed
  bool get  isEmailValid => RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);

  @computed
  bool get isPasswordValid => password.length > 6;

  @computed
  Function get loginPresssed =>
      (isEmailValid && isPasswordValid && !loading) ? login : null;
}