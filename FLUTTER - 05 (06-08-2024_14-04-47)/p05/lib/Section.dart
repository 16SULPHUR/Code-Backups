import 'package:flutter/material.dart';
import 'package:p05/ProfileCard.dart';

class Section extends StatelessWidget {
  const Section({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(padding: EdgeInsets.all(20),
      child: Column(children: [
        ProfileCard(name: "Ayaan Shaikh",number: "202203103510203",imageUrl: "https://png.pngtree.com/png-vector/20190710/ourlarge/pngtree-business-user-profile-vector-png-image_1541960.jpg",hobbies: ['reading','coding','photography'],),
        SizedBox(height: 10,),
        ProfileCard(name: "Meet Vora",number: "202203103510405",imageUrl: "https://png.pngtree.com/png-vector/20190629/ourlarge/pngtree-business-people-avatar-icon-user-profile-free-vector-png-image_1527664.jpg",hobbies: ['reading','coding'],),
         SizedBox(height: 10,),
        ProfileCard(name: "Ankit Patil",number: "202203103510124",imageUrl: "https://tse2.explicit.bing.net/th?id=OIP.ng7S3pPZ1KTTjWkJ9RWLYQHaHn&pid=Api&P=0&h=220",hobbies: ['reading','coding'],),
         SizedBox(height: 10,),
        ProfileCard(name: "Anish Sharma",number: "202203103510042",imageUrl: "https://thumbs.dreamstime.com/b/businessman-profile-icon-male-portrait-flat-design-vector-illustration-47075259.jpg",hobbies: ['reading','coding'],),
      ],),),
    );
  }
}