import 'package:flutter/material.dart';
import 'package:submission_idcamp2024/globals.dart';
import 'package:submission_idcamp2024/model/player.dart';
import 'package:submission_idcamp2024/model/squad.dart';
import 'package:submission_idcamp2024/model/staff.dart';

class SquadDetailPage extends StatelessWidget {
  final Squad squad;

  const SquadDetailPage({Key? key, required this.squad}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: primary,
            floating: true,
            pinned: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              color: iconDark,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
              squad.name,
              style: TextStyle(
                color: textDark,
              ),
            ),
          ),
          if (squad.staff != null && squad.staff!.isNotEmpty) ...[
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 8.0, top: 16.0),
                child: Text("Official Staffs", style: sectionTitleTextStyle,),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  final staff = squad.staff![index];
                  return SquadStaffs(staff: staff);
                },
                childCount: squad.staff!.length,
              ),
            ),
          ],
          if (squad.player != null && squad.player!.isNotEmpty) ...[
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 8.0, top: 16.0),
                child: Text("Players", style: sectionTitleTextStyle,),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  final player = squad.player![index];
                  return SquadPlayers(player: player);
                },
                childCount: squad.player!.length,
              ),
            ),
          ]
        ],
      ),
    );
  }
}

class SquadStaffs extends StatelessWidget {
  final OfficialStaff staff;

  const SquadStaffs({Key? key, required this.staff}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Container(
              height: 120,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [primary, const Color(0xFFC70000)],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        staff.name,
                        style: headingTextStyle,
                      ),
                      Text(
                        "Kebangsaan: ${staff.nationality}",
                        style: detailsTextStyle,
                      ),
                      Text(
                        "Umur: ${staff.age}",
                        style: detailsTextStyle,
                      ),
                      Text(
                        "Peran: ${staff.role}",
                        style: detailsTextStyle,
                      ),
                      Text(
                        "Tim: ${staff.team}",
                        style: detailsTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SquadPlayers extends StatelessWidget {
  final Player player;

  const SquadPlayers({Key? key, required this.player}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24.0),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Container(
              height: 120,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [primary, const Color(0xFFC70000)],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      player.imageProfile,
                      height: 100,
                      width: 75,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 16,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        player.name,
                        style: headingTextStyle,
                      ),
                      Text(
                        "Umur: ${player.age}",
                        style: detailsTextStyle,
                      ),
                      Text(
                        "Posisi: ${player.role}",
                        style: detailsTextStyle,
                      ),
                      Text(
                        "Klub: ${player.club}",
                        style: detailsTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}