import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speedcodingcompetition/data/invite.dart';
import 'package:speedcodingcompetition/provider/dataprovider.dart';

class InviteList extends StatelessWidget {
  const InviteList({
    Key? key,
  }) : super(key: key);

  showInviteDialog(BuildContext context) {
    //TODO
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: context.watch<DataProvider>().invitesForCompetition.length + 1,
      itemBuilder: (context, index) {
        if (index ==
            context.read<DataProvider>().invitesForCompetition.length) {
          return Center(
              child: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () => showInviteDialog(context)));
        }
        Invite invite =
            context.read<DataProvider>().invitesForCompetition[index];
        return Card(
          child: ListTile(
            title: Text(invite.name),
            subtitle: Text(invite.mail),
            trailing: IconButton(
              onPressed: () => context.read<DataProvider>().removeInvite(index),
              icon: const Icon(Icons.delete),
            ),
          ),
        );
      },
    );
  }
}
