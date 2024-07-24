
import 'package:get/get.dart';

import '../../utils/app_constants.dart';
import '../apis/api_clients.dart';

class AllPokemonsRepository extends GetxService{

  final ApiClient apiClient;

  AllPokemonsRepository({required this.apiClient});

  Future<Response> getAllPokemon() async {

    return await apiClient.getData(AppConstants.ALL_POKEMON);

  }

  Future<Response> getPokemonData(String url) async {

    return await apiClient.getData(url);

  }



}