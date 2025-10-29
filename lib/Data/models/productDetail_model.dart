/*
class ProductDetail {
  String? status;
  String? message;
  List<ProductData>? data;

  ProductDetail({this.status, this.message, this.data});

  ProductDetail.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ProductData>[];
      json['data'].forEach((v) {
        data!.add(ProductData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductData {
  int? id;
  String? name;
  String? extraNote;
  String? category;
  Brand? brand;
  String? description;
  String? price;
  List<String>? images;
  String? sizes;
  String? averageRating;
  int? totalReviews;
  String? createdAt;
  List<int>? wishers;

  ProductData({
    this.id,
    this.name,
    this.extraNote,
    this.category,
    this.brand,
    this.description,
    this.price,
    this.images,
    this.sizes,
    this.averageRating,
    this.totalReviews,
    this.createdAt,
    this.wishers,
  });

  ProductData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    extraNote = json['extra_note'];
    category = json['category'];
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    description = json['description'];
    price = json['price'];
    images = json['images'] != null ? List<String>.from(json['images']) : [];
    sizes = json['sizes'];
    averageRating = json['average_rating'];
    totalReviews = json['total_reviews'];
    createdAt = json['created_at'];
    wishers = json['wishers'] != null ? List<int>.from(json['wishers']) : [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['extra_note'] = extraNote;
    data['category'] = category;
    if (brand != null) {
      data['brand'] = brand!.toJson();
    }
    data['description'] = description;
    data['price'] = price;
    data ['images'] = images;
    data['sizes'] = sizes;
    data['average_rating'] = averageRating;
    data['total_reviews'] = totalReviews;
    data['created_at'] = createdAt;
    data['wishers'] = wishers;
    return data;
  }
}

class Brand {
  int? id;
  String? name;
  String? brandImage;

  Brand({this.id, this.name, this.brandImage});

  Brand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    brandImage = json['brand_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['brand_image'] = brandImage;
    return data;
  }
}
*/
class ProductDetail {
  String? status;
  String? message;
  List<ProductData>? data;

  ProductDetail({this.status, this.message, this.data});

  ProductDetail.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ProductData>[];
      json['data'].forEach((v) {
        data!.add(ProductData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class ProductData {
  int? id;
  String? name;
  String? extraNote;
  String? category;
  Brand? brand;
  String? description;
  String? price;
  List<String>? images;
  String? sizes;
  String? averageRating;
  int? totalReviews;
  String? createdAt;
  List<int>? wishers;

  ProductData({
    this.id,
    this.name,
    this.extraNote,
    this.category,
    this.brand,
    this.description,
    this.price,
    this.images,
    this.sizes,
    this.averageRating,
    this.totalReviews,
    this.createdAt,
    this.wishers,
  });

  ProductData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    extraNote = json['extra_note'];
    category = json['category'];
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    description = json['description'];
    price = json['price'];
    images = json['images'] != null ? List<String>.from(json['images']):[];
    sizes = json['sizes'];
    averageRating = json['average_rating'];
    totalReviews = json['total_reviews'];
    createdAt = json['created_at'];
    wishers = json['wishers'] != null ? List<int>.from(json['wishers']) : [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    map['id'] = id;
    map['name'] = name;
    map['extra_note'] = extraNote;
    map['category'] = category;
    if (brand != null) {
      map['brand'] = brand!.toJson();
    }
    map['description'] = description;
    map['price'] = price;
    map['images'] = images;
    map['sizes'] = sizes;
    map['average_rating'] = averageRating;
    map['total_reviews'] = totalReviews;
    map['created_at'] = createdAt;
    map['wishers'] = wishers;
    return map;
  }
}

class Brand {
  int? id;
  String? name;
  String? brandImage;

  Brand({this.id, this.name, this.brandImage});

  Brand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    brandImage = json['brand_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    map['id'] = id;
    map['name'] = name;
    map['brand_image'] = brandImage;
    return map;
  }
}


