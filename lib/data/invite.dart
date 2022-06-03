import 'package:speedcodingcompetition/data/player.dart';

class Invite {
  String uuid;
  String name;
  String mail;
  Player? player;

  Invite(this.uuid, this.name, this.mail);
}
