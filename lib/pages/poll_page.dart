import 'package:election_exit_poll_07610409/candidate/candidate_page.dart';
import 'package:election_exit_poll_07610409/service/api.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Poll extends StatefulWidget {
  static const routeName = '/poll';
  const Poll({Key? key}) : super(key: key);

  @override
  _PollState createState() => _PollState();
}

class _PollState extends State<Poll> {

   List<Candidate>? _candidate;
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
                  _buildMainContent(),
                  _buildButton(),
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
              'เลือกตั้ง อบต.',
              style: GoogleFonts.kanit(fontSize: 25, color: Colors.white),
            ),
          ),
          Center(
            child: Text(
                'รายชื่่อผู้สมัครรับเลือกตั้ง\nนายกองค์การบริหารส่วนตำบลเขาพระ\nอำเภอเมืองนครนายก จังหวัดนครนายก',
                style:
                    GoogleFonts.fredokaOne(fontSize: 15, color: Colors.white),
                textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }

  Widget _buildMainContent() {
    return _candidate == null
        ? SizedBox.shrink()
        : Container(
      child: ListView.builder(
        padding: EdgeInsets.all(8.0),
        itemCount: _candidate!.length,
        itemBuilder: (BuildContext context, int index) {
          var candidate = _candidate![index];

          return Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            margin: EdgeInsets.all(8.0),
            elevation: 5.0,
            shadowColor: Colors.black.withOpacity(0.2),
            child: InkWell(

              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                candidate.number.toString(),
                                style: GoogleFonts.kanit(fontSize: 20.0),
                              ),
                              Text(
                                '${candidate.displayName}',
                                style: GoogleFonts.kanit(
                                    fontSize: 20.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildButton() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/result');
            },
            style: ElevatedButton.styleFrom(primary: Colors.purple,),
            child: Text('ดูผล',style: GoogleFonts.kanit(fontSize: 15),),
          ),
        ],
      ),
    );
  }

  Future<List<Candidate>> _loadCandidate() async {
    List list = await Api().fetch('exit_poll');
    //แปลง map เป็น object ของ food item
    var candidate = list.map((item) => Candidate.fromJson(item)).toList();
    //print(candidate[0].number);
    return candidate;
  }

  @override
  //เอาไว้ทำงานแค่ครั้งเดียว
  void initState() {
    super.initState();
    _loadCandidate().then((list) {
      _candidate = list;
    });
  }
}
