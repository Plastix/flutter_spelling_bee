import 'package:flutter/material.dart';
// import 'package:page_transition/page_transition.dart';

import 'package:spelling_bee/helpers/ui.dart';
// import 'package:spelling_bee/helpers/logic.dart';
// import 'package:spelling_bee/states/answer.dart';
import 'package:spelling_bee/pages/game.dart';
import 'package:spelling_bee/pages/rules.dart';
import 'package:spelling_bee/helpers/assets.dart';

class MainMenu extends StatefulWidget {
  // final Widget child;

  MainMenu({Key key}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  // Future<List<String>> _gameFuture;

  void initState() {
    super.initState();
    // _gameFuture = Assets.getGame();
  }

  @override
  Widget build(BuildContext context) {
    Assets.removeGame();

    return FutureBuilder(
        future: Assets.getGame(),
        builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) =>
            snapshot.hasData ? _build(context, snapshot.data) : CircularProgressIndicator());
  }

  Widget _build(BuildContext context, List<String> l) {
    void push(w) => Navigator.push(context, buildPageTransition(scaffold(w)));

    void rules() => push(Rules());
    void newGame() => push(Game(resume: false));
    void resumeGame() => push(Game(resume: true));

    List widgetList = <Widget>[
      _button("Rules", rules),
      _button("New game", newGame),
      _button("Resume game", resumeGame),
      // _button("How to play", () => {}),
    ];


    // if (l != null && l.length > 0)
    //   widgetList.insert(2, _button("Resume game", resumeGame));

    return Center(
      child: ListView(
        shrinkWrap: true,
          // mainAxisAlignment: MainAxisAlignment.center, 
          children: widgetList),
    );
  }

  Widget _button(String text, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Center(
          child: ButtonTheme(
        minWidth: 200,
        height: 50,
        child: RaisedButton(
            onPressed: onPressed,
            child: Text(text, style: TextStyle(fontSize: 24))),
        disabledColor: Colors.grey,
      )),
    );
  }
}