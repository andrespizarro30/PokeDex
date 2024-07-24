

import 'package:get/get.dart';
import 'package:pokedex_test/controllers/all_pokemon_controller.dart';
import 'package:pokedex_test/data/repositories/all_pokemon_repo.dart';

import '../data/apis/api_clients.dart';
import '../utils/app_constants.dart';

Future<void> init() async{

  //api client
  Get.lazyPut(()=>ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //repos
  Get.lazyPut(() => AllPokemonsRepository(apiClient: Get.find()));

  //controllers
  Get.lazyPut(() => AllPokemonPageController(allPokemonsRepository: Get.find()));


}