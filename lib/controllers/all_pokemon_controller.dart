
import 'package:get/get.dart';
import 'package:pokedex_test/data/repositories/all_pokemon_repo.dart';
import 'package:pokedex_test/models/pokemon_model.dart';

import 'package:pokedex_test/pages/pokemon/pokemon_detail.dart';

import '../models/all_pokemons.dart';

class AllPokemonPageController extends GetxController{

  final AllPokemonsRepository allPokemonsRepository;

  List<Results> _results = [];
  List<Results> get results => _results;

  Map<String,PokemonData> _pokemonData = Map();
  Map<String,PokemonData> get pokemonData => _pokemonData;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  AllPokemonPageController({
    required this.allPokemonsRepository
  });

  Future<void> getAllPokemon()async{
    Response response = await allPokemonsRepository.getAllPokemon();
    if(response.statusCode == 200){
      _results=[];
      _results.addAll(AllPokemons.fromJson(response.body).results);

      _isLoaded = true;
      update();
    }else{

    }
  }

  Future<void> getPokemonData(String url)async{
    Response response = await allPokemonsRepository.getPokemonData(url);
    if(response.statusCode == 200){

      PokemonData pokeData = PokemonData.fromJson(response.body);

      if(!pokemonData.containsKey(pokeData.name)){
        pokemonData.putIfAbsent(pokeData!.name!, (){
          return pokeData;
        });
      }else{
        pokemonData.update(pokeData!.name!, (value){
          return pokeData;
        });
      }

      _isLoaded = true;
      update();
    }else{

    }
  }


}