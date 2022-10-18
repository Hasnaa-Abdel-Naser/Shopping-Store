import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class verificationCode extends StatefulWidget {
  final id , phoneNum;
  verificationCode(this.id , this.phoneNum);
  @override
  State<verificationCode> createState() => _verificationCodeState();
}

class _verificationCodeState extends State<verificationCode> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final num1 = TextEditingController();
  final num2 = TextEditingController();
  final num3 = TextEditingController();
  final num4 = TextEditingController();
  final num5 = TextEditingController();
  final num6 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEFF1FC),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Verification' , style: TextStyle(fontSize: 13 , color: Colors.grey)),
              SizedBox(height: 20),
              Text('We sent you an SMS code' , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 24 , )),
              SizedBox(height: 10),
              Row(
                children: [
                  Text('On number ' , style: TextStyle(fontSize: 13 , color: Colors.grey)),
                  Text('+20 ${widget.phoneNum}' , style: TextStyle(fontSize: 13 , color: Color(0xff808BE4))),
                ],
              ),
              SizedBox(height: 60),
              Row(
                children: [
                  Expanded(
                    child:TextField(
                      controller: num1,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: "6",
                        counterText: "",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Color(0xff7565bf), width: 1.0 ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child:TextField(
                      controller: num2,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: "0",
                        counterText: "",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Color(0xff7565bf), width: 1.0 ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child:TextField(
                      controller: num3,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: "4",
                        counterText: "",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Color(0xff7565bf), width: 1.0 ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child:TextField(
                      controller: num4,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: "0",
                        counterText: "",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Color(0xff7565bf), width: 1.0 ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child:TextField(
                      controller: num5,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: "0",
                        counterText: "",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Color(0xff7565bf), width: 1.0 ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child:TextField(
                      controller: num6,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: "0",
                        counterText: "",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Color(0xff7565bf), width: 1.0 ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 150),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () async{
                      String pin = num1.text + num2.text+ num3.text+ num4.text+ num5.text+ num6.text;
                      PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: widget.id, smsCode: pin);
                      await auth.signInWithCredential(credential);
                      if(auth.currentUser != null){
                        final prefs = await SharedPreferences.getInstance();
                        prefs.setString('valid', 'true');
                        Navigator.pushReplacementNamed(context, '/category');
                      }
                    },
                    child: Container(
                      width: 150,
                      height: 45,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color(0xff0C1139),
                        borderRadius: BorderRadiusDirectional.circular(40),
                      ),
                      child: Text('Containue' , style: TextStyle(color: Colors.white))
                    )
                  ),
                ],
              )
            ],
          )
        )
      )
    );
  }
}
