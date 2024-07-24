import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/all_pokemon_controller.dart';
import 'di/dependencies.dart' as dep;
import 'routes/route_helper.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await dep.init();

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AllPokemonPageController>(builder: (_){
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RouteHelper.getHome(),
        getPages: RouteHelper.routes,
      );
    });
  }
}
