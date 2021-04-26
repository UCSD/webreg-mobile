import 'package:flutter/material.dart';
import 'package:webreg_mobile_flutter/ui/search/search_bar.dart';
import 'package:webreg_mobile_flutter/app_styles.dart';

// contains search bar and search results
class SearchView extends StatefulWidget {
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  bool openFilters = false;
  List<bool> selectedFilters = List<bool>.filled(3, false);
  List<String> filters = ['Show lower division', 'Show upper division', 'Show gradudate division'];
  // Map<String, bool> filters = {'Show lower division': false, 'Show upper division': false, 'Show gradudate division': false};

  void setOpenFilters() {
    this.setState(() {
      openFilters = !openFilters;
    });
  }

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Hero(
          tag: 'search_bar',
          child: SearchBar(setOpenFilters),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: Text(
              "Search by course code\ne.g. ANTH 23",
              style: TextStyle(color: darkGray, fontSize: 18),
              textAlign: TextAlign.center,
            )
          ),
          openFilters ? Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 10),
              height: 120,
              decoration: new BoxDecoration(color: ColorPrimary),
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: selectedFilters.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 30,
                    padding: EdgeInsets.symmetric(horizontal: 35),
                    // color: Colors.amber[colorCodes[index]],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(filters[index], style: TextStyle(color: Colors.white, fontSize: 16)),
                        Switch(
                          value: selectedFilters[index],
                          onChanged: (value) {
                            setState(() {
                              selectedFilters[index] = value;
                            });
                          },
                          activeTrackColor: Colors.green,
                          activeColor: Colors.white,
                        ),
                      ]
                    )
                  );
                }
              ),
              // ListView(
              //   children: <Widget>[
              //     ListTile(
              //       title: Text('Show lower division', style: TextStyle(color: Colors.white)),
              //       // selected: _selectedFilters[0],
              //       // onTap: () => _selectedFilters[0] = true,
              //     ),
              //     ListTile(
              //       leading: Icon(Icons.favorite),
              //       title: Text('Show upper division'),
              //       // selected: _selectedFilters[1],
              //       // onTap: () => _selectedFilters[1] = true,
              //     ),
              //     ListTile(
              //       leading: Icon(Icons.favorite),
              //       title: Text('Show graduate division'),
              //       // selected: _selectedFilters[2],
              //       // onTap: () => _selectedFilters[2] = true,
              //     ),
              //   ]
              // )
            )
          ) : SizedBox(),
        ],
      ),
    );
  }
}