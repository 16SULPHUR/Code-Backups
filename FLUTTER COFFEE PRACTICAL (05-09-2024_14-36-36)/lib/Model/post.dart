// import 'package:flutter/material.dart';
// import 'package:http_request_demo/API_SERVICES/services.dart';
// import 'package:http_request_demo/Model/post.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'HTTP Request Demo',
//       theme: ThemeData(
//         brightness: Brightness.dark,
//         primarySwatch: Colors.blue,
//         scaffoldBackgroundColor: Colors.black,
//         textTheme: TextTheme(
//           bodyMedium: TextStyle(color: Colors.white),
//         ),
//         appBarTheme: AppBarTheme(
//           backgroundColor: Colors.black,
//           elevation: 0,
//         ),
//         floatingActionButtonTheme: FloatingActionButtonThemeData(
//           backgroundColor: Colors.blueAccent,
//         ),
//       ),
//       home: PostScreen(),
//     );
//   }
// }

// class PostScreen extends StatefulWidget {
//   @override
//   _PostScreenState createState() => _PostScreenState();
// }

// class _PostScreenState extends State<PostScreen> {
//   late ApiService apiService;
//   late Future<List<Post>> futurePosts;

//   @override
//   void initState() {
//     super.initState();
//     apiService = ApiService();
//     futurePosts = apiService.fetchPosts();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('HTTP Request Demo'),
//         centerTitle: true,
//       ),
//       body: FutureBuilder<List<Post>>(
//         future: futurePosts,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             List<Post>? posts = snapshot.data;
//             return ListView.builder(
//               itemCount: posts?.length,
//               itemBuilder: (context, index) {
//                 return Card(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(15.0),
//                   ),
//                   color: Colors.grey[900],
//                   child: ListTile(
//                     title: Text(
//                       posts![index].title,
//                       style: TextStyle(
//                         color: Colors.blueAccent,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     subtitle: Text(
//                       posts[index].body,
//                       style: TextStyle(
//                         color: Colors.grey[500],
//                       ),
//                     ),
//                     onTap: () {
//                       // Handle tap on a post (view details, edit, delete, etc.)
//                     },
//                   ),
//                 );
//               },
//             );
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text(
//                 'Error: ${snapshot.error}',
//                 style: TextStyle(color: Colors.redAccent),
//               ),
//             );
//           }
//           return const Center(child: CircularProgressIndicator());
//         },
//       )
//     );
//   }
// }

// class Post {
//   final int id;
//   final String title;
//   final String body;

//   Post({required this.id, required this.title, required this.body});

//   factory Post.fromJson(Map<String, dynamic> json) {
//     return Post(
//       id: json['id'],
//       title: json['title'],
//       body: json['body'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'title': title,
//       'body': body,
//     };
//   }
// }
