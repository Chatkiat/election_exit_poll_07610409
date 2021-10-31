class Candidate{
  final int number;
  final String displayName;
  //final int score;


  Candidate({
    required this.number,
    required this.displayName,
   // required this.score,

  });

  factory Candidate.fromJson(Map<String, dynamic> json) {
    return Candidate(
      number: json['number'],
      displayName: json['displayName']
     // score: json['score'],

    );
  }

  Candidate.fromJson2(Map<String, dynamic> json)
      : number = json['number'],
        displayName = json['displayName'];
       // score = json['score'];


  @override
  String toString() {
    return '$number: $displayName ';
  }
}

