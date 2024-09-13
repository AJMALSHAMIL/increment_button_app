import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:increment_button_app/IncrementPage.dart';
import 'package:increment_button_app/SignInPage.dart';

import 'main.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {

  TextEditingController namecontroller =TextEditingController();
  TextEditingController emailcontroller =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Login Page",style: TextStyle(fontSize: w*0.1,fontWeight: FontWeight.w700,color: Colors.white),),
      ),
        body: Padding(
          padding:  EdgeInsets.all(w*0.03),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: w*0.4,),
                TextFormField(
                    controller: namecontroller,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(w * 0.05),
                          borderSide:
                          BorderSide(color: Colors.black),
                        ),
                        hintText: "  username",
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400))),
                SizedBox(height: w*0.2,),
                TextFormField(
                    controller: emailcontroller,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(w * 0.05),
                          borderSide:
                          BorderSide(color: Colors.red),
                        ),
                        hintText: "  email",
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400))),
            
                SizedBox(height: w*0.4,),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
                  },
                  child: Container(
                    width: w*0.6,
                    height: h*0.07,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(w*0.05)
                    ),
                    child: Center(
                      child: Text("Login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: w*0.06),),
                    ),
                  ),
                ),
                SizedBox(height: w*0.04,),
                InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Signinpage(),));
                    },
                    child: Text("Sign In",style: TextStyle(color: Colors.red,fontWeight: FontWeight.w700,fontSize: w*0.06),)),

              ],
            ),
          ),
        ),
    );
  }
}
