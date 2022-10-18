import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_apps/feature/electronPage/presentation/electronicProduct.dart';
import '../data/categories.dart';

class Category extends StatelessWidget {
  Categories obj = new Categories();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEFF1FC),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10 , left: 25 , right: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Categories' ,style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold )),
            SizedBox(height: 20),
            Expanded(
                child: ListView.builder(
                  itemCount: obj.dataOfCategory.length,
                  itemBuilder: (context , index){
                    return Container(
                      padding: EdgeInsets.all(25),
                      margin: EdgeInsets.only(bottom: 20),
                      height: 180 ,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: obj.dataOfCategory[index]['backColor'],
                        borderRadius: BorderRadiusDirectional.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('${obj.dataOfCategory[index]['name']}' , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.w500)),
                              InkWell(
                                  onTap: (){
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context)=> Products(obj.dataOfCategory[index]['coll']))
                                    );
                                  },
                                  child: Container(
                                      width: 110,
                                      height: 35,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Color(0xff0C1139),
                                        borderRadius: BorderRadiusDirectional.circular(40),
                                      ),
                                      child: Text('See Products' , style: TextStyle(color: Colors.white))
                                  )
                              ),
                            ],
                          ),
                         Image.asset('${obj.dataOfCategory[index]['image']}' , height: 100)
                        ],
                      )
                    );
                  },
                )
            )
          ],
        )
      )
    );
  }
}
