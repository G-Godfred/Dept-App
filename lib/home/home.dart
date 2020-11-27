import 'package:Practice/Years/first.dart';
import 'package:Practice/home/Bottom%20body/centre.dart';
import 'package:Practice/home/Bottom%20body/settings.dart';
import 'package:Practice/home/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:Practice/Authenticate/Auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  int _currentIndex = 0;
  Widget callPage(int _currentIndex) {
    switch (_currentIndex) {
      case 0:
        //Text('date');
        return Centre();
        break;
      case 1:
        return //First();
            Centre();
        //Text('date');

        break;
      case 2:
        //Text('date');
        return Settings();
        break;
      default:
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: Text(
            'TELECOM ENG',
            // style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () async {
                  await _auth.signOut();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SignUp()));
                },
                icon: Icon(
                  Icons.exit_to_app,
                  //size: 35,
                  color: Colors.white,
                ),
                label: Text(
                  'Log Out',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                  child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 0,
                  ),
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/telco mast.jpg'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'CHOOSE YEAR ',
                    style: TextStyle(fontSize: 20, color: Colors.lightBlue),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Divider(
                    color: Colors.grey,
                    thickness: 2,
                  )
                ],
              )),
              ListTile(
                  title: Text(
                    'First year',
                    style: TextStyle(fontSize: 15, color: Colors.lightBlue),
                  ),
                  subtitle: Text('All semesters combined'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => First()));
                  }),
              Divider(
                color: Colors.grey,
                thickness: 0.3,
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                title: Text(
                  'Second year',
                  style: TextStyle(fontSize: 15, color: Colors.lightBlue),
                ),
                subtitle: Text('All semesters combined'),
                onTap: () => print('data 2'),
              ),
              Divider(
                color: Colors.grey,
                thickness: 0.3,
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                title: Text(
                  'Third year',
                  style: TextStyle(fontSize: 15, color: Colors.lightBlue),
                ),
                subtitle: Text(
                  'All semesters combined',
                ),
                onTap: () => print('data 3'),
              ),
              Divider(
                color: Colors.grey,
                thickness: 0.3,
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                title: Text(
                  'FInal year',
                  style: TextStyle(fontSize: 15, color: Colors.lightBlue),
                ),
                subtitle: Text('All semesters combined'),
                onTap: () => print('data 4'),
              ),
              Divider(
                color: Colors.grey,
                thickness: 0.3,
              ),
            ],
          ),
        ),
        body: callPage(_currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ('Home')),
            BottomNavigationBarItem(
                icon: Icon(Icons.receipt), label: ('Schedules')),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: ('Settings')),
            BottomNavigationBarItem(
                icon: Icon(Icons.people), label: ('Executives'))
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ));
  }
}
