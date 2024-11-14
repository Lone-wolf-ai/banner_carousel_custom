import 'package:banner_carousel_custom/banner_carousel_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('BannerCarousel displays images and indicators correctly', (WidgetTester tester) async {
    final List<String> imagePaths = [
      'assets/images/image1.png',
      'assets/images/image2.png',
      'assets/images/image3.png',
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BannerCarousel(
            imagePaths: imagePaths,
            borderRadius: 12.0,
            height: 120.0,
          ),
        ),
      ),
    );

    for (final imagePath in imagePaths) {
      expect(find.byKey(Key(imagePath)), findsOneWidget);
    }

    final indicators = find.byType(AnimatedContainer);
    expect(indicators, findsNWidgets(imagePaths.length));

    final firstIndicator = tester.widget<AnimatedContainer>(indicators.first);
    expect(firstIndicator.decoration, isA<BoxDecoration>());
    expect((firstIndicator.decoration as BoxDecoration).color, equals(Colors.amber));

    await tester.drag(find.byType(PageView), const Offset(-300, 0));
    await tester.pumpAndSettle();

    final secondIndicator = tester.widget<AnimatedContainer>(indicators.at(1));
    expect(secondIndicator.decoration, isA<BoxDecoration>());
    expect((secondIndicator.decoration as BoxDecoration).color, equals(Colors.amber));
  });
}
