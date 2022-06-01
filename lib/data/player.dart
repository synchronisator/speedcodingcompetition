import 'package:speedcodingcompetition/data/gitrepo.dart';

class Player {
  String uuid;
  String name;
  String description;
  List<GitRepo> gitrepoUuids;

  Player(this.uuid, this.name, this.description, this.gitrepoUuids);
}
