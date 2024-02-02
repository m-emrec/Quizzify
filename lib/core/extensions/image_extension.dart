extension ImageExtension on String {
  String get _path => "lib/core/assets/images/";
  String get toPng => "$_path$this.png";
}
