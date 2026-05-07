import 'package:flutter/material.dart';

// class ThreePartCircleImage extends StatelessWidget {
//   final String leftImage;
//   final String topRightImage;
//   final String bottomRightImage;
//   final double size;
//   final double gap; // new gap parameter

//   const ThreePartCircleImage({
//     super.key,
//     required this.leftImage,
//     required this.topRightImage,
//     required this.bottomRightImage,
//     this.size = 50,
//     this.gap = 2, // default small white gap
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ClipOval(
//       child: SizedBox(
//         width: size,
//         height: size,
//         child: Row(
//           children: [
//             // Left half (full height)
//             Expanded(
//               child: Padding(
//                 padding: EdgeInsets.only(right: gap),
//                 child: Image.asset(leftImage, fit: BoxFit.cover, height: size),
//               ),
//             ),
//             // Right half (split vertically into 2 parts)
//             Expanded(
//               child: Column(
//                 children: [
//                   Expanded(
//                     child: Padding(
//                       padding: EdgeInsets.only(bottom: gap / 2),
//                       child: Image.asset(
//                         topRightImage,
//                         fit: BoxFit.cover,
//                         width: size / 2,
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Padding(
//                       padding: EdgeInsets.only(top: gap / 2),
//                       child: Image.asset(
//                         bottomRightImage,
//                         fit: BoxFit.cover,
//                         width: size / 2,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class ThreePartCircleTemplate extends StatelessWidget {
  final Widget leftChild;
  final Widget topRightChild;
  final Widget bottomRightChild;
  final double size;
  final double gap;

  const ThreePartCircleTemplate({
    super.key,
    required this.leftChild,
    required this.topRightChild,
    required this.bottomRightChild,
    this.size = 100,
    this.gap = 2,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: SizedBox(
        width: size,
        height: size,
        child: Row(
          children: [
            // Left half
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: gap),
                child: leftChild,
              ),
            ),
            // Right half split
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: gap / 2),
                      child: topRightChild,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: gap / 2),
                      child: bottomRightChild,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
