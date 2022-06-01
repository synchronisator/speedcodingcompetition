import 'package:flutter/material.dart';
import 'package:speedcodingcompetition/data/competition.dart';
import 'package:speedcodingcompetition/data/player.dart';
import 'package:speedcodingcompetition/data/rule.dart';
import 'package:uuid/uuid.dart';

class DataProvider extends ChangeNotifier {
  List<Rule> rules = [];
  List<Player> player = [];
  List<Competition> competition = [];

  DataProvider(){
    initFakeData();
  }

  void initFakeData() {
    Uuid uuid = const Uuid();
    rules.add(Rule(uuid.v4(), "Test Coverage von 80 %", description: "Lerne Tests zu schreiben"));
    rules.add(Rule(uuid.v4(), "Theme switcher", description: ""));
    rules.add(Rule(uuid.v4(), "Maximal 4 Farben", description: ""));
    rules.add(Rule(uuid.v4(), "Mindestens zweisprachig", description: ""));
    rules.add(Rule(uuid.v4(), "Keine build mit mehr als 4 Widgets", description: ""));
    rules.add(Rule(uuid.v4(), "just one page", description: "One Widget no methods (nur override)"));
    rules.add(Rule(uuid.v4(), "Stateless only", description: ""));
    rules.add(Rule(uuid.v4(), "CustomPaint transition", description: ""));
    rules.add(Rule(uuid.v4(), "No column", description: ""));
    rules.add(Rule(uuid.v4(), "No row", description: ""));
    rules.add(Rule(uuid.v4(), "no packages", description: "no more packages than 'flutter create' adds"));
    rules.add(Rule(uuid.v4(), "Animationen mit mind 5 teilschritten", description: ""));
    rules.add(Rule(uuid.v4(), "Stinger-Transition zwischen den pages", description: ""));
    rules.add(Rule(uuid.v4(), "Supabaseanbindung", description: ""));
    rules.add(Rule(uuid.v4(), "Virtuellen würfel", description: ""));
    rules.add(Rule(uuid.v4(), "Notification", description: ""));
    rules.add(Rule(uuid.v4(), "Gravitation", description: ""));
    rules.add(Rule(uuid.v4(), "Healthbar", description: ""));
    rules.add(Rule(uuid.v4(), "Licht/Schatten (bewegt)", description: ""));
    rules.add(Rule(uuid.v4(), "Sprites", description: ""));
    rules.add(Rule(uuid.v4(), "Timer", description: ""));
    rules.add(Rule(uuid.v4(), "Collectables", description: ""));
    rules.add(Rule(uuid.v4(), "Hidden Feature", description: ""));

    player.add(Player(uuid.v4(), "Hans", "der Glückliche", []));
    player.add(Player(uuid.v4(), "Marie", "die Strahlende", []));
    player.add(Player(uuid.v4(), "Theresa", "die Barmherzige", []));
    player.add(Player(uuid.v4(), "Synchron", "der Bekloppte", []));

    competition.add(Competition(uuid.v4(), rules.where((element) => !element.text.contains("i")).toList(), [] , {} , DateTime.now(), DateTime.now().add(const Duration(days: 2))));

  }

}
