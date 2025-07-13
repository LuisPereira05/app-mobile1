import 'dart:io';

import 'package:flutter/material.dart';
import 'grid_list.dart';
import '../photo.dart';

class GridPhotoItem extends StatelessWidget {
  final Photo photo;
  final bool isLocal;
  final GridListType tileStyle;

  const GridPhotoItem({super.key ,required this.photo, required this.isLocal, required this.tileStyle});



  @override
  Widget build(BuildContext context) {
    Widget image;
    if (isLocal) {
      image = Image.file(
        File(photo.assetName), // Assuming photo.assetName is the local file path
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          print("----------------------------ERRO AO CARREGAR FOTO: $stackTrace");
          return const Center(child: Icon(Icons.broken_image));
        },
      );
      
    } else {
      image = Image.network(
        photo.assetName,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return Center(child: CircularProgressIndicator());
        },
        errorBuilder: (context, error, stackTrace) {
          print("----------------------------ERRO AO CARREGAR FOTO: " + stackTrace.toString());
          return const Center(child: Icon(Icons.broken_image));
        },
      );
    }
    

    return switch (tileStyle) {
      GridListType.imageOnly => image,
      GridListType.header => GridTile(
        header: Material(
          color: Colors.transparent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(4)),
          ),
          clipBehavior: Clip.antiAlias,
          child: GridTileBar(
            title: GridTitleText(text:photo.title),
            backgroundColor: Colors.black45,
          ),
        ),
        child: image,
      ),
      GridListType.footer => GridTile(
        footer: Material(
          color: Colors.transparent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(4)),
          ),
          clipBehavior: Clip.antiAlias,
          child: GridTileBar(
            backgroundColor: Colors.black45,
            title: GridTitleText(text:photo.title),
            subtitle: GridTitleText(text:photo.subtitle),
          ),
        ),
        child: image,
      ),
    };
  }
}

/// Allow the text size to shrink to fit in the space.
class GridTitleText extends StatelessWidget {
  const GridTitleText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: AlignmentDirectional.centerStart,
      child: Text(text),
    );
  }
}