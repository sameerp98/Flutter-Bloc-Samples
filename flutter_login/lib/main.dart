import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './bloc/authentication_bloc.dart';
import './screens/home.dart';
import './screens/login.dart';
import './screens/splash.dart';
import './user_repository.dart';
import './widgets/loading_indicator.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final userRepository = UserRepository();
  runApp(
    BlocProvider<AuthenticationBloc>(
      create: (context) {
        return AuthenticationBloc(userRepository: userRepository)
          ..add(AuthenticationStarted());
      },
      child: MyApp(userRepository: userRepository),
    ),
  );
}

class MyApp extends StatelessWidget {
  final UserRepository userRepository;

  MyApp({Key key, @required this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationInitial) {
            return SplashScreen();
          }
          if (state is AuthenticationSuccess) {
            return HomeScreen();
          }
          if (state is AuthenticationFailure) {
            return LoginScreen(userRepository: userRepository);
          }
          if (state is AuthenticationInProgress) {
            return LoadingIndicator();
          }
        },
      ),
    );
  }
}

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    print(event);
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition);
    super.onTransition(bloc, transition);
  }
}
