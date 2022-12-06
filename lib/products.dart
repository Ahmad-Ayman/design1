class Product {
  List<Data>? data;
  int? status;
  String? message;

  Product({this.data, this.status, this.message});

  Product.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String? sId;
  String? title;
  int? price;
  Category? category;
  String? description;
  CreatedBy? createdBy;
  String? createdAt;
  String? updatedAt;
  String? slug;
  String? image;

  Data({this.sId, this.title, this.price, this.category, this.description, this.createdBy, this.createdAt, this.updatedAt, this.slug, this.image});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    price = json['price'];
    category = json['category'] != null ? new Category.fromJson(json['category']) : null;
    description = json['description'];
    createdBy = json['createdBy'] != null ? new CreatedBy.fromJson(json['createdBy']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    slug = json['slug'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['price'] = this.price;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['description'] = this.description;
    if (this.createdBy != null) {
      data['createdBy'] = this.createdBy!.toJson();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['slug'] = this.slug;
    data['image'] = this.image;
    return data;
  }
}

class Category {
  String? sId;
  String? name;
  String? slug;

  Category({this.sId, this.name, this.slug});

  Category.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['slug'] = this.slug;
    return data;
  }
}

class CreatedBy {
  String? role;
  String? sId;
  String? name;

  CreatedBy({this.role, this.sId, this.name});

  CreatedBy.fromJson(Map<String, dynamic> json) {
    role = json['role'];
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['role'] = this.role;
    data['_id'] = this.sId;
    data['name'] = this.name;
    return data;
  }
}
