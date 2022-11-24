import 'package:flutter_demo/features/auth/login/login_initial_params.dart';

/// Model used by presenter, contains fields that are relevant to presenters and implements ViewModel to expose data to view (page)
class LoginPresentationModel implements LoginViewModel {
  /// Creates the initial state
  LoginPresentationModel.initial(
    // ignore: avoid_unused_constructor_parameters
    LoginInitialParams initialParams,
  )   : _username = '',
        _password = '';

  /// Used for the copyWith method
  LoginPresentationModel._({
    required String username,
    required String password,
  })  : _username = username,
        _password = password;

  final String _username;
  final String _password;

  @override
  String get username => _username;

  @override
  String get password => _password;

  @override
  bool get isLoginEnabled => username.isNotEmpty && password.isNotEmpty;

  LoginPresentationModel copyWith({
    bool? isLoginEnabled,
    String? username,
    String? password,
  }) {
    return LoginPresentationModel._(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }
}

/// Interface to expose fields used by the view (page).
abstract class LoginViewModel {
  bool get isLoginEnabled;

  String get username;

  String get password;
}
