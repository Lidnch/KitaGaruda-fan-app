import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:submission_idcamp2024/globals.dart';
import 'package:submission_idcamp2024/model/country.dart';
import 'package:submission_idcamp2024/model/match.dart';
import 'package:submission_idcamp2024/squad_list_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: primary,
            leading: IconButton(
              icon: Icon(Icons.menu),
              color: secondary,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SquadPage();
                }));
              },
            ),
            expandedHeight: 300,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  Image.asset("images/hero-1.jpg", fit: BoxFit.cover),
                  Positioned(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                        colors: [
                          primary,
                          const Color.fromRGBO(126, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              title: Image.asset(
                "images/kita-garuda.png", 
                height: 35,
              ),
              centerTitle: true,
              expandedTitleScale: 3,
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'UPCOMING MATCH', 
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index){
                return UpcomingMatch(
                  match: matchList[index],
                );
              },
              childCount: 3,
            )
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'LATEST MATCH', 
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index){
                return LatestMatch(
                  match: matchList[index],
                );
              },
              childCount: 3,
            )
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'GALLERY', 
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 210,
              child: CarouselView(
                itemExtent: MediaQuery.sizeOf(context).width-32,
                shrinkExtent: 50,
                itemSnapping: true,
                children: List.generate(10, (int index) {
                  return Container(
                    color: const Color.fromRGBO(126, 0, 0, 1),
                    child: Image.network(
                      'https://picsum.photos/400?random=$index',
                      fit: BoxFit.cover,
                    ),
                  );
                }),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: InkWell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(28),
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              primary,
                              const Color(0xFFc70000)
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.topRight,
                          ),
                        ),
                      ),
                      Positioned(
                        right: -32,
                        child: ShaderMask(
                          shaderCallback: (rect) {
                            return const LinearGradient(
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                              colors: [Colors.black, Colors.transparent]
                            ).createShader(Rect.fromLTRB(0, 0, rect.width-100, rect.height));
                          },
                          blendMode: BlendMode.dstIn,
                          child: Image.asset('images/meet-squad.png', height: 200, fit: BoxFit.contain,)
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                            "Meet \n the Squad",
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: textDark,
                            ),
                          ),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                  return const SquadPage();
                }));
              },
            ),
          ),
        ],
      ),
    );

  }
}

class UpcomingMatch extends StatelessWidget {
  final Match match;

  const UpcomingMatch({Key? key, required this.match}) : super(key: key);

  Country getCountryByCode(String countryCode){
    return countryList.firstWhere((country) => country.countryCode == countryCode);
  }

  @override
  Widget build(BuildContext context) {
    final teamA = getCountryByCode(match.teamACode);
    final teamB = getCountryByCode(match.teamBCode);

    return Card(
      margin: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 20.0, right: 20.0),
      shadowColor: primary,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // Baris 1: matchType
                Text(
                  match.matchType,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 6),
            
                // Baris 2: teamA flag, teamA code, "-", teamB code, teamB flag
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Image.network(teamA.flagUrl, width: 30, height: 20),
                        const SizedBox(width: 8),
                        Text(
                          teamA.countryCode, 
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                      ],
                    ),
                    const Text("-"),
                    Row(
                      children: [
                        Text(
                          teamB.countryCode,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                        ),
                        const SizedBox(width: 8),
                        Image.network(teamB.flagUrl, width: 30, height: 20),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8),
            
                // Baris 3: venue
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.location_on, size: 16, color: Colors.grey),
                    const SizedBox(width: 5),
                    Text(match.venue),
                  ],
                ),
                const SizedBox(height: 8),
            
                // Baris 4: tanggal dan waktu pertandingan
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                    const SizedBox(width: 5),
                    Text(
                      DateFormat('EEEE, dd MMMM yyyy','en_US').format(match.matchDateTime),
                    ),
                    const SizedBox(width: 5),
                    const Icon(Icons.access_time_outlined, size: 16, color: Colors.grey),
                    const SizedBox(width: 5),
                    Text(
                      DateFormat('KK:mm').format(match.matchDateTime),
                    ),
                  ],
                ),
              ],
            ),
            const BookmarkButton(),
          ],
        ),
      ),
    );
  }
}

class LatestMatch extends StatelessWidget {
  final Match match;

  const LatestMatch({Key? key, required this.match}) : super(key: key);

  Country getCountryByCode(String countryCode) {
    return countryList.firstWhere((country) => country.countryCode == countryCode);
  }

  @override
  Widget build(BuildContext context) {
    final teamA = getCountryByCode(match.teamACode);
    final teamB = getCountryByCode(match.teamBCode);

    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Baris 1: matchType
            Text(
              match.matchType,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 6),
        
            // Baris 2: teamA flag, teamA code, "-", teamB code, teamB flag
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Image.network(teamA.flagUrl, width: 30, height: 20),
                    const SizedBox(width: 8),
                    Text(
                      teamA.countryCode, 
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                  ],
                ),
                Row(
                  children: [
                    Text("-")
                  ],
                ),
                Row(
                  children: [
                    Text(
                      teamB.countryCode,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                    ),
                    const SizedBox(width: 8),
                    Image.network(teamB.flagUrl, width: 30, height: 20),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
        
            // Baris 3: venue
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.location_on, size: 16, color: Colors.grey),
                const SizedBox(width: 5),
                Text(match.venue),
              ],
            ),
            const SizedBox(height: 8),
        
            // Baris 4: tanggal dan waktu pertandingan
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                const SizedBox(width: 5),
                Text(
                  DateFormat('EEEE, dd MMMM yyyy','en_US').format(match.matchDateTime),
                ),
                const SizedBox(width: 5),
                const Icon(Icons.access_time_outlined, size: 16, color: Colors.grey),
                const SizedBox(width: 5),
                Text(
                  DateFormat('KK:mm').format(match.matchDateTime),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }  
}

class BookmarkButton extends StatefulWidget {
  const BookmarkButton({Key? key}) : super(key: key);

  @override
  State<BookmarkButton> createState() => _BookmarkButtonState();
}

class _BookmarkButtonState extends State<BookmarkButton> {
  bool isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){
        setState(() {
          isBookmarked = !isBookmarked;
        });
        if(isBookmarked){
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content:Text("Bookmarked this match"),
              behavior:SnackBarBehavior.floating,
              showCloseIcon: true,
            )
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content:Text("Match has been removed from bookmark"),
              behavior:SnackBarBehavior.floating,
              showCloseIcon: true,
            )
          );
        }
      }, 
      icon: Icon(
        isBookmarked ? Icons.bookmark : Icons.bookmark_border,
        color: primary,
      ),
    );
  }
}