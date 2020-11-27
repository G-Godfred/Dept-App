import 'package:Practice/Years/announcement.dart';
import 'package:flutter/material.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:Practice/home/home.dart';

class First extends StatefulWidget {
  @override
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<First> with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _animationController;
  int selectedTab = 0;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void _showAnnouncementpanel() => showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 250,
            padding: EdgeInsets.fromLTRB(20, 45, 20, 0),
            child: Announcement(),
          );
        });

    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              title: Text('FIRST YEAR'),
              bottom: TabBar(
                onTap: (value) {
                  setState(() {
                    selectedTab = value;
                  });
                },
                tabs: <Widget>[
                  Tab(text: 'Materials'),
                  Tab(text: 'Class info'),
                  Tab(text: 'Members'),
                ],
              ),
            ),
            body: TabBarView(children: <Widget>[
              ListView(children: <Widget>[
                ListTile(
                  trailing: IconButton(
                      icon: Icon(Icons.cloud_download_outlined,
                          color: Colors.lightBlue),
                      onPressed: null),
                  title: Text(
                    'ENG TECH',
                    style: TextStyle(fontSize: 15, color: Colors.lightBlue),
                  ),
                  // subtitle: Text('All semesters combined'),
                  // onTap: () {}
                ),
                ListTile(
                  trailing: IconButton(
                      icon: Icon(Icons.cloud_download_outlined,
                          color: Colors.lightBlue),
                      onPressed: null),
                  title: Text(
                    'ENG TECH',
                    style: TextStyle(fontSize: 15, color: Colors.lightBlue),
                  ),
                  // subtitle: Text('All semesters combined'),
                  // onTap: () {}
                ),
              ]),
              Text('data'),

              Text('data')
              // Hero(tag: null, child: null),
            ]),
            floatingActionButton: selectedTab == 1
                ?
                // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

                //Init Floating Action Bubble
                // floatingActionButton:
                FloatingActionBubble(
                    // Menu items
                    items: <Bubble>[
                      // Floating action menu item
                      Bubble(
                        title: "Announcement",
                        iconColor: Colors.white,
                        bubbleColor: Colors.blue,
                        icon: Icons.settings,
                        titleStyle:
                            TextStyle(fontSize: 16, color: Colors.white),
                        onPress: () {
                          // _animationController.reverse();
                          _showAnnouncementpanel();
                        },
                      ),
                      // Floating action menu item
                      Bubble(
                        title: "Submission",
                        iconColor: Colors.white,
                        bubbleColor: Colors.blue,
                        icon: Icons.people,
                        titleStyle:
                            TextStyle(fontSize: 16, color: Colors.white),
                        onPress: () {
                          _animationController.reverse();
                        },
                      ),
                      //Floating action menu item
                      Bubble(
                        title: "Home",
                        iconColor: Colors.white,
                        bubbleColor: Colors.blue,
                        icon: Icons.home,
                        titleStyle:
                            TextStyle(fontSize: 16, color: Colors.white),
                        onPress: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (BuildContext context) => Home()));
                          _animationController.reverse();
                        },
                      ),
                    ],

                    // animation controller
                    animation: _animation,

                    // On pressed change animation state
                    onPress: () => _animationController.isCompleted
                        ? _animationController.reverse()
                        : _animationController.forward(),

                    // Floating Action button Icon color
                    iconColor: Colors.blue,

                    // Flaoting Action button Icon
                    iconData: Icons.ac_unit,
                    backGroundColor: Colors.white,
                  )
                : Offstage()));
  }
}
