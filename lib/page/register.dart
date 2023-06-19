import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:projec_combilenation/page/login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _ctrlfname = TextEditingController();
  TextEditingController _ctrllname = TextEditingController();
  TextEditingController _ctrlphone = TextEditingController();
  TextEditingController _ctrlpassword = TextEditingController();

  final formKey = GlobalKey<FormState>();

  doRegister() {
    if (formKey.currentState!.validate()) {
      try {
        showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text("You create an account already !"),
                  content: Text("You finished to create account !! Let's go login"),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        _ctrlfname.clear();
                        _ctrllname.clear();
                        _ctrlphone.clear();
                        _ctrlpassword.clear();
                      },
                      child: Container(
                        color: Colors.white,
                        padding: const EdgeInsets.all(14),
                        child: Text("okay"),
                      ),
                    ),
                  ],
                ));
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                "Cretae An Account ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4C53A5),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black45,
                        blurRadius: 10,
                        spreadRadius: 1,
                      ),
                    ]),
                child: Center(
                  child: TextFormField(
                      controller: _ctrlfname,
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return "fist name is require";
                        }
                        return null;
                      }),
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "fist name",
                          hintStyle: const TextStyle(fontSize: 18),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Color(0xFF4C53A5),
                          ))),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black45,
                        blurRadius: 10,
                        spreadRadius: 1,
                      ),
                    ]),
                child: Center(
                  child: TextFormField(
                      controller: _ctrllname,
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return "last name is require";
                        }
                        return null;
                      }),
                      // validator: ((value) {
                      //   if (value!.isEmpty) {
                      //     return "Email is require";
                      //   } else if (value.contains("@gamil.com")) {
                      //     return "You have to use @gmail.com";
                      //   }
                      //   return null;
                      // }),
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "last name",
                          hintStyle: const TextStyle(fontSize: 18),
                          prefixIcon: Icon(
                            Icons.person_add,
                            color: Color(0xFF4C53A5),
                          ))),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black45,
                        blurRadius: 10,
                        spreadRadius: 1,
                      ),
                    ]),
                child: Center(
                  child: TextFormField(
                      controller: _ctrlphone,
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return "phone is require";
                        }
                        return null;
                      }),
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "phone",
                          hintStyle: const TextStyle(fontSize: 18),
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Color(0xFF4C53A5),
                          ))),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black45,
                        blurRadius: 10,
                        spreadRadius: 1,
                      ),
                    ]),
                child: Center(
                  child: TextFormField(
                      obscureText: true,
                      controller: _ctrlpassword,
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return "password is require";
                        }
                        return null;
                      }),
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Password",
                          hintStyle: const TextStyle(fontSize: 18),
                          prefixIcon: Icon(
                            Icons.security,
                            color: Color(0xFF4C53A5),
                          ))),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  doRegister();
                },
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color(0xFF4C53A5),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
