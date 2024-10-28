import 'package:submission_idcamp2024/model/player.dart';
import 'package:submission_idcamp2024/model/staff.dart';

class Squad {
  String name;
  List<OfficialStaff>? staff;
  List<Player>? player;

  Squad ({
    required this.name,
    this.staff,
    this.player
  });
}

var squadList = [
  Squad(
    name: "Senior Putra", 
    staff: staffList, 
    player: playerList),
  Squad(
    name: "Senior Putri",
  ),
  Squad(
    name: "U-23 Putra",
  ),
  Squad(
    name: "U-19 Putra",
  ),
  Squad(
    name: "U-16 Putra",
  ),
  Squad(
    name: "U-18 Putri",
  ),
];
