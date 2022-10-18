import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_apps/feature/userNumber/presentation/verificationCode.dart';

class userPhoneNumber extends StatelessWidget {
  final phonenum = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEFF1FC),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome' , style: TextStyle(fontSize: 13 , color: Colors.grey)),
              SizedBox(height: 20),
              Text('Enter your mobile number' , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 24 , )),
              SizedBox(height: 10),
              Text('Please confirm your country code and' , style: TextStyle(fontSize: 13 , color: Colors.grey)),
              Text('enter your phone number' , style: TextStyle(fontSize: 13 , color: Colors.grey)),
              SizedBox(height: 70),
              Container(
                height: 55,
                padding: EdgeInsets.only(left: 10 , right: 10),
                decoration: BoxDecoration(
                  border: Border.all(width: 1 , color: Colors.grey),
                  borderRadius: BorderRadiusDirectional.circular(10),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 30,
                      child: Image.asset('assets/egypt.png')
                    ),
                    SizedBox(width: 10),
                    Text('|' , style: TextStyle(fontSize: 35 , color: Colors.grey)),
                    SizedBox(width: 10),
                    Expanded(
                        child: TextField(
                          controller: phonenum,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              border: InputBorder.none ,
                              hintText: "Phone number",
                          ),
                        )
                    )
                  ],
                )
              ),
              SizedBox(height: 80),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: () async{
                          if(phonenum.text == ""){
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Complete Data')));
                          }else{
                            await FirebaseAuth.instance.verifyPhoneNumber(
                              phoneNumber: "+2"+ phonenum.text,
                              verificationCompleted: (PhoneAuthCredential credential) {},
                              verificationFailed: (FirebaseAuthException e) {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${e.code}')));
                              },
                              codeSent: (String verificationId, int? resendToken) {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(builder: (context)=> verificationCode(verificationId , phonenum.text))
                                );
                              },
                              codeAutoRetrievalTimeout: (String verificationId) {},
                            );
                          }
                        },
                          child: Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Color(0xff0C1139),
                                borderRadius: BorderRadiusDirectional.circular(40),
                              ),
                              child: Icon(Icons.arrow_forward_ios_rounded , size: 25 , color: Colors.white))
                      ),
                      SizedBox(height: 6),
                      Text('Next' , style: TextStyle(color: Color(0xff0C1139)))
                    ],
                  ),
                ],
              )
            ]
          )
        )
      )
    );
  }
}
