
class Category {
  Category({
    required this.id,
    required this.name,
    required this.image,
    required this.creationAt,
    required this.updatedAt,
  });
  late final int id;
  late final String name;
  late final String image;
  late final String creationAt;
  late final String updatedAt;
  
  Category.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    image = json['image'];
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['image'] = image;
    _data['creationAt'] = creationAt;
    _data['updatedAt'] = updatedAt;
    return _data;
  }
}