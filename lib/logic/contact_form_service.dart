import 'package:dio/dio.dart';

class ContactFormService{
  static var apiUrl = 'https://api.byteplex.info/api/test/contact/';
  Dio dio = Dio();  

  Future<bool> submitForm({
    required String name,
    required String email,
    required String message,
  }) async {
    var formData = {
      'name': name,
      'email': email,
      'message': message,
    };
    try{
      var response = await dio.post(apiUrl, data: formData);
      return response.statusCode == 201;
    }catch(e){
      return false;
    }

  }
}