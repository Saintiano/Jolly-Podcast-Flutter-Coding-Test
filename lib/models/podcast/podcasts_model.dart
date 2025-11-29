class PodcastsModel {
  PodcastsModel({
    required this.message,
    required this.data,
  });
  late final String message;
  late final PodcastsModel_Data? data;

  PodcastsModel.fromJson(Map<String, dynamic> json){
    message = json['message'];
    data = PodcastsModel_Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['data'] = data!.toJson();
    return _data;
  }
}

class PodcastsModel_Data {
  PodcastsModel_Data({
    required this.message,
    required this.data2,
  });
  late final String message;
  late final PodcastsModel_Data_Data data2;

  PodcastsModel_Data.fromJson(Map<String, dynamic> json){
    message = json['message'];
    data2 = PodcastsModel_Data_Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['data'] = data2.toJson();
    return _data;
  }
}

class PodcastsModel_Data_Data {
  PodcastsModel_Data_Data({
    required this.data3,
    required this.currentPage,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    this.prevPageUrl,
    required this.to,
    required this.total,
  });
  late final List<PodcastsModel_Data_Data_Data> data3;
  late final int currentPage;
  late final String firstPageUrl;
  late final int from;
  late final int lastPage;
  late final String lastPageUrl;
  late final List<Links> links;
  late final String nextPageUrl;
  late final String path;
  late final int perPage;
  late final Null prevPageUrl;
  late final int to;
  late final int total;

  PodcastsModel_Data_Data.fromJson(Map<String, dynamic> json){
    data3 = List.from(json['data']).map((e)=>PodcastsModel_Data_Data_Data.fromJson(e)).toList();
    currentPage = json['current_page'];
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    links = List.from(json['links']).map((e)=>Links.fromJson(e)).toList();
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = null;
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data3.map((e)=>e.toJson()).toList();
    _data['current_page'] = currentPage;
    _data['first_page_url'] = firstPageUrl;
    _data['from'] = from;
    _data['last_page'] = lastPage;
    _data['last_page_url'] = lastPageUrl;
    _data['links'] = links.map((e)=>e.toJson()).toList();
    _data['next_page_url'] = nextPageUrl;
    _data['path'] = path;
    _data['per_page'] = perPage;
    _data['prev_page_url'] = prevPageUrl;
    _data['to'] = to;
    _data['total'] = total;
    return _data;
  }
}

class PodcastsModel_Data_Data_Data {
  PodcastsModel_Data_Data_Data({
    required this.id,
    required this.userId,
    required this.title,
    required this.author,
    required this.categoryName,
    required this.categoryType,
    required this.pictureUrl,
    this.coverPictureUrl,
    required this.description,
    this.embeddablePlayerSettings,
    required this.createdAt,
    required this.updatedAt,
    required this.subscriberCount,
    required this.publisher,
  });
  late final int id;
  late final int userId;
  late final String title;
  late final String author;
  late final String categoryName;
  late final String categoryType;
  late final String pictureUrl;
  late final String? coverPictureUrl;
  late final String description;
  late final Null embeddablePlayerSettings;
  late final String createdAt;
  late final String updatedAt;
  late final int subscriberCount;
  late final Publisher publisher;

  PodcastsModel_Data_Data_Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    userId = json['user_id'];
    title = json['title'];
    author = json['author'];
    categoryName = json['category_name'];
    categoryType = json['category_type'];
    pictureUrl = json['picture_url'];
    coverPictureUrl = json['cover_picture_url'];
    description = json['description'];
    embeddablePlayerSettings = null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    subscriberCount = json['subscriber_count'];
    publisher = Publisher.fromJson(json['publisher']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user_id'] = userId;
    _data['title'] = title;
    _data['author'] = author;
    _data['category_name'] = categoryName;
    _data['category_type'] = categoryType;
    _data['picture_url'] = pictureUrl;
    _data['cover_picture_url'] = coverPictureUrl;
    _data['description'] = description;
    _data['embeddable_player_settings'] = embeddablePlayerSettings;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['subscriber_count'] = subscriberCount;
    _data['publisher'] = publisher.toJson();
    return _data;
  }
}

class Publisher {
  Publisher({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.companyName,
    required this.email,
    this.profileImageUrl,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String firstName;
  late final String lastName;
  late final String companyName;
  late final String email;
  late final Null profileImageUrl;
  late final String createdAt;
  late final String updatedAt;

  Publisher.fromJson(Map<String, dynamic> json){
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    companyName = json['company_name'];
    email = json['email'];
    profileImageUrl = null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['company_name'] = companyName;
    _data['email'] = email;
    _data['profile_image_url'] = profileImageUrl;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class Links {
  Links({
    this.url,
    required this.label,
    required this.active,
  });
  late final String? url;
  late final String label;
  late final bool active;

  Links.fromJson(Map<String, dynamic> json){
    url = null;
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['url'] = url;
    _data['label'] = label;
    _data['active'] = active;
    return _data;
  }
}