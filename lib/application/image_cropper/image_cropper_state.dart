part of 'image_cropper_cubit.dart';

@freezed
class ImageCropperState with _$ImageCropperState {
  const factory ImageCropperState.initial() = _Initial;
  const factory ImageCropperState.newImageLoaded(Uint8List imageData) =
      _NewImageLoaded;
  const factory ImageCropperState.cropperOpened() = _CropperOpened;
  const factory ImageCropperState.newImageCropped(Uint8List imageData) =
      _NewImageCropped;
}
