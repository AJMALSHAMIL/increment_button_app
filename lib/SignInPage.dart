import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:increment_button_app/LoginPage.dart';

import 'IncrementPage.dart';
import 'UserModel.dart';
import 'main.dart';

class Signinpage extends StatefulWidget {
  const Signinpage({super.key});

  @override
  State<Signinpage> createState() => _SigninpageState();
}

class _SigninpageState extends State<Signinpage> {

  TextEditingController namecontroller =TextEditingController();
  TextEditingController emailcontroller =TextEditingController();

  String? username;

  userSignUpMethod({required UserModel newUser}) {
      FirebaseFirestore.instance.collection('users').doc(newUser.username).set(newUser.toJson());
  }

  Incrementfunction({required UserModel incremodel}) async {
    DocumentSnapshot Username= await FirebaseFirestore.instance.collection('users').doc(incremodel.id).get();
    username = Username['username'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Sign In Page",style: TextStyle(fontSize: w*0.1,fontWeight: FontWeight.w700,color: Colors.white),),
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
                  userSignUpMethod(newUser: UserModel(username: namecontroller.text, countNumber: 0, email: emailcontroller.text, id: ''));
                  if(namecontroller != null && emailcontroller != null) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage(),), (
                        route) => false,);
                  }
                },
                child: Container(
                  width: w*0.6,
                  height: h*0.07,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(w*0.05)
                  ),
                  child: Center(
                    child: Text("Sign In",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: w*0.06),),
                  ),
                ),
              ),
              SizedBox(height: w*0.04,),
              InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Loginpage(),));
                  },
                  child: Text("Login",style: TextStyle(color: Colors.red,fontWeight: FontWeight.w700,fontSize: w*0.06),)),

            ],
          ),
        ),
      ),
    );
  }
}
