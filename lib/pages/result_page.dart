import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Result extends StatefulWidget {
  const Result({Key? key}) : super(key: key);
  static const routeName = '/result';


  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildHeader(),

                ],
              ),
            ),
          )),
    );
  }
  Widget _buildHeader() {
    return Center(
      child: Column(
        children: [
          Image.asset(
            'assets/images/vote_hand.png',
            width: 100,
            height: 100,
          ),
          Text(
            'EXIT POLL',
            style: GoogleFonts.fredokaOne(
                fontSize: 20, color: Colors.white.withOpacity(0.8)),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Text(
              'RESULT',
              style: GoogleFonts.kanit(fontSize: 25, color: Colors.white),
            ),
          ),

        ],
      ),
    );
  }
}
