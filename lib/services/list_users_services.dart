import 'package:dio/dio.dart';
import 'package:module3_layout_and_navigation/model/list_users_model.dart';

class ListUsersService {
  Dio dio = Dio();
  Future<List<ListUsersModel>?> getDataUsers() async {
    String url = "https://reqres.in/api/users?page=2";
    final Response response;
    try {
      response = await dio.get(
        url,
      );
      // print(response.data);
      if (response.statusCode == 200) {
        var json = response.data;
        //boleh dipakai sesuai kondisi data json
        if (json is Map && json.keys.contains('data')) {
          var data = json['data'];
          if (data is List) {
            return data
                .map<ListUsersModel>((u) => ListUsersModel.fromJson(u))
                .toList();
          }
        }
      }
      return null;
    } on DioError catch (error, stacktrace) {
      print('Exception occured: $error stackTrace: $stacktrace');
      throw Exception(error.response);
    }
  }

  postLogin(String username, String password) async {
    String url = 'https://reqres.in/api/users';
    final Response response;
    FormData formData = FormData.fromMap({"name": username, "job": password});
    try {
      // dio.options.headers['Authentication']
      response = await dio.post(url, data: formData);
      print(response.data);
    } catch (e) {}
  }
}
