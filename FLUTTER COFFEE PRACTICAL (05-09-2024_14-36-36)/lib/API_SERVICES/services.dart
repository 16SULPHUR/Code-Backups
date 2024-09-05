// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:http_request_demo/Model/post.dart';
// // Ensure you import your Post model class

// class ApiService {
//   final String baseUrl = "https://jsonplaceholder.typicode.com";

//   Future<List<Post>> fetchPosts() async {
//     final response = await http.get(Uri.parse('$baseUrl/posts'));

//     if (response.statusCode == 200) {
//       List jsonResponse = json.decode(response.body);
//       return jsonResponse.map((post) => Post.fromJson(post)).toList();
//     } else {
//       throw Exception('Failed to load posts');
//     }
//   }

//   Future<Post> createPost(Post post) async {
//     final response = await http.post(
//       Uri.parse('$baseUrl/posts'),
//       headers: {"Content-Type": "application/json"},
//       body: json.encode(post.toJson()),
//     );

//     if (response.statusCode == 201) {
//       return Post.fromJson(json.decode(response.body));
//     } else {
//       throw Exception('Failed to create post');
//     }
//   }

//   Future<Post> updatePost(int id, Post post) async {
//     final response = await http.put(
//       Uri.parse('$baseUrl/posts/$id'),
//       headers: {"Content-Type": "application/json"},
//       body: json.encode(post.toJson()),
//     );

//     if (response.statusCode == 200) {
//       return Post.fromJson(json.decode(response.body));
//     } else {
//       throw Exception('Failed to update post');
//     }
//   }

//   Future<void> deletePost(int id) async {
//     final response = await http.delete(Uri.parse('$baseUrl/posts/$id'));

//     if (response.statusCode != 200) {
//       throw Exception('Failed to delete post');
//     }
//   }
// }



// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import 'package:http_request_demo/Model/product.dart';

// class ApiService {
//   final String apiUrl = "https://fakestoreapi.com/products";

//   Future<List<Product>> fetchProducts() async {
//     final response = await http.get(Uri.parse(apiUrl));

//     if (response.statusCode == 200) {
//       List<dynamic> body = jsonDecode(response.body);
//       List<Product> products = body.map((dynamic item) => Product.fromJson(item)).toList();
//       return products;
//     } else {
//       throw Exception('Failed to load products');
//     }
//   }
// }


import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:http_request_demo/Model/coffee.dart';

class ApiService {
  final String apiUrl = "https://api.sampleapis.com/coffee/hot";

  Future<List<Coffee>> fetchCoffees() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Coffee> coffees = body.map((dynamic item) => Coffee.fromJson(item)).toList();
      return coffees;
    } else {
      throw Exception('Failed to load coffee data');
    }
  }
}



