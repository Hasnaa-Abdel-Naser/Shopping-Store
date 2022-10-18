import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shopping_apps/feature/newProduct/presentation/product.dart';

import '../../../Auth/data/productData.dart';

class LoadingImage extends StatefulWidget {
  String coll;
  LoadingImage(this.coll);
  @override
  State<LoadingImage> createState() => _LoadingState();
}
class _LoadingState extends State<LoadingImage> {
  loadImage()async{
    ProductData p = ProductData();
    newProduct.image = await p.uploadImage(widget.coll);
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => newProduct(widget.coll)));
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadImage();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff0C1139),
        body:Center(
          child: SpinKitWave(
            color: Colors.white,
            size: 40,
          ),
        )
    );
  }
}
