import 'package:firebase_anonymous_login/screens/home/home.dart';
import 'package:flutter/material.dart';

class Leaderboard extends StatefulWidget {
  const Leaderboard({Key? key}) : super(key: key);

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 5.0,
        title: Row(
          children: [
            Expanded(
                child: Text('Group Name 1234 XYZ',textAlign: TextAlign.center,),
            ),
            IconButton (
                icon: new Icon(Icons.ios_share_outlined),
                onPressed: () {  },
              ),
          ],
        ),
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home page'),
              onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  Home()));},
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      ),

      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomNavigationBar(
          backgroundColor: Colors.blueGrey,
          elevation: 20.0,
          iconSize: 30.0,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.feed),
              label: 'Feed',
              backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.leaderboard),
              label: 'Leaderboard',
              backgroundColor: Colors.green,
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          onTap: _onItemTapped,
        ),
      ),

      floatingActionButton: Container(
        height: 85,
        width: 85,
        child: FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
          },
          backgroundColor: Colors.teal,
          child: const Icon(Icons.navigation, size: 50,),
        ),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      body: Column(
        children: [
          Container(
            child: Image.asset('assets/coverpage.jpg'),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0, top: 20),
            child: Container(
              child: Text('Distance Leaderboard',style: TextStyle (fontSize: 25.0, fontWeight: FontWeight.bold)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Container(
              height: 1,
              width: 100,
              color: Colors.black45,
            ),
          ),
          Expanded (
            child: Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25.0),
              child: Scrollbar(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    ListTile(
                      title: Row(
                        children: [
                          Expanded (child: Text('Nibrash Kazi Subah',style: TextStyle (fontSize: 18.0))),
                          Text('0.00Km',style: TextStyle (fontSize: 18.0,fontWeight: FontWeight.bold), textAlign: TextAlign.right),
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      width: 200,
                      color: Colors.black12,
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Expanded (child: Text('Nibrash Kazi Subah',style: TextStyle (fontSize: 18.0))),
                          Text('0.00Km',style: TextStyle (fontSize: 18.0,fontWeight: FontWeight.bold), textAlign: TextAlign.right),
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      width: 200,
                      color: Colors.black12,
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Expanded (child: Text('Nibrash Kazi Subah',style: TextStyle (fontSize: 18.0))),
                          Text('0.00Km',style: TextStyle (fontSize: 18.0,fontWeight: FontWeight.bold), textAlign: TextAlign.right),
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      width: 200,
                      color: Colors.black12,
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Expanded (child: Text('Nibrash Kazi Subah',style: TextStyle (fontSize: 18.0))),
                          Text('0.00Km',style: TextStyle (fontSize: 18.0,fontWeight: FontWeight.bold), textAlign: TextAlign.right),
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      width: 200,
                      color: Colors.black12,
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Expanded (child: Text('Nibrash Kazi Subah',style: TextStyle (fontSize: 18.0))),
                          Text('0.00Km',style: TextStyle (fontSize: 18.0,fontWeight: FontWeight.bold), textAlign: TextAlign.right),
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      width: 200,
                      color: Colors.black12,
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Expanded (child: Text('Nibrash Kazi Subah',style: TextStyle (fontSize: 18.0))),
                          Text('0.00Km',style: TextStyle (fontSize: 18.0,fontWeight: FontWeight.bold), textAlign: TextAlign.right),
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      width: 200,
                      color: Colors.black12,
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Expanded (child: Text('Nibrash Kazi Subah',style: TextStyle (fontSize: 18.0))),
                          Text('0.00Km',style: TextStyle (fontSize: 18.0,fontWeight: FontWeight.bold), textAlign: TextAlign.right),
                        ],
                      ),
                    ),
                  ],
                ),
                showTrackOnHover: true,
                thickness: 8,
                radius: Radius.circular(4),
              )
            ),
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
