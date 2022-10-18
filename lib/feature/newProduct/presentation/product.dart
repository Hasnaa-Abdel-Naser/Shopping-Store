import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shopping_apps/Auth/data/productData.dart';
import 'package:shopping_apps/feature/electronPage/presentation/electronicProduct.dart';
import 'package:shopping_apps/feature/newProduct/presentation/imageLoading.dart';

class newProduct extends StatefulWidget {
  final coll;
  static String currentImage = '';
  static String image = '';
  newProduct(this.coll);

  @override
  State<newProduct> createState() => _newProductState();
}

class _newProductState extends State<newProduct> {
  final name = TextEditingController();

  final salary = TextEditingController();

  final count = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEFF1FC),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add Product' ,style: TextStyle(color: Color(0xff0C1139))),
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            children: [
              InkWell(
                onTap: () async{
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => LoadingImage(widget.coll)));
                },
                child: Container(
                  height: 200,
                  width: double.infinity,
                  color: Color(0xffdbdbdb),
                  alignment: Alignment.center,
                  child: (newProduct.currentImage == '')?Text('Click here to add product image'): Image.file(File(newProduct.currentImage)),
                ),
              ),
              SizedBox(height: 40),
              TextField(
                controller: name,
                maxLength: 20,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  label: Text('Product name' , style: TextStyle(color: Colors.grey , fontWeight: FontWeight.bold)),
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: Color(0xff7565bf), width: 1.0 ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                      child:TextField(
                        controller: salary,
                        maxLength: 4,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          counterText: "",
                          label: Text('Salary' , style: TextStyle(color: Colors.grey , fontWeight: FontWeight.bold)),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: Color(0xff7565bf), width: 1.0 ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child:TextField(
                      controller: count,
                      maxLength: 4,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        counterText: "",
                        label: Text('Count' , style: TextStyle(color: Colors.grey , fontWeight: FontWeight.bold)),
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Color(0xff7565bf), width: 1.0 ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),)
                ],
              ),
              SizedBox(height: 50,),
              InkWell(
                onTap:() {
                  if(name.text != '' && salary.text != '' && count.text != '' && newProduct.image != ''){
                    ProductData obj = new ProductData();
                    obj.addNewProduct(widget.coll , name.text, int.parse(salary.text), int.parse(count.text) , newProduct.image);
                    newProduct.image = '' ;
                    newProduct.currentImage = '';
                    Navigator.of(context).pop();
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Complete product data')));
                  }
                },
                child: Container(
                    width: 200,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Color(0xff0C1139),
                        borderRadius: BorderRadius.circular(35)
                    ),
                    child: Text('Save' , style: TextStyle(fontWeight: FontWeight.bold , color: Colors.white , fontSize: 18))
                ),
              ),
            ],
          )
        )
      )
    );
  }
}
