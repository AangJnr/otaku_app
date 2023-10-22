import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

 
class CustomNetworkImageWidget extends StatelessWidget {
  final String label;
  final String url;
  final double radius;
  final Size size;
  final Color? backgroundColor;
  final BoxFit fit;
  final double fontSize;
  final bool usePlaceholderOnError;
  final String placeHolderUrl;
  final LinearGradient? gradient;
  const CustomNetworkImageWidget(
      {this.label = '',
      this.url = '',
      this.size = const Size(100, 100),
      this.backgroundColor,
      this.radius = 0,
      this.usePlaceholderOnError = false,
      this.placeHolderUrl = 'assets/logo/logo_dark.png',
      this.fontSize = 16,
      this.fit = BoxFit.cover,
      this.gradient,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: url.isEmpty
          ? _buildErrorWidget(context)
          : CachedNetworkImage(
              imageUrl: url,
              height: size.height,
              width: size.width,
              fit: fit,
              filterQuality: FilterQuality.high,
              errorWidget: (context, error, stackTrace) =>
                  _buildErrorWidget(context)),
    );
  }

  Widget _buildErrorWidget(BuildContext context) => SizedBox(
      height: size.height,
      width: size.width,
      child: Image.asset(
        placeHolderUrl,
        height: size.height,
        width: size.width,
        fit: fit,
      ));
}
