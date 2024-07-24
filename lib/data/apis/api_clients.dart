
import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService{

  final String appBaseUrl;

  ApiClient({required this.appBaseUrl}){
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 30);
  }

  Future<Response> getData(String uri) async{

    try{
      Response response = await get(uri);
      return response;
    }catch(e){
      return Response(statusCode: 1, statusText: e.toString());
    }

  }

  Future<Response> getDataWithQuery(String uri, dynamic query) async{

    try{
      Response response = await get(uri,query: query);
      return response;
    }catch(e){
      return Response(statusCode: 1, statusText: e.toString());
    }

  }

}