import 'package:flutter/material.dart';
import 'package:insights_news/news_view%20(1).dart';

class login extends StatelessWidget {
  const login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                  height: 20,
                ),
                TextFormField(
                  style: TextStyle(
                      color: const Color.fromARGB(255, 255, 255, 255)),
                  decoration: InputDecoration(
                      prefixIconColor: Colors.amber,
                      icon: const Icon(Icons.person),
                      iconColor: const Color.fromARGB(255, 255, 255, 255),
                      hintText: 'Enter your Password',
                      hintStyle: const TextStyle(color: Colors.white),
                      labelText: 'Password',
                      labelStyle: const TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => NewsView()));
                    },
                    child: const Text(
                      'Dont have account?Sign up',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.normal),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
