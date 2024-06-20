import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:messenger/router.dart';
import 'package:messenger/theme.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  GoRouter appRouter = router;
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    appRouter.refresh();
  });

  runApp(MyApp(
    router: appRouter,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.router});
  final GoRouter router;
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Messenger',
      theme: ThemeData(
        useMaterial3: true,
        dividerColor: CustomColors.stroke,
        scaffoldBackgroundColor: Colors.white,
      ),
      routerConfig: router,
    );
  }
}
