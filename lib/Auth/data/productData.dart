
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:shopping_apps/feature/newProduct/presentation/product.dart';


class ProductData{

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Reference storage = FirebaseStorage.instance.ref();
  addNewProduct(String coll , String name , int salary , int count , imageUrl){
    firestore.collection('${coll}').add(
      {
        'name': name,
        'salary': salary,
        'count': count,
        'photo': imageUrl
      }
    );
  }
  uploadImage(String coll) async{
    ImagePicker image_picker = ImagePicker();
    XFile? image = await image_picker.pickImage(source: ImageSource.gallery);
    if(image != null){
      newProduct.currentImage = image.path;
      Reference imageName = storage.child('${coll}').child(p.basename(image.path));
      await imageName.putFile(File(image.path));
      String imageUrl = await imageName.getDownloadURL();
      return imageUrl;
    }else{
      return '';
    }
  }

}