import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:login_flutter/ui/home.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

//String downloadURL="";
class VideoUploadPage extends StatefulWidget {
  @override
  _VideoUploadPageState createState() => _VideoUploadPageState();
}

class _VideoUploadPageState extends State<VideoUploadPage> {
  String? _videoPath;
  User? _currentUser;
  Uint8List? _thumbnail; // Declare the _thumbnail variable

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  Future<void> _getCurrentUser() async {
    _currentUser = FirebaseAuth.instance.currentUser;
  }
 /////////////////////////////////////////////////////////////////
  Future<void> _pickVideo() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.video,
        allowMultiple: false,
      );

      if (result != null && result.files.isNotEmpty) {
        setState(() {
          _videoPath = result.files.single.path;
        });

        // Generate a thumbnail from the picked video
        await _generateThumbnail(_videoPath!);
      }
    } 
    catch (e) {
      print("Error picking video: $e");
    }
  }

 ///////////////////////////////////////////////////////////////////////////
  Future<void> _uploadVideo() async {
    try {
      if (_currentUser != null && _videoPath != null) {
          // Check if the user's email is authorized
          String authorizedEmail = "shubhamashwani93@gmail.com"; // replace with the authorized email
          if (_currentUser!.email == authorizedEmail) {
            String userId = _currentUser!.uid;
            File videoFile = File(_videoPath!);

            // Create a reference to the user's video in Firebase Storage
            Reference videoRef = FirebaseStorage.instance
                .ref()
                .child('videos/$userId/${DateTime.now().millisecondsSinceEpoch}.mp4');

            // Upload the video
            await videoRef.putFile(videoFile);

            // Get the download URL
            String downloadURL = await videoRef.getDownloadURL();

            // Save the download URL to Firestore or use it as needed
            // (e.g., save it in a collection with information about the video)
            print('Video uploaded. Download URL: $downloadURL');
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
 /////////////////////////////////////////////////////////////////////////////////////////////////////////
  Future<void> _generateThumbnail(String videoPath) async {
    try {
      final uint8List = await VideoThumbnail.thumbnailData(
        video: videoPath,
        imageFormat: ImageFormat.JPEG,
        quality: 100,
      );

      // Set the _thumbnail state variable with the generated uint8List
      setState(() {
        _thumbnail = uint8List;
      });
    } 
    catch (e) {
      print("Error generating thumbnail: $e");
    }
  }
 ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Upload Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _pickVideo,
              child: Text('Pick Video'),
            ),
    SizedBox(height: 20),
    _videoPath != null
        ? Column(
            children: [
              Text('Selected Video: $_videoPath'),
              SizedBox(height: 20),
              _thumbnail != null
                  ? Image.memory(
                      _thumbnail!,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    )
                  : Text('Thumbnail not available'),
            ],
          )
        : Text('No video selected'),
    SizedBox(height: 20),
            ElevatedButton(
              onPressed: _uploadVideo,
              child: Text('Upload Video'),
            ),
          ],
        //VideoDemo(videoUrl:downloadURL);  
        ),
        
      ),
    );
  }
}
