import 'package:flutter/material.dart';
import 'package:submission_idcamp2024/globals.dart';
import 'package:submission_idcamp2024/model/squad.dart';
import 'package:submission_idcamp2024/squad_detail_page.dart';

class SquadPage extends StatelessWidget{
  const SquadPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            backgroundColor: primary,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              color: iconDark,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text("Squad", 
            style: TextStyle(
              color: textDark,
              fontWeight: FontWeight.w600,
            ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return SquadList(
                  squad: squadList[index],
                );
              },
              childCount: squadList.length,
            ),
          ),

        ],
      ),
    );
  }
}

class SquadList extends StatelessWidget {
  final Squad squad;

  const SquadList({Key? key, required this.squad}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isEmptySquad = (squad.staff == null || squad.staff!.isEmpty) && (squad.player == null || squad.player!. isEmpty);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Container(
              height: 121,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: isEmptySquad 
                  ? [Colors.grey, Colors.grey[600]!]
                  : [ primary, const Color(0xFFC70000),],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight, 
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            Positioned(
              child: Container(),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                squad.name,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                  color: textDark,
                ),
              ),
            ),
          ],
        ),
        onTap: () {
          isEmptySquad
          ? null
          : Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
            return SquadDetailPage(squad: squad);
          }));
        },
      ),
    );
  }
}