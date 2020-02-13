import 'package:flutter/material.dart';
import 'package:rapido/rapido.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notepad with Flutter',
      home: Home(title: 'Notepad'),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final DocumentList documentList = DocumentList(
    "task list",
    labels: {"編集日": "date", "タイトル": "title", "ノート": "note"},
  );

  @override
  Widget build(BuildContext context) {
    return DocumentListScaffold(
      documentList,
      title: "タスク",
      customItemBuilder: _customBuilder,
      // 背景色
      decoration: BoxDecoration(color: Colors.white),
      emptyListWidget: Center(
        child: Text(
          "＋ボタンからタスクを追加",
          textAlign: TextAlign.center,
        )
      ),
    );
  }

  Widget _customBuilder(int index, Document doc, BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                Text(documentList[index]["title"],
                    style: Theme.of(context).textTheme.title),
                Text(documentList[index]["date"].toString()),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(documentList[index]["note"]),
                )
              ],
            ),
          ),
          DocumentActionsButton(documentList, index: index)
        ],
      ),
      color: Colors.blueAccent,
    );
  }
}