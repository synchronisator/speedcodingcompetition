import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speedcodingcompetition/provider/loginprovider.dart';
import 'package:speedcodingcompetition/widget/rulelist.dart';

class NarrowLayout extends StatelessWidget {
  const NarrowLayout({Key? key}) : super(key: key);

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
          const VerticalDivider(),
          Builder(
            builder: (context) =>
                IconButton(
                  icon: const Icon(Icons.keyboard),
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                  tooltip: MaterialLocalizations
                      .of(context)
                      .openAppDrawerTooltip,
                ),
          ),
        ],
      ),
      drawer: Drawer(
        child: SafeArea(child: Text("Drawer")),
      ),
      endDrawer: const Drawer(
        child: SafeArea(child: Text("Enddrawer")),
      ),
      body: Center(
        child: Row(
          children: [
            const Expanded(
              child: RuleList(),
            ),
          ],
        ),
      ),
    );
  }
}
