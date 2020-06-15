import 'package:equatable/equatable.dart' show Equatable;

class PictureEntity extends Equatable {
  final int height;
  final int width;
  final bool isSilhouette;
  final String url;

  PictureEntity({
    this.height,
    this.width,
    this.isSilhouette,
    this.url,
  });

  @override
  List<Object> get props => [height, width, isSilhouette, url];
}
