import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);
  @override
  State<Loading> createState() => _LoadingState();
}
class _LoadingState extends State<Loading> {
  check() async{
    final prefs = await SharedPreferences.getInstance();
    String valid =  prefs.getString('valid') ?? '';
    if(valid == 'true'){
      Navigator.pushReplacementNamed(context, '/category');
    }else{
      Navigator.pushReplacementNamed(context, '/login');
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check();
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
