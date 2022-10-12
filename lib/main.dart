import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';
import 'src/config/routes/app_routes.dart';
import 'src/config/themes/app_theme.dart';
import 'src/core/utils/constants.dart';
import 'src/core/utils/enums.dart';
import 'src/injector.dart';
import 'src/presentation/blocs/app/app_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initializeDependencies();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppBloc>(
          create: (context) => injector(),
        ),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      title: kMaterialAppTitle,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.onGenerateRoutes,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      builder: (context, child) {
        return BlocListener<AppBloc, AppState>(
          listenWhen: (previous, current) => previous != current,
          listener: (context, state) {
            switch (state.status) {
              case AppStatus.authenticated:
                _navigator.pushNamedAndRemoveUntil(kRouteHome, (route) => false);
                break;
              case AppStatus.unauthenticated:
                _navigator.pushNamedAndRemoveUntil(kRouteLogin, (route) => false);
                break;
            }
          },
          child: child,
        );
      },
    );
  }
}
