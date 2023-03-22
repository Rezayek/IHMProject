
import 'package:coffeeihmproject/routers/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


Future main() async {
  await dotenv.load(fileName: "assets/.env"); // mergeWith optional, you can include Platform.environment for Mobile/Desktop app

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
    final AppRouter _router = AppRouter();
  static bool isHome = false;
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CoffeeApp',
      onGenerateRoute: _router.onGenerateRoute,
    );
  }
}
