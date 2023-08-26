

import 'package:mvvm_archeitechture/data/network/base_api_services.dart';
import 'package:mvvm_archeitechture/data/network/network_api_services.dart';
import 'package:mvvm_archeitechture/res/app_url.dart';

class AuthRepository {

  BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data)  async {
    
    try {

      dynamic response = await _apiServices.getPostApiResponse(AppUrl.loginUrl, data );
      return response ;
    }catch(e){
      throw e ;
    }
  }

  Future<dynamic> signUpApi(dynamic data)  async {

    try {

      dynamic response = await _apiServices.getPostApiResponse(AppUrl.signUpUrl, data );
      return response ;
    }catch(e){
      throw e ;
    }
  }
}