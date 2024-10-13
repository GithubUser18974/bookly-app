import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:untitled/core/widgets/custome_loading_indecator.dart';

class CustomListViewItem extends StatelessWidget {
  const CustomListViewItem({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 2.6 / 4,
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          placeholder: (context, url) => CustomeLoadingIndecator(),
          imageUrl: imageUrl,
          errorWidget: (context, url, error) => Icon(
            Icons.error,
            color: Colors.yellow,
          ),
        ),
      ),
    );
  }
}
