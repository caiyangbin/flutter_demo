import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ImageGalleryPage extends StatelessWidget {
  final list;

  ImageGalleryPage(this.list);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PhotoViewGallery.builder(
        scrollPhysics: const ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        builder: (BuildContext context, int index) {
          return PhotoViewGalleryPageOptions(
            minScale: PhotoViewComputedScale.contained,
            maxScale: 1.0,
            imageProvider: NetworkImage(list[index]),
            initialScale: PhotoViewComputedScale.contained ,
          );
        },
        itemCount: list.length,
        loadingBuilder: (context, event) => Container(
          color: Colors.black,
          child: Center(
            child: Container(
              width: 30.0,
              height: 30.0,
              child: CircularProgressIndicator(
                value: event == null
                    ? 0
                    : event.cumulativeBytesLoaded / event.expectedTotalBytes,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
