import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sp_assignment/controllers/post_controller.dart';
import 'package:sp_assignment/models/post.dart';

class HomePage extends StatefulWidget {
  final String email;

  const HomePage({super.key, required this.email});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final PostController postController;
  final RxList<Post> posts = <Post>[].obs;

  @override
  void initState() {
    super.initState();
    postController = PostController();
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    try {
      List<Post> fetchedPosts = await postController.fetchPosts();
      posts.value = fetchedPosts; // Update posts with the fetched data
    } catch (e) {
      // Handle error
      print('Error fetching posts: $e');
    }
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', "");
    await prefs.setString('user_email', "");
    await prefs.setString('user_password', "");
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
            onPressed: () async {
              await logout();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Obx(() {
        if (posts.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              return ListTile(
                title: Text(post.title),
                subtitle: Text(post.body),
              );
            },
          );
        }
      }),
    );
  }
}
