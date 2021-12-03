import 'package:flutter/material.dart';
import 'package:webreg_mobile_flutter/app_constants.dart';
import 'package:webreg_mobile_flutter/app_styles.dart';

class SearchBar extends StatelessWidget {
  final VoidCallback setOpenFilters;

  SearchBar(this.setOpenFilters);

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
        context: context,
        removeBottom: true,
        child: AppBar(
            titleSpacing: 0.0,
            centerTitle: true,
            title: Container(
              decoration: new BoxDecoration(
                color: lightGray,
                borderRadius: new BorderRadius.all(Radius.circular(100.0)),
                border: Border.all(width: 1.0, color: Color(0xFF034263)),
              ),
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child: Search(),
            ),
            automaticallyImplyLeading: false,
            leading: Center(
              child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  padding: EdgeInsets.symmetric(horizontal: 9),
                  alignment: Alignment.centerLeft,
                  iconSize: 25,
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.filter_list, color: Colors.white),
                padding: EdgeInsets.symmetric(horizontal: 9),
                alignment: Alignment.centerLeft,
                iconSize: 25,
                onPressed: this.setOpenFilters,
              ),
            ]));
  }
}

// class Filters extends StatefulWidget {
//   Widget child;
//   bool expand;
//   Filters({this.expand = false, this.child});

//   @override
//   _FiltersState createState() => _FiltersState();
// }

// class _FiltersState extends State<Filters> with SingleTickerProviderStateMixin {
//   bool expand = false;
//   Widget child;
//   List<bool> _selectedFilters = List<bool>.filled(3, false);

//   AnimationController expandController;
//   Animation<double> animation;

//   void prepareAnimations() {
//     expandController = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 500)
//     );
//     animation = CurvedAnimation(
//       parent: expandController,
//       curve: Curves.fastOutSlowIn,
//     );
//   }

//   void _runExpandCheck() {
//     if(widget.expand) {
//       expandController.forward();
//     }
//     else {
//       expandController.reverse();
//     }
//   }

//   // void handleBottomSheet(BuildContext context) {
//   //   _openBottomSheet = !_openBottomSheet;

//   //   if(_openBottomSheet) {
//   //     showBottomSheet(
//   //       context: context,
//   //       builder: (context) => Wrap(
//   //         children: <Widget>[
//   //           Container(
//   //             color: ColorPrimary,
//   //             height: 100,
//   //             child: ListView(
//   //               children: <Widget>[
//   //                 ListTile(
//   //                   title: Text('Show lower division', style: TextStyle(color: Colors.white)),
//   //                   selected: _selectedFilters[0],
//   //                   onTap: () => _selectedFilters[0] = true,
//   //                 ),
//   //                 ListTile(
//   //                   leading: Icon(Icons.favorite),
//   //                   title: Text('Show upper division'),
//   //                   selected: _selectedFilters[1],
//   //                   onTap: () => _selectedFilters[1] = true,
//   //                 ),
//   //                 ListTile(
//   //                   leading: Icon(Icons.favorite),
//   //                   title: Text('Show graduate division'),
//   //                   selected: _selectedFilters[2],
//   //                   onTap: () => _selectedFilters[2] = true,
//   //                 ),
//   //               ]
//   //             )
//   //           )
//   //         ]
//   //     ));
//   //   } else {
//   //     Navigator.pop(context);
//   //   }
//   // }
//   //
//   @override
//   void didUpdateWidget(Filters oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     _runExpandCheck();
//   }

//   @override
//   void dispose() {
//     expandController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizeTransition(
//       axisAlignment: 1.0,
//       sizeFactor: animation,
//       child: widget.child
//     );
//     // return IconButton(
//     //   icon: Icon(Icons.filter_list, color: Colors.white),
//     //   padding: EdgeInsets.symmetric(horizontal: 9),
//     //   alignment: Alignment.centerLeft,
//     //   iconSize: 25,
//     //   onPressed: () { handleBottomSheet(context); },
//     // );
//   }
// }

class TermDropdown extends StatefulWidget {
  @override
  _TermDropdownState createState() => _TermDropdownState();
}

class _TermDropdownState extends State<TermDropdown> {
  List<String> dropdownItems = ['FA19', 'WI20', 'SP20', 'FA20'];
  String _dropdownVal = 'FA19';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      underline: Container(height: 0),
      value: _dropdownVal,
      icon: Icon(Icons.arrow_drop_down, color: Colors.black, size: 20),
      onChanged: (String? newVal) {
        setState(() {
          _dropdownVal = newVal!;
        });
      },
      items: dropdownItems.map<DropdownMenuItem<String>>((String val) {
        return DropdownMenuItem<String>(
            value: val,
            child: Text(val,
                style: TextStyle(
                    color: darkGray,
                    fontSize: 14,
                    fontWeight: FontWeight.bold)));
      }).toList(),
    );
  }
}

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Widget _icon = Icon(Icons.search, size: 20, color: darkGray);
  final _searchText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 35,
        child: Row(
          children: <Widget>[
            Container(
                margin: const EdgeInsets.only(left: 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TermDropdown(),
                    Container(
                      width: 1.0,
                      color: darkGray,
                      margin: const EdgeInsets.only(right: 10.0),
                    )
                  ],
                )),
            Expanded(
              child: TextField(
                onChanged: (text) {
                  // _searchText = text;
                  if (text.length > 0) {
                    _icon = GestureDetector(
                        child: Icon(Icons.close, size: 20, color: darkGray),
                        onTap: () {
                          _searchText.clear();
                        });
                  } else {
                    _icon = Icon(Icons.search, size: 20, color: darkGray);
                  }
                },
                controller: _searchText,
                autofocus: true,
                textAlignVertical: TextAlignVertical.center,
                style: TextStyle(fontSize: 16),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 0),
                  hintText: 'Search',
                  isDense: true,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 10.0),
              child: _icon,
            ),
          ],
        ));
  }
}
