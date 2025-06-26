// ignore_for_file: sort_constructors_first

class ProfileModel {
  final int id;
  final String name;

  ProfileModel({required this.id, required this.name});

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(id: json['id'], name: json['name']);
  }

  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}
