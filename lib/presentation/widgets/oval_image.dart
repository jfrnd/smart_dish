import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class OvalImage extends StatelessWidget {
  final String imageUrl;
  final IconData emptyIconData;
  final double? size;
  const OvalImage(
    this.imageUrl, {
    Key? key,
    this.emptyIconData = Icons.image,
    this.size = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: SizedBox(
        height: size,
        width: size,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          errorWidget: (context, url, error) =>
              FittedBox(child: Icon(emptyIconData)),
          progressIndicatorBuilder: (context, url, progress) {
            return Center(
              child: CircularProgressIndicator(
                value: progress.totalSize != null
                    ? progress.downloaded / progress.totalSize!
                    : null,
              ),
            );
          },
        ),
      ),
    );
  }
}
