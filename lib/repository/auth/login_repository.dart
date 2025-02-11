import 'package:cleancode/data/network/network_api_services.dart';
import 'package:cleancode/model/user_model/user_model.dart';

import '../../config/app/app_urls.dart';

class LoginRepository {
  final _api = NetworkApiServices();

  Future<UserModel?> login(dynamic data) async{
      final response = await _api.postData(AppUrls.baseUrl, data);
      return UserModel.fromJson(response);
  }
}