// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:cleaner/core/data/end_points.dart';
// import 'package:flutter/material.dart';
//
//
// class ImageUrlCheckerWidget extends StatelessWidget {
//   final String? imageUrl;
//   final double? width;
//   final double? height;
//   const ImageUrlCheckerWidget({
//     Key? key,
//     required this.imageUrl,
//     this.width,
//     this.height,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return imageUrl == null
//         ? const DefaultImage()
//         : CachedNetworkImage(
//       filterQuality: FilterQuality.low,
//       placeholderFadeInDuration: const Duration(seconds: 2),
//       imageUrl: EndPoint.baseURL + imageUrl!,
//       width: width,
//       height: height,
//       fit: BoxFit.cover,
//       placeholder: (_, __) => loader(),
//       errorWidget: (_, __, ___) => const DefaultImage(),
//     );
//   }
// }
