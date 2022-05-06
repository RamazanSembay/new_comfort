import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:new_comfort/provider/cart_provider.dart';
import 'package:new_comfort/provider/login_provider.dart';
import 'package:new_comfort/views/admin/new_admin_structura.dart';
import 'package:new_comfort/views/home_view.dart';
import 'package:new_comfort/views/welcome_view.dart';
import 'package:provider/provider.dart';
import 'provider/register_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Application());
}

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginProvider>(
          create: (context) => (LoginProvider()),
        ),
        ChangeNotifierProvider<RegisterProvider>(
          create: (context) => (RegisterProvider()),
        ),
        ChangeNotifierProvider<CartProvider>(
          create: (context) => (CartProvider()),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'OpenSans',
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // return HomeView();
              return NewAdminStructura();
            } else {
              return WelcomeView();
            }
          },
        ),
      ),
    );
  }
}
