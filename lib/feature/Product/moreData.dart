import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MoreData extends StatelessWidget {
  final image, name, salary, count;

  MoreData(this.image, this.name, this.salary, this.count);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffEFF1FC),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xff0C1139)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              child: Image.network(image , fit: BoxFit.fill)
            ),
            Text('Name     ${name}', style: TextStyle(color: Color(0xff0C1139) , fontSize: 20)),
            Row(
              children: [
                Text('Rate      ', style: TextStyle(color: Color(0xff0C1139) , fontSize: 20)),
                Icon(Icons.star_rounded , color: Colors.yellow , size: 30),
                Icon(Icons.star_rounded , color: Colors.yellow , size: 30),
                Icon(Icons.star_rounded , color: Colors.yellow , size: 30),
                Icon(Icons.star_rounded , color: Colors.yellow , size: 30),
              ],
            ),
            Text('Salary     ${salary} \$', style: TextStyle(color: Color(0xff0C1139), fontSize: 20)),
            Text('Count     ${count}  product', style: TextStyle(color: Color(0xff0C1139), fontSize: 20)),
            Row(
              children: [
                Text('Colors    ', style: TextStyle(color: Color(0xff0C1139) , fontSize: 20)),
                Icon(Icons.circle , color: Colors.red , size: 25),
                Icon(Icons.circle , color: Colors.teal , size: 25),
                Icon(Icons.circle , color: Colors.lightBlueAccent , size: 25),
                Icon(Icons.circle , color: Colors.orangeAccent , size: 25),
              ],
            ),
          ],
        ),
      )
    );
  }
}
