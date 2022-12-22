import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class LoadImage extends StatelessWidget {
  final String imageUrl;
  final String placholder;
  final Color? color;
  final BoxFit? fit;

  const LoadImage({
    Key? key,
    required this.imageUrl,
    required this.placholder,
    this.color,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_null_comparison
    return imageUrl == null
        ? Image.asset(
            placholder,
            fit: fit,
            color: color,
          )
        : CachedNetworkImage(
            maxHeightDiskCache: 300,
            fit: fit,
            // color: color,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Center(
                    child: CircularProgressIndicator(
                  value: downloadProgress.progress,
                  color: Theme.of(context).primaryColor,
                ),),
            errorWidget: (context, url, error) => Image.asset(
                  placholder,
                  fit: fit,
                  color: color,
                ),
            imageUrl: imageUrl,);
  }
}
