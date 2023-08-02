// ignore_for_file: public_member_api_docs, sort_constructors_first

class AvatarDataModel {
  final int id;
  final String img;
  final String name;
  bool select;
  AvatarDataModel({
    this.select = false,
    required this.id,
    required this.img,
    required this.name,
  });
}
