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
//         primarySwatch: Colors.blue,
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
//       ),
//       body: FutureBuilder<List<Post>>(
//         future: futurePosts,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             List<Post>? posts = snapshot.data;
//             return ListView.builder(
//               itemCount: posts?.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(posts![index].title),
//                   subtitle: Text(posts[index].body),
//                   onTap: () {
//                     // Handle tap on a post (view details, edit, delete, etc.)
//                   },
//                 );
//               },
//             );
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           }
//           return const Center(child: CircularProgressIndicator());
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Handle create new post
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:http_request_demo/API_SERVICES/services.dart';
// import 'package:http_request_demo/Model/product.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Product Store',
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
//       home: ProductScreen(),
//     );
//   }
// }

// class ProductScreen extends StatefulWidget {
//   @override
//   _ProductScreenState createState() => _ProductScreenState();
// }

// class _ProductScreenState extends State<ProductScreen> {
//   late ApiService apiService;
//   late Future<List<Product>> futureProducts;

//   @override
//   void initState() {
//     super.initState();
//     apiService = ApiService();
//     futureProducts = apiService.fetchProducts();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Product Store'),
//         centerTitle: true,
//       ),
//       body: FutureBuilder<List<Product>>(
//         future: futureProducts,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             List<Product>? products = snapshot.data;
//             return ListView.builder(
//               itemCount: products?.length,
//               itemBuilder: (context, index) {
//                 return Card(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(15.0),
//                   ),
//                   color: Colors.grey[900],
//                   child: ListTile(
//                     leading: Image.network(products![index].image, width: 50, height: 50, fit: BoxFit.cover),
//                     title: Text(
//                       products[index].title,
//                       style: TextStyle(
//                         color: Colors.blueAccent,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     subtitle: Text(
//                       '\$${products[index].price.toString()}',
//                       style: TextStyle(
//                         color: Colors.grey[500],
//                       ),
//                     ),
//                     onTap: () {
//                       // Handle tap on a product (view details, add to cart, etc.)
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
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Handle add new product
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:http_request_demo/API_SERVICES/services.dart';
import 'package:http_request_demo/Model/coffee.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Store',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.brown,
        scaffoldBackgroundColor: Colors.black,
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.brown,
        ),
      ),
      home: CoffeeScreen(),
    );
  }
}

class CoffeeScreen extends StatefulWidget {
  @override
  _CoffeeScreenState createState() => _CoffeeScreenState();
}

class _CoffeeScreenState extends State<CoffeeScreen> {
  late ApiService apiService;
  late Future<List<Coffee>> futureCoffees;

  @override
  void initState() {
    super.initState();
    apiService = ApiService();
    futureCoffees = apiService.fetchCoffees();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coffee Store'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Coffee>>(
        future: futureCoffees,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Coffee>? coffees = snapshot.data;
            return ListView.builder(
              itemCount: coffees?.length,
              itemBuilder: (context, index) {
                return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Colors.grey[900],
                    child: ListTile(
                      leading: coffees![index].image.isNotEmpty && coffees![index].image != " "
                          ? Image.network(
                              coffees[index].image,
                              // width: 70,
                              // height: 100,
                              // fit: BoxFit.none,
                            )
                          : Image.network(
                              "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c5/Roasted_coffee_beans.jpg/220px-Roasted_coffee_beans.jpg",
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),                           
                      title: Text(
                        coffees![index].title,
                        style: TextStyle(
                          color: Colors.brown[200],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        coffees[index].description,
                        style: TextStyle(
                          color: Colors.grey[500],
                        ),
                      ),
                      onTap: () {
                      },
                    ));
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: TextStyle(color: Colors.redAccent),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      )
    );
  }
}
