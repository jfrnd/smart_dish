import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:crop_your_image/crop_your_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_dish/application/image_cropper/image_cropper_cubit.dart';
import 'package:smart_dish/di/injection.dart';
import 'package:smart_dish/utils/logger.dart';

class CropableImage extends StatelessWidget {
  final String initialImageUrl;
  final Function(Uint8List image) onNewImageLoaded;
  final bool isEnabled;

  const CropableImage({
    Key? key,
    required this.initialImageUrl,
    required this.onNewImageLoaded,
    this.isEnabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ImageCropperCubit>(),
      child: BlocConsumer<ImageCropperCubit, ImageCropperState>(
        listener: (context, state) {
          state.maybeMap(
            newImageLoaded: (state) {
              context.read<ImageCropperCubit>().cropperOpened();
              showDialog(
                context: context,
                builder: (newContext) {
                  final _controller = CropController();
                  return Dialog(
                    backgroundColor: Colors.grey[100],
                    insetPadding: const EdgeInsets.all(16),
                    child: SizedBox(
                      width: 400,
                      child: Column(
                        children: [
                          Expanded(
                            child: Crop(
                              image: state.imageData,
                              controller: _controller,
                              onCropped: (image) {
                                context
                                    .read<ImageCropperCubit>()
                                    .onCropNewImageClicked(image);
                              },
                              withCircleUi: true,
                              baseColor: Colors.grey[500]!,
                              onMoved: (newRect) {},
                              onStatusChanged: (status) {},
                              cornerDotBuilder: (size, edgeAlignment) =>
                                  const DotControl(color: Colors.blue),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: MaterialButton(
                                    height: 50,
                                    child: const Text("Crop & Submit"),
                                    minWidth: double.infinity,
                                    color: Colors.grey[300],
                                    onPressed: () {
                                      _controller.crop();
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: MaterialButton(
                                    height: 50,
                                    child: const Text("Cancel"),
                                    minWidth: double.infinity,
                                    color: Colors.grey[300],
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            newImageCropped: (state) => onNewImageLoaded(state.imageData),
            orElse: () => null,
          );
        },
        builder: (context, state) {
          return ListTile(
            onTap: isEnabled
                ? () =>
                    context.read<ImageCropperCubit>().onLoadNewImageClicked()
                : null,
            title: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipOval(
                  child: Container(
                    color: Colors.grey[300],
                    height: 200,
                    width: 200,
                    child: state.maybeMap(
                      orElse: () => initialImageUrl.isEmpty
                          ? const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: FittedBox(
                                  child: Icon(
                                Icons.add_photo_alternate,
                              )),
                            )
                          : CachedNetworkImage(
                              imageUrl: initialImageUrl,
                              fit: BoxFit.cover,
                              progressIndicatorBuilder:
                                  (context, url, progress) {
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: progress.totalSize != null
                                        ? progress.downloaded /
                                            progress.totalSize!
                                        : null,
                                  ),
                                );
                              },
                              errorWidget: (context, url, error) {
                                logger.e(error);
                                return const FittedBox(
                                  child: Icon(
                                    Icons.error,
                                    color: Colors.red,
                                  ),
                                );
                              },
                            ),
                      newImageCropped: (state) => Image.memory(
                        state.imageData,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
