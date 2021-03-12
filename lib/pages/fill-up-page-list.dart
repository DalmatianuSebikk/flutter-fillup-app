import 'package:carList/pages/fill-up-page-add.dart';
import 'package:carList/services/fill-up-data.dart';
import 'package:carList/widgets/fillUpList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FillUpPageList extends StatefulWidget {
  @override
  _FillUpPageListState createState() => _FillUpPageListState();
}

class _FillUpPageListState extends State<FillUpPageList> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    FillUpInternal(),
    FillUpAdd(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista'),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "Pagina principala",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "Adauga",
          )
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) => FillUpAdd(),
      //       ),
      //     );
      //   },
      //   child: Icon(Icons.add),
      // ),
    );
  }
}

class FillUpInternal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<FillUpData>(context, listen: false).getFillUps();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              child: FillUpList(),
            ),
          ),
        ],
      ),
    );
  }
}
