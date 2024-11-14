BannerCarousel

A customizable banner carousel widget for Flutter applications. This widget allows you to display a series of images in a carousel format with smooth transitions and customizable appearance.

Features
Image Carousel: Displays a list of images in a horizontally scrollable carousel.
Customizable Border Radius: Allows you to set the border radius of the images.
Page Indicator: Shows the current page with a customizable indicator.
Height Adjustment: Allows you to set the height of the carousel.
Installation
To use the BannerCarousel widget, you need to include it in your Flutter project. You can copy the widget code into your project or import it as a separate file.

Usage
Here is an example of how to use the BannerCarousel widget in your Flutter application:


import 'package:flutter/material.dart';
import 'banner_carousel.dart'; // Make sure to import the widget file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Banner Carousel Example'),
        ),
        body: Center(
          child: BannerCarousel(
            imagePaths: [
              'assets/images/image1.jpg',
              'assets/images/image2.jpg',
              'assets/images/image3.jpg',
            ],
            borderRadius: 12.0,
            height: 200.0,
          ),
        ),
      ),
    );
  }
}

Parameters
imagePaths: A list of strings representing the paths to the images you want to display in the carousel.
borderRadius: The border radius of the images. Default is 12.0.
height: The height of the carousel. Default is 120.0.
Dependencies
flutter/material.dart: The core Flutter package for building material design applications.
velocity_x/velocity_x.dart: A Flutter package for building UI with less code.
Make sure to add the velocity_x package to your pubspec.yaml file:


dependencies:
  flutter:
    sdk: flutter
  velocity_x: ^3.0.0

Customization
You can customize the appearance of the BannerCarousel widget by adjusting the borderRadius and height parameters. Additionally, you can modify the AnimatedContainer in the Positioned widget to change the appearance of the page indicator.