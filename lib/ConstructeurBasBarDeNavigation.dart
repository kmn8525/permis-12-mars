import 'package:flutter/material.dart';

class ModifierAppBarItem {
  IconData icon;
  Function apuyer ;

  ModifierAppBarItem({this.icon , this.apuyer   });
}

class ModifierBottomAppBar extends StatefulWidget {
  final ValueChanged<int> iconSelectionner;
  final List<ModifierAppBarItem> items;



  ModifierBottomAppBar({this.iconSelectionner, this.items, Function apuyer}) {
    assert(this.items.length == 2 || this.items.length == 4);
  }

  @override
  _ModifierBottomAppBarState createState() => _ModifierBottomAppBarState();
}


class _ModifierBottomAppBarState extends State<ModifierBottomAppBar> {
  int _indexSelectioner = 0;

  void _MiseAjourIndex(int index) {
    widget.iconSelectionner(index);
    setState(() {
      _indexSelectioner = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _ConstructionTableIcon(
          index: index, item: widget.items[index], onPressed: _MiseAjourIndex);
    });

  //  {int index, ModifierAppBarItem item, ValueChanged<int> onPressed}) {

    items.insert(items.length >> 1, _ConstructionEspaceClicIcon());

    // items.length >> 1 :  equivaut a  items.length / 1 au carre

    return BottomAppBar(
      child: Container(
        height: 60.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items,
        ),
      ),
      shape: CircularNotchedRectangle(),
    );
  }

  Widget _ConstructionEspaceClicIcon() {
    return Expanded(
      child: SizedBox(
        height: 60.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 24.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget _ConstructionTableIcon(
      {int index, ModifierAppBarItem item, ValueChanged<int> onPressed}) {
    return Expanded(
      child: SizedBox(
        height: 60.0,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () {
              onPressed(index) ;
              setState(() {
              });
            },
            child : Icon(
              item.icon,
              color: _indexSelectioner == index ? Colors.blue : Colors.grey,
              size: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
