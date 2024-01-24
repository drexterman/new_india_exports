import 'package:flutter/material.dart';
import 'package:login_flutter/ui/UploadVideo.dart';
import 'package:login_flutter/ui/gallery.dart';
import 'package:login_flutter/ui/home.dart';
import 'package:login_flutter/ui/products.dart';


class Navbar extends StatelessWidget {
  const Navbar({super.key});

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
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Contact Us'),
              onTap: () {},
            ),
            ListTile(
              
              leading: Icon(Icons.info),
              title: Text('About Us'),
              onTap: () {},
            ),
            ListTile(
              
              leading: Icon(Icons.video_settings_rounded),
              title: Text('Upload Videos'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return VideoUploadPage() ;
                      },
                    ),
                  );
              },
            )

          ],
        ),

      );
  }
}