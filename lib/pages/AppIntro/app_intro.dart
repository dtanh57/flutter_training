import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:namer_app/pages/AppIntro/models/slider_item.dart';
import 'package:namer_app/pages/HomePage/HomePage.dart';
import 'package:namer_app/pages/Login/login.dart';

class AppIntro extends StatefulWidget {
  const AppIntro({Key? key}) : super(key: key);

  @override
  AppIntroState createState() => AppIntroState();
}

class AppIntroState extends State<AppIntro> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    // Navigator.of(context).push(
    //   MaterialPageRoute(builder: (_) => Login()),
    // );
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) => Login(),
      ),
    );
  }

  Widget _buildFullscreenImage(String assetName) {
    return Image.asset(
      'assets/$assetName',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }

  List<SliderItem> items = [
    SliderItem('Slider 1', 'Body 1', 'flutter.jpg'),
    SliderItem('Slider 2', 'Body 2', 'flutter.jpg'),
    SliderItem('Slider 3', 'Body 3', 'flutter.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: true,
      autoScrollDuration: 3000,
      pages: items
          .map((e) => PageViewModel(
              title: ' ',
              image: _buildFullscreenImage(e.image),
              body: ' ',
              decoration: PageDecoration(
                  fullScreen: true,
                  contentMargin: EdgeInsets.all(0),
                  titleTextStyle: TextStyle(color: Colors.black),
                  bodyTextStyle: TextStyle(color: Colors.black))))
          .toList(),
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      nextStyle: ButtonStyle(
          iconColor: MaterialStateProperty.all<Color>(Colors.green)),
      skipStyle: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.green)),
      doneStyle: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.green)),
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back),
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Colors.grey,
        activeColor: Colors.green,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      rawPages: [].map((page) {
        // Tạo các trang custom với hình ảnh full screen
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/image1.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 100), // Khoảng cách từ trên xuống để đặt văn bản
              Text(
                page.title!,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                page.body!,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
