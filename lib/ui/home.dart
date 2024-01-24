import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:hive_flutter/hive_flutter.dart';
import 'package:login_flutter/ui/navbar.dart';
//import 'package:flutter_animate/flutter_animate.dart';
import 'package:login_flutter/ui/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:video_player/video_player.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class Home extends StatefulWidget {

  //Home({super.key});
  const Home({Key? key}) : super(key: key);
  @override
    _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
    User? _currentUser;
/////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  Future<void> _getCurrentUser() async {
    _currentUser = FirebaseAuth.instance.currentUser;
  }
////////////////////////////////////////////////////////////////////////////////////////////
Future<String> getVideoDownloadURL(String videoPath) async {
  try {
    Reference videoRef = FirebaseStorage.instance.ref().child(videoPath);
    String downloadURL = await videoRef.getDownloadURL();
    return downloadURL;
  } catch (e) {
    print("Error getting video download URL: $e");
    throw e; // Handle the error according to your application's needs
  }
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////
  Future<String> _fetchVideoDownloadURL() async {
    try {
      String videoPath = 'videos/MtsJpEUJ1dPVrSzoQMQgXIHvVRl2/1705736091030.mp4';
      String videoDownloadURL = await getVideoDownloadURL(videoPath);
      return videoDownloadURL;
    } catch (e) {
      print("Error fetching video download URL: $e");
      // Handle the error according to your app's needs
      throw e;
    }
  }
///////////////////////////////////////////////////////////////////////////////////////////
  Future<void> _uploadVideo() async {
    try {
      if (_currentUser != null) {
          // Check if the user's email is authorized
          String authorizedEmail = "shubhamashwani93@gmail.com"; // replace with the authorized email
          if (_currentUser!.email == authorizedEmail) {
            String userId = _currentUser!.uid;
    

            // Save the download URL to Firestore or use it as needed
            // (e.g., save it in a collection with information about the video)
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Video Uploaded'),
              ),
            );

          } 
          else {
            // Show a SnackBar to indicate that the user is not authorized
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('You are not authorized to upload videos.'),
              ),
            );
          }
        } 
      else {
        throw Exception("User not authenticated or video not selected.");
      }
    } 
    catch (e) {
      print("Error uploading video: $e");
    }
  }
//////////////////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(
        title: const Text("New India Exports"),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white),
              ),
              child: IconButton(
                onPressed: () {
                  clearUserSession();
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const Login();
                      },
                    ),
                  );
                 /* _boxLogin.clear();
                  _boxLogin.put("loginStatus", false);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const Login();
                      },
                    ),
                  );*/
                },
                icon: const Icon(Icons.logout_rounded),
              ),
            ),
          )
        ],
      ),
      backgroundColor: Color.fromARGB(255, 236, 231, 223),
      body: Stack(
        fit: StackFit.expand,
        children: [
          /*Image.asset(
            'assets/background.jpg', // Replace with your image path
            fit: BoxFit.cover,
          ),
          // Semi-transparent Overlay
          Container(
            color: Colors.black.withOpacity(0.6), // Adjust opacity as needed
          ),*/
          // Main Content

        SingleChildScrollView(
                child: Column(
            
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
          
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Welcome ",
                          style: TextStyle(
                                  color: Color.fromARGB(255, 27, 29, 29),
                                  fontSize: 30,

                                ),
                          ),
                    
                          /*Text(
                            //_boxLogin.get("userName"),
                            "User",
                            style: TextStyle(
                              color: Color.fromARGB(255, 27, 29, 29),
                              fontSize: 30,
                            ),
                          ),*/
                        Text(
                          " !",
                          style: TextStyle(
                            color: Color.fromARGB(255, 27, 29, 29),
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),

                    Image.asset("assets/Logo.png"),
                      
                    SizedBox(height: 30, width:30),
                    Text("Connecting farmers to you: Uncompromised Quality, Directly Delivered.",
                      style:TextStyle(
                        color: Color.fromARGB(255, 123, 104, 93),
                        fontSize: 20,
                        ),
                    ),

                      //String ,videoPath = 'videos/MtsJpEUJ1dPVrSzoQMQgXIHvVRl2/1705736091030.mp4';
                      //String videoDownloadURL = await getVideoDownloadURL(videoPath);
                      //Reference videoRef = FirebaseStorage.instance.ref().child('videos/MtsJpEUJ1dPVrSzoQMQgXIHvVRl2/1705736091030.mp4');
                      //String downloadURL = await videoRef.getDownloadURL();
                    
                    //print("Video Download URL: $videoDownloadURL");
                    //"https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4"
                    //String hi = getVideoDownloadURL();

                    //VideoDemo(getVideoDownloadURL()),
                    /*FutureBuilder<String>(
                      future: _fetchVideoDownloadURL(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          // If the Future is still running, show a loading indicator
                          return CircularProgressIndicator();
                        } 
                        else if (snapshot.hasError) {
                          // If there was an error, display an error message
                          return Text('Error: ${snapshot.error}');
                        } 
                        else {
                          // If the Future is complete and successful, display the result
                          String videoDownloadURL = snapshot.data ?? 'No URL available';
                          //return Text('Video Download URL: $videoDownloadURL');
                          return VideoDemo(videoDownloadURL);
                        }
                      },
                  ),*/
                  YoutubePlayer(
                    controller: YoutubePlayerController(
                      initialVideoId: 'nqye02H_H6I',
                      flags: YoutubePlayerFlags(
                        autoPlay: true,
                        mute: false,
                      ),
                    ),
                  ),
                  ],
                
                ),
        ),
        ],
      ),
    );
    
  }
    Future<void> clearUserSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('userToken');
  }
}
/*
class VideoDemo extends StatefulWidget {
  VideoDemo() : super();
 
  final String title = "Video Demo";
 
  @override
  VideoDemoState createState() => VideoDemoState();
}
 
class VideoDemoState extends State<VideoDemo> {
  //
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
 
  @override
  void initState() {
    _controller = VideoPlayerController.networkUrl(
      Uri.parse("https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4")
        );
    //_controller = VideoPlayerController.asset("videos/sample_video.mp4");
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.setVolume(1.0);
    super.initState();
  }
 
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video Demo"),
      ),
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
        child:
            Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
      ),
    );
  }
}
*/

// ignore: must_be_immutable
class VideoDemo extends StatefulWidget {
  VideoDemo(this.videoUrl); //: super();
 
  final String title = "Video Demo";
  final String videoUrl;
  @override
  VideoDemoState createState() => VideoDemoState();
}
 
class VideoDemoState extends State<VideoDemo> {
  //
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
 
  @override
  void initState() {
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(widget.videoUrl) 
      );
      //"gs://newindiaexports-bb3af.appspot.com/videos/MtsJpEUJ1dPVrSzoQMQgXIHvVRl2/1705774691070.mp4"
       
     // https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4
     //gs://newindiaexports-bb3af.appspot.com/videos/MtsJpEUJ1dPVrSzoQMQgXIHvVRl2
    //_controller = VideoPlayerController.asset("videos/sample_video.mp4");
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.setVolume(1.0);
    _controller.play();
    super.initState();
  }
 
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
 
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      );
  }
}
