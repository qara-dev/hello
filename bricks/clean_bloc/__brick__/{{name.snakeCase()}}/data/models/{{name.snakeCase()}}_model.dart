class {{name.pascalCase()}}Model {
  final int id;
  final String name;

  {{name.pascalCase()}}Model({required this.id, required this.name});

  factory {{name.pascalCase()}}Model.fromJson(Map<String, dynamic> json) {
    return {{name.pascalCase()}}Model(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
  };
}
