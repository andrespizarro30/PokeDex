import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:pokedex_test/utils/dimensions.dart';

import '../../controllers/all_pokemon_controller.dart';
import '../../models/pokemon_model.dart';
import '../../routes/route_helper.dart';

class PokemonDetail extends StatefulWidget {

  final String name;
  final String urlPokemonData;

  PokemonDetail({required this.name, required this.urlPokemonData});

  @override
  State<PokemonDetail> createState() => _PokemonDetailState(name: name);
}

class _PokemonDetailState extends State<PokemonDetail> {

  final String name;

  _PokemonDetailState({required this.name});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadResources();
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GetBuilder<AllPokemonPageController>(builder: (controller){
        return controller.pokemonData.containsKey(name)  ?
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              controller.pokemonData[name]!.name!,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blueAccent, Colors.lightBlueAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Get.toNamed(RouteHelper.getARPokemon());
                      },
                      child: CachedNetworkImage(
                        imageUrl: controller.pokemonData[name]!.sprites!.other!.home!.frontDefault!,
                        placeholder: (context, url) => CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        height: 200,
                        width: 200,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'ID: ${controller.pokemonData[name]!.id}',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Types: ${controller.pokemonData[name]!.types!.map((e){
                        return e.type!.name!;
                      })}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: Dimensions.height15,),
                    GestureDetector(
                      onTap: () async{
                        String urlCry = controller.pokemonData[name]!.cries!.latest!;
                        AudioPlayer audioPlayer = AudioPlayer();
                        await audioPlayer.play(UrlSource(urlCry));
                      },
                      child: Icon(Icons.play_arrow),
                    )
                  ],
                ),
              ),
            ),
          ],
        ):
        Text("Loading...");
      }),
    );
  }

  Future<void> _loadResources() async{
    String url = widget.urlPokemonData.replaceAll("https://pokeapi.co/api/v2", "");
    //url = "/pokemon/25";
    await Get.find<AllPokemonPageController>().getPokemonData(url);
  }
}