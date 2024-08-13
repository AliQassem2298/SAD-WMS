class CategoryModel {
  final int id;
  final String name;
  final String description;
  final String photo;

  CategoryModel({
    required this.id,
    required this.name,
    required this.description,
    required this.photo,
  });

  factory CategoryModel.fromJson(jsonData) {
    return CategoryModel(
      id: jsonData['id'],
      name: jsonData['name'],
      description: jsonData['description'],
      photo: jsonData['photo'],
    );
  }
}
