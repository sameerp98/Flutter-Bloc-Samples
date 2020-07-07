import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/authentication_bloc.dart';
import '../bloc/login_bloc.dart';
import '../user_repository.dart';
import '../widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  final UserRepository userRepository;

  LoginScreen({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: BlocProvider(
        create: (context) {
          return LoginBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
            userRepository: userRepository,
          );
        },
        child: LoginForm(),
      ),
    );
  }
}
