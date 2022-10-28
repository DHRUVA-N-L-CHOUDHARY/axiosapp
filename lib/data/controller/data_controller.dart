// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ml_linking/data/models/user_model_list.dart';

class DataController extends GetxController {

  User_Model_List? user_list;
  var isDataLoading = false.obs;
  getUserInformationFromApi() async {
  http.Response response = await http.get(Uri.tryParse('https://dummyapi.io/data/v1/user?limit=10')!,
        headers: {'app-id': '635b68b64ddd6747238c854a'});
  
   if(response.statusCode == 200)
   {
    /// data successfully
    var result = jsonDecode(response.body);
    user_list = User_Model_List.fromJson(result);
    
   }
   else
   {
    ///error
   }
  }
}
