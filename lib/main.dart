import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nine_ja_hotel/core/core_folder/app/app.locator.dart'
    show locator, setupLocator;
import 'package:stacked_services/stacked_services.dart';
import 'core/core_folder/app/app.router.dart';
import 'core/core_folder/manager/shared_preferance.dart';

final navigate = locator<NavigationService>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  setupLocator();
  await locator<SharedPreferencesService>().initilize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),

      debugShowCheckedModeBanner: false,
      initialRoute:
          SharedPreferencesService.instance.isLoggedIn == true
              ? Routes.dashboard
              : Routes.loginScreen,
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}
