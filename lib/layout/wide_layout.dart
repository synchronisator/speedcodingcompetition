import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speedcodingcompetition/provider/loginprovider.dart';
import 'package:speedcodingcompetition/widget/rulelist.dart';

class WideLayout extends StatelessWidget {
  const WideLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Speedcoding Competition'),
        actions: [
          if(context.select((LoginProvider l) => !l.isLoggedIn)) ...[
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: null,
            ),
            IconButton(
              icon: const Icon(Icons.login),
              onPressed: null,
            ),
          ],

          if(context.select((LoginProvider l) => l.isLoggedIn))
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: null,
            ),

          IconButton(
            icon: const Icon(Icons.star),
            onPressed: null,
          ),
        ],
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Center(
                child: Container(
                  constraints: BoxConstraints(minWidth: 0, maxWidth: 500),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: RuleList()),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
