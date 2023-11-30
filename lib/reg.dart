import 'dart:math';

import 'package:flutter/material.dart';

class reg extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(body: 
    Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo.png',
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                  prefixIconColor: Colors.amber,
                  icon: const Icon(Icons.person),
                  iconColor: const Color.fromARGB(255, 255, 255, 255),
                  hintText: 'Enter your username',
                  hintStyle: const TextStyle(color: Colors.white),
                  labelText: 'Username',
                  labelStyle: const TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                  prefixIconColor: Colors.amber,
                  icon: const Icon(Icons.email),
                  iconColor: const Color.fromARGB(255, 255, 255, 255),
                  hintText: 'Enter your Email',
                  hintStyle: const TextStyle(color: Colors.white),
                  labelText: 'Email',
                  labelStyle: const TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(
              height: 10,
            ),
             TextFormField(
              decoration: InputDecoration(
                  prefixIconColor: Colors.amber,
                  icon: const Icon(Icons.phone),
                  iconColor: const Color.fromARGB(255, 255, 255, 255),
                  hintText: 'Enter your Phone',
                  hintStyle: const TextStyle(color: Colors.white),
                  labelText: 'Phone',
                  labelStyle: const TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
             const SizedBox(
              height: 10,
            ), TextFormField(
              decoration: InputDecoration(
                  prefixIconColor: Colors.amber,
                  icon: const Icon(Icons.home),
                  iconColor: const Color.fromARGB(255, 255, 255, 255),
                  hintText: 'Enter your Address',
                  hintStyle: const TextStyle(color: Colors.white),
                  labelText: 'Address',
                  labelStyle: const TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
             const SizedBox(
              height: 10,
            ), TextFormField(
              decoration: InputDecoration(
                  prefixIconColor: Colors.amber,
                  icon: const Icon(Icons.key),
                  iconColor: const Color.fromARGB(255, 255, 255, 255),
                  hintText: 'Enter your Password',
                  hintStyle: const TextStyle(color: Colors.white),
                  labelText: 'Password',
                  labelStyle: const TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Sign up',
                  style: TextStyle(color: Colors.white,),
                )),
            ]    )
          )
 ]   )
    );
  }



}