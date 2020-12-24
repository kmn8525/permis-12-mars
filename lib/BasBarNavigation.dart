import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permis/TableIthemes.dart';


class CupertinoHomeScaffold extends StatelessWidget {


  const CupertinoHomeScaffold({

    @required this.tableActuel,
    @required this.tableSelectioner,
    @required this.widgetConstructeurs,
    @required this.IdNavigation,
  });

  final TableItems tableActuel;
  final ValueChanged<TableItems> tableSelectioner;
  final Map<TableItems, WidgetBuilder> widgetConstructeurs;
  final Map<TableItems, GlobalKey<NavigatorState>> IdNavigation;




  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(

      tabBar: CupertinoTabBar(

        items: [
          _buildItem(TableItems.themes),
          _buildItem(TableItems.cours),
          _buildItem(TableItems.examens),
          _buildItem(TableItems.jeux),
          _buildItem(TableItems.reglages),


        ],
        onTap: (index) => tableSelectioner(TableItems.values[index]),
      ),
      tabBuilder: (context, index) {
        final itemCourant = TableItems.values[index];
        return CupertinoTabView(
          navigatorKey: IdNavigation[itemCourant],
          builder: (context) => widgetConstructeurs[itemCourant](context),
        );
      },
    );
  }

  BottomNavigationBarItem _buildItem(TableItems tableItems) {
    final itemData = TableItemDonne.TousLesTableDitem[tableItems];

    return BottomNavigationBarItem(

      icon: Icon(
        itemData.icon,
        color: _modifiColorItem(item: tableItems),
      ),
      title: Text(
        itemData.nom,
        style: TextStyle(color: _modifiColorItem(item: tableItems)),
      ),
    );
  }

  Color _modifiColorItem({TableItems item}) {
    return tableActuel == item ? Colors.lightBlueAccent : Colors.black;
  }

}
