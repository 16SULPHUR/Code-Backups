import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/post.dart';

class PostController extends GetxController {
  final String baseUrl = "https://jsonplaceholder.typicode.com";

  // Method to fetch posts from API
  Future<List<Post>> fetchPosts() async {
    final response = await http.get(Uri.parse('$baseUrl/posts'));

    if (response.statusCode == 200) {
      // Decode the JSON response
      List<dynamic> data = json.decode(response.body);

      // Convert JSON data to List<Post>
      return data.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }

  // Method to fetch a single post by ID
  Future<Post> fetchPostById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/posts/$id'));

    if (response.statusCode == 200) {
      // Decode the JSON response
      Map<String, dynamic> data = json.decode(response.body);

      // Convert JSON data to Post
      return Post.fromJson(data);
    } else {
      throw Exception('Failed to load post');
    }
  }
}
