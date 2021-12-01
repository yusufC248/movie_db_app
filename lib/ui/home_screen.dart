import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_db_app/api/model.dart';
import 'package:movie_db_app/api/movie_api.dart';
import 'package:movie_db_app/ui/camera_scan.dart';

import '../main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Movie? movies;
  String? _movieImageURL;
  String? _movieHeroTag;




  String? json = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie DB APP"),
      ),
      endDrawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:<Widget> [
            TextButton(
                onPressed: (){},
                child: Text("Home")
            ),
            TextButton(
              onPressed: (){},
              child: Text("About"),
            ),
            TextButton(
                onPressed: () async {
                  WidgetsFlutterBinding.ensureInitialized();

                  cameras = await availableCameras();
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return CameraScreen();

                  }));
                },
                child: Text("Scan")
            )
          ],
        )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          elevation: 16,
          onPressed: (){},
          label: Text("SCAN QR", style:TextStyle(color: Colors.white))),
      body: Text("test"),
    );
  }
}
