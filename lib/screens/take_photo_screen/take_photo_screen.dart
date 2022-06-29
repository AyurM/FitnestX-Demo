import 'package:camera/camera.dart';
import 'package:fitnest_x/res/views/take_photo/camera_action_panel.dart';
import 'package:fitnest_x/res/views/take_photo/photo_position_selector.dart';
import 'package:fitnest_x/utils/photo_position.dart';
import 'package:flutter/material.dart';

const _kActionPanelOffset = Offset(40, 20);

class TakePhotoScreen extends StatefulWidget {
  final CameraDescription camera;

  const TakePhotoScreen({Key? key, required this.camera}) : super(key: key);

  @override
  State<TakePhotoScreen> createState() => _TakePhotoScreenState();
}

class _TakePhotoScreenState extends State<TakePhotoScreen> {
  late CameraController controller;
  late Future<void> _initializeControllerFuture;
  PhotoPosition photoPosition = PhotoPosition.values[0];

  @override
  void initState() {
    super.initState();

    controller = CameraController(widget.camera, ResolutionPreset.max,
        enableAudio: false);
    _initializeControllerFuture = controller.initialize();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: [
                Expanded(
                  child: CameraPreview(
                    controller,
                    child: Positioned(
                      left: _kActionPanelOffset.dx,
                      right: _kActionPanelOffset.dx,
                      bottom: _kActionPanelOffset.dy,
                      child: CameraActionPanel(
                          bottomOffset: _kActionPanelOffset.dy,
                          photoPosition: photoPosition),
                    ),
                  ),
                ),
                PhotoPositionSelector(
                    onSelect: _onPhotoPositionSelect,
                    selectedPosition: photoPosition)
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  void _onPhotoPositionSelect(PhotoPosition mode) =>
      setState(() => photoPosition = mode);
}
