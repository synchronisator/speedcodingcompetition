import 'package:speedcodingcompetition/data/gitrepo.dart';
import 'package:speedcodingcompetition/data/player.dart';
import 'package:speedcodingcompetition/data/rule.dart';

class Competition {
  String uuid;
  String text;
  List<Rule> rules = [];
  List<Player> player = [];
  Map<Player, GitRepo> userRepos = {};
  DateTime startTime;
  DateTime deadline;

  Competition(this.uuid, this.text, this.rules, this.player, this.userRepos,
      this.startTime, this.deadline);
}