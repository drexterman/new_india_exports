
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:login_flutter/ui/signup.dart';
// import '../screens/login_screen.dart';
// import './Signup.dart';

class intro extends StatefulWidget {
  const intro({Key? key}) : super(key: key);

  @override
  _introState createState() => _introState();
}

class _introState extends State<intro> {
  void GoToLogi(BuildContext ctx) {
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
      return Signup();
    }));
  }

  @override
  Widget build(BuildContext context) {
    PageDecoration getpagedeco() => PageDecoration(
          imageAlignment: Alignment.topCenter,
          imagePadding: EdgeInsets.only(
            top: 50,
          ),
        );

    return Scaffold(
      body: IntroductionScreen(
        globalBackgroundColor: Color.fromARGB(255, 236, 231, 223),
        pages: [
          PageViewModel(
            title: 'Export',
            body:
                'Aalo lelo , kande lelo ',
            // image: Image.asset(
            //   'assets/donations.jpg',
            //   fit: BoxFit.contain,
            // ),
            decoration: getpagedeco(),
          ),
          PageViewModel(
            title: 'Export 2' ,
            body:
                'Haldi lelo',
            // image: Image.asset(
            //   'assets/campaign.jpg',
            //   fit: BoxFit.contain,
            // ),
            decoration: getpagedeco(),
          ),
          PageViewModel(
            title: 'Raise Funds',
            body:
                'Quote batao ',
            // image: Image.asset(
            //   'assets/dollar.jpg',
            //   fit: BoxFit.contain,
            // ),
            decoration: getpagedeco(),
          ),
        ],
        onDone: () => GoToLogi(context),
        onSkip: () {
          // You can also override onSkip callback
        },
        showSkipButton: false,
        showNextButton: false,
        skip: const Icon(Icons.skip_next_rounded),
        next: const Icon(Icons.next_plan_outlined),
        done: const Text("Done",
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontFamily: 'ReadexPro-SemiBold',
                fontSize: 20,
                color: Color.fromARGB(255,229, 114, 38))),
        dotsDecorator: DotsDecorator(  //this is used to design the dots at bottom of the page which indicates which page you are on
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            activeColor: Color.fromARGB(255, 229, 114, 38),
            color: Colors.black26,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0))),
      ),
    );
  }
}
