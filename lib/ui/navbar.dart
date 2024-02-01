//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:login_flutter/ui/UploadVideo.dart';
import 'package:login_flutter/ui/gallery.dart';
import 'package:login_flutter/ui/home.dart';
import 'package:login_flutter/ui/products.dart';

class Navbar extends StatefulWidget {

  //Home({super.key});
  const Navbar({Key? key}) : super(key: key);
  @override
    _NavbarState createState() => _NavbarState();
}

//class Navbar extends StatelessWidget {
//  const Navbar({super.key});
class _NavbarState extends State<Navbar> {
    //User? _currentUser;
/////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    super.initState();
   // _getCurrentUser();
  }

  /*Future<void> _getCurrentUser() async {
    _currentUser = FirebaseAuth.instance.currentUser;
  }*/
/////////////////////////////////////////////////////////////////////////////Future<StatefulWidget>
/*  Widget _page() {
    try {
      if (_currentUser != null) {
          // Check if the user's email is authorized
          String authorizedEmail = "shubhamashwani93@gmail.com"; // replace with the authorized email
          if (_currentUser!.email == authorizedEmail) {
            //String userId = _currentUser!.uid;
    

            // Save the download URL to Firestore or use it as needed
            // (e.g., save it in a collection with information about the video)
            /*ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Video Uploaded'),
              ),
            );*/
            //return VideoUploadPage();
            return VideoPlayerPage();

          } 
          else {
            // Show a SnackBar to indicate that the user is not authorized
            /*ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('You are not authorized to upload videos.'),
              ),
            );*/
            return LockedPage();
          }
        } 
      else {
        //throw Exception("User not authenticated or video not selected.");
        return LockedPage();
      }
    } 
    catch (e) {
     // print("Error uploading video: $e");
     return LockedPage();
    }
  }*/
//////////////////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: [

            Container(
              child: Image.asset('assets/Logo.png'),
              height: 200,

            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: (){

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Home() ;
                      },
                    ),
                  );
              },
            ),
            ListTile(
              leading: Icon(Icons.production_quantity_limits),
              title: Text('Products'),
              onTap: (){

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ProductCategoriesGrid() ;
                      },
                    ),
                  );
              },

            ),
            ListTile(
              leading: Icon(Icons.photo_album),
              title: Text('Gallery'),
              onTap: (){

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Gallery() ;
                      },
                    ),
                  );
              },

            ),
            /*ListTile(
              leading: Icon(Icons.phone),
              title: Text('Contact Us'),
              onTap: () {},
            ),*/
            ListTile(
              
              leading: Icon(Icons.info),
              title: Text('About Us'),
              onTap: () {},
            ),
            /*ListTile(
              
              leading: Icon(Icons.video_settings_rounded),
              title: Text('Upload Videos'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        //return VideoUploadPage() ;
                        return _page();
                      },
                    ),
                  );
              },
            )*/

          ],
        ),

      );
  }
}