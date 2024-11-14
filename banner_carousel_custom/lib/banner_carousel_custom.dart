library banner_carousel;
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class BannerCarousel extends StatefulWidget {
  final List<String> imagePaths;
  final double borderRadius;
  final double height;
  const BannerCarousel(
      {super.key,
      required this.imagePaths,
      this.borderRadius = 12.0,
       this.height=120});

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: widget.height,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            child: PageView.builder(
              controller: PageController(viewportFraction: 1.0),
              onPageChanged: (value) => setState(() => _currentPage = value),
              itemCount: widget.imagePaths.length,
              itemBuilder: (context, index) {
                return Image.asset(
                  widget.imagePaths[index],
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
        ),
        Positioned(
          bottom:
              BorderSide.strokeAlignOutside + 5, 
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              widget.imagePaths.length,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    color: _currentPage == index ? Vx.amber500 : Colors.white,
                    shape: BoxShape.circle,
                  ),
                  width: 6.0,
                  height: 6.0, 
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
