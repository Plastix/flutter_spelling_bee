import 'package:flutter/material.dart';
import 'package:spelling_bee/blocs/game_bloc.dart';
import 'package:spelling_bee/helpers/provider.dart';

class GameActions extends StatelessWidget {
  const GameActions({Key key})
      : super(key: key);

  // final VoidCallback clear;
  // final VoidCallback refresh;
  // final VoidCallback submit;

  static const double SIZE=36;

  @override
  Widget build(BuildContext context) {
    Widget _icon(IconData i, String t, Event e) {
    return Column(
      children: <Widget>[
        FlatButton(
          // iconSize: SIZE,
          child: Column(
            children: <Widget>[Icon(i, color: Colors.black, size: SIZE),Text(t)],
          ),
          // label: Text(t),
          // color: Colors.yellow,
          color: Colors.transparent,
          splashColor: Colors.grey,
          onPressed: () => Provider.of(context).game.eventSink.add(e),
          // disabledColor: Colors.blueGrey,
        ),
      ],
    );
  }
    return Ink(
      // padding: const EdgeInsets.only(bottom: SIZE*1.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _icon(Icons.clear, "Clear", Event.CLEAR),
          _icon(Icons.refresh, "Shuffle", Event.SHUFFLE),
          _icon(Icons.check, "Check", Event.CHECK),
        ],
      ),
    );
  }

  

  // Widget button(String s, VoidCallback c) {
  //   return Padding(
  //     padding: const EdgeInsets.all(27.0),
  //     child: ButtonTheme(
  //       child: RaisedButton(
  //         color: Colors.black,
  //         highlightColor: Colors.green,
  //         onPressed: c,
  //         shape: BeveledRectangleBorder(
  //           borderRadius: BorderRadius.circular(5.0),
  //         ),
  //         child: Text(s, style: TextStyle(color: Colors.white, fontSize: 20)),
  //       ),
  //     ),
  //   );
  // }
}
