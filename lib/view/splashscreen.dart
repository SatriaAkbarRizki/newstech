import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:newstech/view/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 4),
      () => Navigator.pushReplacementNamed(context, HomePage.homeRoute),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sizeDevice = MediaQuery.of(context).size;
    return Scaffold(
      body: Animate(
        effects: [FadeEffect(duration: 1000.ms, delay: 350.ms)],
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'News',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'TitleCroiss',
                    fontSize: 26),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                height: 30,
                width: 80,
                decoration: BoxDecoration(color: Colors.black),
                child: Center(
                  child: Text(
                    'TECH',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'ArchiveBlack',
                        color: Colors.white),
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
