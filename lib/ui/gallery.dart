import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
//import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
//import 'package:login_flutter/ui/navbar.dart';
/*
class Gallery extends StatelessWidget {
 
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  final List images = [ 'assets/Gallery/gallery1.jpg',
    'assets/Gallery/gallery2.jpg',
    'assets/Gallery/gallery3.jpg'];

  @override
  Widget build(BuildContext context) {
    


    return Scaffold(
      drawer: Navbar(),
      /*appBar: PreferredSize(
    preferredSize: const Size.fromHeight(30),
    child: Container(color: Colors.blue ,),
  ),*/
  appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'Gallery',
          ),
        ),
      ),
      body:Swiper(
        itemHeight: 400,
        itemWidth: 400,
        itemBuilder: (BuildContext context,int index ){
          return Image.asset(images[index]);
        },
      
        itemCount: images.length,
        pagination: SwiperPagination(
          

          
        ),
        control: SwiperControl(),
        containerHeight: 400,
        containerWidth: 400,
      ),
    

      
    );
  }
}
*/
//import 'package:flutter/material.dart';

/*
class Gallery extends StatelessWidget {
  final List<String> photoUrls = ['assets/Gallery/gallery1.jpg',
    'assets/Gallery/gallery2.jpg',
    'assets/Gallery/gallery3.jpg'];

  final List<String> videoUrls = ['assets/Gallery/gallery1.jpg',
    'assets/Gallery/gallery2.jpg',
    'assets/Gallery/gallery3.jpg'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery'),
      ),
      body: Column(
        children: [
          // Top Half: Display Photos
          Expanded(
            child: Swiper(
              itemCount: photoUrls.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(photoUrls[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
              pagination: SwiperPagination(), // Optional: Add pagination dots
            ),
          ),
          // Bottom Half: Display Videos
          Expanded(
            child: Swiper(
              itemCount: videoUrls.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  // Customize video item appearance as needed
                  child: ListTile(
                    title: Text('Video ${index + 1}'),
                    onTap: () {
                      // Add code to play the video when tapped
                      // You might navigate to a video player screen
                      // or use a video player widget here.
                    },
                  ),
                );
              },
              pagination: SwiperPagination(), // Optional: Add pagination dots
            ),
          ),
        ],
      ),
    );
  }
}
*/


class Gallery extends StatelessWidget {
  final List<String> photoUrls = [
    'assets/Gallery/gallery1.jpg',
    'assets/Gallery/gallery2.jpg',
    'assets/Gallery/gallery3.jpg',
    
    // Add more photo URLs as needed
  ];

  final List<String> videoUrls = [
    'assets/Gallery/gallery1.jpg',
    'assets/Gallery/gallery2.jpg',
    'assets/Gallery/gallery3.jpg'
    // Add more video URLs as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery'),
      ),
      body: Column(
        children: [
          // Top Half: Display Photos using Swiper
          Expanded(
            child: Swiper(
              itemCount: photoUrls.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(photoUrls[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
              pagination: SwiperPagination(), // Optional: Add pagination dots
            ),
          ),
          // Bottom Half: Display Videos using Swiper with Chewie
          Expanded(
            child: Swiper(
              itemCount: videoUrls.length,
              itemBuilder: (BuildContext context, int index) {
                return ChewieListItem(videoUrl: videoUrls[index]);
              },
              pagination: SwiperPagination(), // Optional: Add pagination dots
            ),
          ),
        ],
      ),
    );
  }
}

class ChewieListItem extends StatefulWidget {
  final String videoUrl;

  ChewieListItem({required this.videoUrl});

  @override
  _ChewieListItemState createState() => _ChewieListItemState();
}

class _ChewieListItemState extends State<ChewieListItem> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 16 / 9,
      autoPlay: false,
      looping: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Chewie(controller: _chewieController);
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }
}