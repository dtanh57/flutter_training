import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Align(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              'About us',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Expanded(
          child: Scrollbar(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Text(
                      'Weve published well over 3,000 articles since 2006. Theres not enough caffeine on the planet to get you through all of that this weekend. Or even this month. So let us help you out. Wed love to take you by the hand and show you the most important articles that will help you master content-driven marketing, based on your specific goals and experience. Want to attract tons of hungry prospects to your business? Weve got lots of advice to help with that. Like to double your freelance fees this year? Lets make that happen for you. Need to wildly impress your boss before your next performance review? No problem, we can get you there. You could spend the next weeks or months bingeing on our content — and hey, we think that would be well worth your time. But wed rather point you to the exact material that will help you get what you need from content marketing. Because when you get the exact right information, you can immediately begin to up your game as a content writer. And thats whats going to get you the results you want.Weve published well over 3,000 articles since 2006. Theres not enough caffeine on the planet to get you through all of that this weekend. Or even this month. So let us help you out. Wed love to take you by the hand and show you the most important articles that will help you master content-driven marketing, based on your specific goals and experience. Want to attract tons of hungry prospects to your business? Weve got lots of advice to help with that. Like to double your freelance fees this year? Lets make that happen for you. Need to wildly impress your boss before your next performance review? No problem, we can get you there. You could spend the next weeks or months bingeing on our content — and hey, we think that would be well worth your time. But wed rather point you to the exact material that will help you get what you need from content marketing. Because when you get the exact right information, you can immediately begin to up your game as a content writer. And thats whats going to get you the results you want.Weve published well over 3,000 articles since 2006. Theres not enough caffeine on the planet to get you through all of that this weekend. Or even this month. So let us help you out. Wed love to take you by the hand and show you the most important articles that will help you master content-driven marketing, based on your specific goals and experience. Want to attract tons of hungry prospects to your business? Weve got lots of advice to help with that. Like to double your freelance fees this year? Lets make that happen for you. Need to wildly impress your boss before your next performance review? No problem, we can get you there. You could spend the next weeks or months bingeing on our content — and hey, we think that would be well worth your time. But wed rather point you to the exact material that will help you get what you need from content marketing. Because when you get the exact right information, you can immediately begin to up your game as a content writer. And thats whats going to get you the results you want.',
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
