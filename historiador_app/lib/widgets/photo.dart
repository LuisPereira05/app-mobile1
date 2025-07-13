class Photo {
  const Photo({
    required this.assetName,
    required this.isLocal,
    required this.title,
    required this.subtitle,
  });

  final String assetName;
  final bool isLocal;
  final String title;
  final String subtitle;
}
