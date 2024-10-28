class Match {
  String teamACode;
  String teamBCode;
  DateTime matchDateTime;
  String venue;
  String matchType;
  String? finalScoreA;
  String? finalScoreB;

  Match ({
    required this.teamACode,
    required this.teamBCode,
    required this.matchDateTime,
    required this.venue,
    required this.matchType,
    this.finalScoreA,
    this.finalScoreB,
  });

}

List<Match> getLatestMatches() {
  return matchList
  .where((match) => match.finalScoreA != null && match.finalScoreB != null)
  .toList().reversed.take(5).toList();
}

var matchList = [
  Match(
    teamACode: "CHN", 
    teamBCode: "IDN", 
    matchDateTime: DateTime.utc(2024,10,15,00,00,00), 
    venue: "Qingdao Youth Stadium", 
    matchType: "FIFA World Cup 26 Asian Qualifier Round 3",
    finalScoreA: "2",
    finalScoreB: "1",
  ),

  Match(
    teamACode: "IDN", 
    teamBCode: "JPN", 
    matchDateTime: DateTime.utc(2024,11,17,12,01,00), 
    venue: "Gelora Bung Karno Stadium", 
    matchType: "FIFA World Cup 26 Asian Qualifier Round 3",
  ),

  Match(
    teamACode: "IDN", 
    teamBCode: "KSA", 
    matchDateTime: DateTime.utc(2024,11,21,12,00,00), 
    venue: "Gelora Bung Karno Stadium", 
    matchType: "FIFA World Cup 26 Asian Qualifier Round 3",
  ),

  Match(
    teamACode: "AUS", 
    teamBCode: "IDN", 
    matchDateTime: DateTime.utc(2024,10,15,12,00,00), 
    venue: "TBA", 
    matchType: "FIFA World Cup 26 Asian Qualifier Round 3",
  ),

  Match(
    teamACode: "IDN", 
    teamBCode: "BHR", 
    matchDateTime: DateTime.utc(2024,11,17,12,00,00), 
    venue: "Gelora Bung Karno Stadium", 
    matchType: "FIFA World Cup 26 Asian Qualifier Round 3",
  ),

  Match(
    teamACode: "IDN", 
    teamBCode: "CHN", 
    matchDateTime: DateTime.utc(2024,11,21,12,00,00), 
    venue: "Gelora Bung Karno Stadium", 
    matchType: "FIFA World Cup 26 Asian Qualifier Round 3",
  ),
  Match(
    teamACode: "JPN", 
    teamBCode: "IDN", 
    matchDateTime: DateTime.utc(2024,11,21,12,00,00), 
    venue: "Saitama 2OO2 Stadium", 
    matchType: "FIFA World Cup 26 Asian Qualifier Round 3",
  ),
];