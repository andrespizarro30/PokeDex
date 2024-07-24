import 'package:get/get.dart';
import 'package:pokedex_test/pages/pokemon/pokemon_list.dart';
import 'package:pokedex_test/pages/pokemon_map/ar_image_page.dart';

class RouteHelper{

  static const String splash = "/splash";
  static const String home = "/home";
  static const String arpage = "/arpage";

  static String getSplash()=>'$splash';
  static String getHome()=>'$home';
  static String getARPokemon()=>'$arpage';


  static List<GetPage> routes =[
    GetPage(name: home, page: ()=>PokemonMainPage()),
    GetPage(name: arpage, page: ()=>ARImagePage())
  ];
}