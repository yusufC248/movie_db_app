import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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

  MovieApi movieAPi = MovieApi();
  Future<NewMovie>? newMovie;

  String imageBaseUrl = 'https://image.tmdb.org/t/p/w500';
  @override
  void initState(){
    newMovie = MovieApi().getNewMovie();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie DB APP"),
        centerTitle: true,
      ),
      endDrawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children:<Widget> [
            ListTile(
                leading: Icon(Icons.home),
                title: Text("Home")
            ),
            ListTile(
                leading: Icon(Icons.info),
                title: Text("About")
            ),
            GestureDetector(
                onTap: () async {
                  WidgetsFlutterBinding.ensureInitialized();

                  cameras = await availableCameras();
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return CameraScreen();

                  }));
                },
                child: ListTile(
                    leading: Icon(Icons.qr_code),
                    title: Text("Scan")
                ),
            )
          ],
        )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          elevation: 16,
          onPressed: () async {
            WidgetsFlutterBinding.ensureInitialized();

            cameras = await availableCameras();
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return CameraScreen();

            }));
          },
          label: Column(
            children: [
              Icon(Icons.qr_code),
              Text("SCAN QR", style:TextStyle(color: Colors.white)),
            ],
          )),
      body: FutureBuilder(
          future: newMovie,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if(snapshot.hasData){
              return StaggeredGridView.countBuilder(
                  itemCount: snapshot.data.results.length,
                  crossAxisCount: 2,
                  staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                  itemBuilder: (context, index) => Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 8),
                      child: Column(
                        children:<Widget>[ ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network('$imageBaseUrl${snapshot.data.results[index].posterPath}'),
                        ),
                          Text('${snapshot.data.results[index].title}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
                        ]
                      ),
                    ),
                  ),
              );
            }else if (snapshot.hasError){
              print("Has Error: ${snapshot.hasError}");
              return Text('error here');
            }else{
              return Center(child: CircularProgressIndicator());
            }
          }
          )
    );
  }
}
