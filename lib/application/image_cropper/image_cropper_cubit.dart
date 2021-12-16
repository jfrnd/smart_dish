import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

part 'image_cropper_cubit.freezed.dart';
part 'image_cropper_state.dart';

@injectable
class ImageCropperCubit extends Cubit<ImageCropperState> {
  ImageCropperCubit(this._imagePicker)
      : super(const ImageCropperState.initial());
  final ImagePicker _imagePicker;

  Future<void> onLoadNewImageClicked() async {
    final pickedFile = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 400,
    );
    if (pickedFile != null) {
      final imageData = await pickedFile.readAsBytes();
      emit(ImageCropperState.newImageLoaded(imageData));
    }
  }

  Future<void> onCropNewImageClicked(Uint8List imageData) async {
    emit(ImageCropperState.newImageCropped(imageData));
  }

  Future<void> cropperOpened() async {
    emit(const ImageCropperState.cropperOpened());
  }
}
