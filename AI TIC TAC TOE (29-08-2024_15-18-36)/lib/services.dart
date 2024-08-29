import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:loginpage/post.dart';

class ApiService {

  final String baseUrl = "https://jsonplaceholder.typicode.com";

  Future<List<Post>> fetchPosts() async{
    final response = await http.get(Uri.parse('$baseUrl/posts'));

    if(response.statusCode == 200){
      List jsonResponse = json.decode(response.body);
      print(jsonResponse);
      return jsonResponse.map((post)=>Post.fromJson(post)).toList();
    }else{
      throw Exception('Failed to load posts');
    }


  }
}