import 'package:flutter/material.dart';
import 'package:shawarmaversion2/firebase_options.dart';
import 'package:shawarmaversion2/screens/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shawarmaversion2/screens/profile.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class Auth {
  final FirebaseAuth auth = FirebaseAuth.instance;
  User? get currentUser => auth.currentUser;
  Stream<User?> get authStateChanges => auth.authStateChanges();
  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    await auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signOut() async {
    await auth.signOut();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/products': (context) => ProductDetailsWidget(),
        '/profile': (context) => const Profile(),
        // ... other routes
      },
      debugShowCheckedModeBanner: false,
      title: "SHAWARMA",
      // Theme
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 137, 58, 34),
        buttonTheme: ButtonThemeData(
          colorScheme: ColorScheme.light(
            background: Color.fromARGB(255, 233, 136, 97),
          ),
          //textTheme: ButtonTextTheme.primary,
        ),
      ),
      //darkTheme: ThemeData.dark(),
      home: LoginPage(),
    );
  }
}
