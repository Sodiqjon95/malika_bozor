import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:malika_bozor/presentation/auth/auth_page.dart';
import 'package:malika_bozor/presentation/hame_page.dart';
import 'package:malika_bozor/presentation/router.dart';
import 'package:malika_bozor/utils/constants.dart';
import 'package:malika_bozor/view_models/auth_view_model.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthViewModel>(
          create: (_) => AuthViewModel(auth: FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthViewModel>().authState(),
          initialData: null,
        ),
        StreamProvider(
          create: (context) => context.read<AuthViewModel>().userInfoChanges,
          initialData: null,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: MyRouter.generateRoute,
        initialRoute: mainPage,
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    if (firebaseUser != null) {
      return const HomePage();
    }
    return const AuthPage();
  }
}
