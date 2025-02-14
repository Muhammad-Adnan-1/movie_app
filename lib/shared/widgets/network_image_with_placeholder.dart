import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movies_app/core/utils/api_config.dart';
import 'package:movies_app/shared/assets/my_images.dart';

class NetworkImageWithPlaceHolder extends StatelessWidget {
  final String? imageUrl;
  final double width;
  final double height;
  final BoxFit fit;

  const NetworkImageWithPlaceHolder({
    Key? key,
    required this.imageUrl,
    this.width = 100,
    this.height = 100,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return imageUrl == null
        ? Image.asset(
            MyImages.placeHolder,
            width: width,
            height: height,
            fit: fit,
          )
        : CachedNetworkImage(
            imageUrl: "${ApiConfig.posterUrl}$imageUrl",
            width: width,
            height: height,
            fit: fit,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => Image.asset(
              MyImages.placeHolder,
              width: width,
              height: height,
              fit: fit,
            ),
          );
  }
}
