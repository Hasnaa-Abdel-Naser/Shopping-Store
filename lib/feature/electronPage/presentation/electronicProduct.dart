import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_apps/Auth/data/productData.dart';
import 'package:shopping_apps/feature/Product/moreData.dart';
import 'package:shopping_apps/feature/newProduct/presentation/product.dart';

class Products extends StatefulWidget {
  final categoryType;
  Products(this.categoryType);
  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  final firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffEFF1FC),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text('Products', style: TextStyle(color: Color(0xff0C1139))),
          iconTheme: IconThemeData(color: Color(0xff0C1139)),
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Color(0xff0C1139),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => newProduct(widget.categoryType)));
            },
            child: Icon(Icons.add, size: 25)),
        body: Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: loader(context)));
  }
  Widget loader(BuildContext context) {
    CollectionReference collection =
        firestore.collection('${widget.categoryType}');
    return StreamBuilder<QuerySnapshot>(
        stream: collection.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Connection Error', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Text('Waiting...', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)));
          }
          if(snapshot.data!.docs.length == 0){
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/empty-box.png'),
                  Text('No Products' , style: TextStyle(fontWeight: FontWeight.w600 , fontSize: 20 , color: Colors.blueAccent)),
                  SizedBox(height: 200)
                ],
              )
            );
          }
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> data = snapshot.data!.docs[index].data() as Map<String, dynamic>;
                String docId = snapshot.data!.docs[index].id;
                return Container(
                    height: 200,
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.only(bottom: 10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadiusDirectional.circular(20),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Name  :  ${data['name']}'),
                                SizedBox(height: 10),
                                Text('Salary :  \$ ${data['salary']}'),
                                SizedBox(height: 10),
                                Text('Count  :  ${data['count']}')
                              ],
                            ),
                            (data['photo'] == null)
                                ? Image.asset('assets/gadgets.png', width: 90)
                                : Container(width: 120, height: 110, child: Image.network(data['photo'], fit: BoxFit.fill)),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Divider(color: Colors.black38),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                                onTap: () async{
                                  ProductData p = ProductData();
                                  await collection.doc(docId).delete();
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Success Delete')));
                                },
                                child: Icon(Icons.delete, color: Colors.redAccent)
                            ),
                            Text('|', style: TextStyle(fontSize: 20, color: Colors.black38)),
                            InkWell(
                              onTap:(){
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => MoreData(data['photo'], data['name'], data['salary'], data['count'])));
                              },
                                child: Text('More details' , style: TextStyle(fontWeight: FontWeight.w600 , color: Color(0xff8c91c1))))
                          ],
                        )
                      ],
                    ));
              });
        });
  }
}
