import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:pokedex_test/controllers/all_pokemon_controller.dart';
import 'package:pokedex_test/pages/pokemon/pokemon_detail.dart';

import '../../utils/app_colors.dart';
import '../../utils/dimensions.dart';


class PokemonMainPage extends StatelessWidget {
  const PokemonMainPage({super.key});

  @override
  Widget build(BuildContext context) {

    SchedulerBinding.instance.addPostFrameCallback((_) async{
      _loadResources();
    });

    return Scaffold(
      body: GetBuilder<AllPokemonPageController>(builder: (controller){
        return controller.results.isNotEmpty ?
            ListView.builder(
                itemCount: controller.results.length,
                itemBuilder: (context,index){
                  return PokemonDetail(name: controller.results[index].name!,urlPokemonData: controller.results[index].url!);
                }
            )
            :
          Container(
            alignment: Alignment.center,
            height: Dimensions.screenHeight * 0.75,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                CircularProgressIndicator(backgroundColor: Colors.white,color: AppColors.appBlue,),
                SizedBox(height: Dimensions.height20,),
                Text("Cargando pokemons, por favor espere...")
              ],
            ),
          );
      }),
    );
  }

  Future<void> _loadResources() async{
    await Get.find<AllPokemonPageController>().getAllPokemon();
  }


}

