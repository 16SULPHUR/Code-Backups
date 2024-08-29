import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_application_2/port.dart';

class ApiService {

  final String baseUrl = "https://jsonplaceholder.typicode.com";

  Future<List<Post>> fetchPosts() async{
    final response = await http.get(Uri.parse('$baseUrl/posts'));

    if(response.statusCode == 200){
      List jsonResponse = json.decode(response.body);
      print(jsonResponse);
    }else{
      throw Exception('Failed to load posts');
    }


  }
}