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
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) =>
              FittedBox(child: Icon(emptyIconData)),
        ),
      ),
    );
  }
}
