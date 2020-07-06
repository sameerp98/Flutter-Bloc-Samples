import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './post_bloc.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition);
    super.onTransition(bloc, transition);
  }
}
