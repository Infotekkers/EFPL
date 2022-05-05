import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text("Auth Screen"),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              width: 100,
              color: Colors.blue,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/home");
                },
                child: const Text(
                  "Login",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
