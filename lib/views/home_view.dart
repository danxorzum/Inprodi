import 'package:flutter/material.dart';
import 'package:inprodi/providers/user_provider.dart';

import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:inprodi/providers/clients_provider.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'VezaBela',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[100],
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    'Inicio',
                    style: TextStyle(
                        color: Colors.grey[100], fontWeight: FontWeight.w400),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.search,
                        size: 32,
                        color: Colors.grey[100],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.account_circle_outlined,
                        size: 35,
                        color: Colors.grey[100],
                      )
                    ],
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              backgroundColor: theme.primaryColor,
              child: Icon(Icons.calendar_today),
            ),
            body: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 40),
                  height: 110,
                  child: _WelcomeText(theme: theme),
                ),
                Expanded(
                  child: _List(theme: theme),
                ),
              ],
            ),
            bottomNavigationBar: _BottomBar(theme: theme)));
  }
}

class _WelcomeText extends StatefulWidget {
  const _WelcomeText({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final ThemeData theme;

  @override
  __WelcomeTextState createState() => __WelcomeTextState();
}

class __WelcomeTextState extends State<_WelcomeText> {
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700]),
          children: [
            TextSpan(
                text: 'Hola',
                style:
                    TextStyle(fontSize: 20, color: widget.theme.primaryColor)),
            TextSpan(text: ', ${context.read<UserProvider>().user?.name}!'),
          ]),
    );
  }
}

class _BottomBar extends StatelessWidget {
  const _BottomBar({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      currentIndex: 0,
      onTap: (_) {},
      items: [
        BottomNavigationBarItem(
          icon: FaIcon(
            FontAwesomeIcons.home,
            color: theme.primaryColor,
          ),
          label: 'home',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(
            FontAwesomeIcons.compass,
            color: theme.primaryColor,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(
            FontAwesomeIcons.heart,
            color: theme.primaryColor,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(
            FontAwesomeIcons.commentDots,
            color: theme.primaryColor,
          ),
          label: '',
        ),
      ],
    );
  }
}

class _List extends StatefulWidget {
  const _List({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final ThemeData theme;

  @override
  __ListState createState() => __ListState();
}

class __ListState extends State<_List> {
  final _ctrl = ScrollController();
  @override
  void initState() {
    context.read<ClientsProvider>().getClients();
    _ctrl.addListener(() {
      if (_ctrl.position.atEdge) {
        if (_ctrl.position.pixels == 0) {
        } else {
          Provider.of<ClientsProvider>(context, listen: false).getClients();
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final clients = context.watch<ClientsProvider>().clients;

    return ListView.builder(
        controller: _ctrl,
        itemBuilder: (_, i) => ListTile(
            leading: Image(
              image: AssetImage('assets/lococo.png'),
            ),
            title: Text(
              clients[i].name,
              style: TextStyle(
                  color: widget.theme.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
            subtitle: Text(
              clients[i].email,
              style: TextStyle(color: Colors.black45),
            ),
            trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_vert,
                  color: widget.theme.primaryColor,
                ))),
        itemCount: clients.length);
  }
}
