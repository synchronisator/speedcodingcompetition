import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:speedcodingcompetition/dialogs/all_competitions_dialog.dart';
import 'package:speedcodingcompetition/dialogs/all_rules_dialog.dart';
import 'package:speedcodingcompetition/dialogs/new_rule_dialog.dart';
import 'package:speedcodingcompetition/dialogs/start_competition_dialog.dart';

class UIConst {
  static final formatDate = DateFormat('dd.MM.yyyy HH:mm');
  static const defaultTextStyle = TextStyle(color: Colors.black, fontSize: 25);

  static showCompetitionsDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) {
          return const AllCompetitionsDialog();
        });
  }

  static showAllRulesDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) {
          return const AllRulesDialog();
        });
  }

  static showNewRuleDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) {
          return const NewRuleDialog();
        });
  }

  static showStartCompetitionDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) {
          return const StartCompetitionDialog();
        });
  }
}
