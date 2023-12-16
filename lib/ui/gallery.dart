import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class Gallery extends StatelessWidget {
 
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  final List images = [ 'assets/Gallery/gallery1.jpg',
    'assets/Gallery/gallery2.jpg',
    'assets/Gallery/gallery3.jpg'];

  @override
  Widget build(BuildContext context) {
    


    return Scaffold(
      appBar: PreferredSize(
    preferredSize: const Size.fromHeight(30),
    child: Container(color: Colors.blue ,),
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