import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:increment_button_app/UserModel.dart';
import 'main.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key,});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
 var count = 0;
 String? username;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:Padding(
        padding:  EdgeInsets.all(w*0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: w*1,
              height: h*0.06,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(w*0.04),
              ),
              child: Center(
                child: Text("$username",style: TextStyle(fontSize: w*0.1,fontWeight: FontWeight.w400)),
              ),
            ),
            Center(
              child: CircleAvatar(
                radius: w*0.5,
                backgroundColor: Colors.white,
                child: Center(
                  child: Text("$count",style: TextStyle(fontSize: w*0.3,fontWeight: FontWeight.w500),),
                ),
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      if(count==0) {
                        count = 0;
                      }else{
                        count=count-1;
                      }
                      setState(() {

                      });
                    },
                    child: CircleAvatar(
                      radius: w*0.1,
                      backgroundColor: Colors.white,
                      child: Center(child: Icon(Icons.arrow_back,size: w*0.2,)),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      count= count+1;
                      setState(() {

                      });
                    },
                    child: CircleAvatar(
                      radius: w*0.1,
                      backgroundColor: Colors.white,
                      child: Center(child: Icon(Icons.add,size: w*0.2,)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ) ,
    );
  }
}
