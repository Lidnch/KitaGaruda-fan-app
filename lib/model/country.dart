class Country {
  String name;
  String countryCode;
  String flagUrl;

  Country({
    required this.name,
    required this.countryCode,
    required this.flagUrl,
  });
}

var countryList = [
  Country(
    name: "Indonesia", 
    countryCode: "IDN", 
    flagUrl: "https://api.fifa.com/api/v3/picture/flags-sq-2/IDN"
  ),
  Country(
    name: "Tiongkok", 
    countryCode: "CHN", 
    flagUrl: "https://api.fifa.com/api/v3/picture/flags-sq-2/CHN"
  ),
  Country(
    name: "Jepang", 
    countryCode: "JPN", 
    flagUrl: "https://api.fifa.com/api/v3/picture/flags-sq-2/JPN"
  ),
  Country(
    name: "Arab Saudi", 
    countryCode: "KSA", 
    flagUrl: "https://api.fifa.com/api/v3/picture/flags-sq-2/KSA"
  ),
  Country(
    name: "Australia", 
    countryCode: "AUS", 
    flagUrl: "https://api.fifa.com/api/v3/picture/flags-sq-2/AUS"
  ),
  Country(
    name: "Bahrain", 
    countryCode: "BHR", 
    flagUrl: "https://api.fifa.com/api/v3/picture/flags-sq-2/BHR"
  ),
];