enum PhotoPosition {
  front('assets/images/camera_front.png',
      'assets/images/camera_overlay_front.png'),
  left(
      'assets/images/camera_left.png', 'assets/images/camera_overlay_left.png'),
  back(
      'assets/images/camera_back.png', 'assets/images/camera_overlay_back.png'),
  right('assets/images/camera_right.png',
      'assets/images/camera_overlay_right.png');

  final String iconPath;
  final String overlayPath;
  const PhotoPosition(this.iconPath, this.overlayPath);
}
