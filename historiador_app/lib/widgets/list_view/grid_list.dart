import 'package:flutter/material.dart';
import 'grid_list_items.dart';
import '../photo.dart';

class GridList extends StatelessWidget {
  final GridListType type;
  final List<Photo> photos;
  final bool isLocal;
  final void Function(Photo) onTap;

  const GridList({
    super.key,
    required this.type,
    required this.photos,
    required this.isLocal,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      restorationId: 'grid_view_demo_grid_offset',
      crossAxisCount: 2,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      padding: const EdgeInsets.all(8),
      childAspectRatio: 1,
      children: photos.map((photo) {
        return GestureDetector(
          onTap: () => onTap(photo),
          child: GridPhotoItem(
            photo: photo,
            tileStyle: type,
            isLocal: isLocal,
          ),
        );
      }).toList(),
    );
  }
}

enum GridListType { imageOnly, header, footer }
