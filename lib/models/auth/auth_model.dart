class AuthModel {
  AuthModel({
    required this.message,
    required this.data,
  });
  late final String message;
  late final AuthModel_Data? data;

  AuthModel.fromJson(Map<String, dynamic> json){
    message = json['message'];
    data = AuthModel_Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['data'] = data!.toJson();
    return _data;
  }
}

class AuthModel_Data {
  AuthModel_Data({
    required this.user,
    required this.subscription,
    required this.token,
  });
  late final User user;
  late final Subscription subscription;
  late final String token;

  AuthModel_Data.fromJson(Map<String, dynamic> json){
    user = User.fromJson(json['user']);
    subscription = Subscription.fromJson(json['subscription']);
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user'] = user.toJson();
    _data['subscription'] = subscription.toJson();
    _data['token'] = token;
    return _data;
  }
}

class User {
  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.jollyEmail,
    required this.country,
    required this.personalizations,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String firstName;
  late final String lastName;
  late final String phoneNumber;
  late final String email;
  late final String jollyEmail;
  late final String country;
  late final List<String> personalizations;
  late final String createdAt;
  late final String updatedAt;

  User.fromJson(Map<String, dynamic> json){
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    jollyEmail = json['jolly_email'];
    country = json['country'];
    personalizations = List.castFrom<dynamic, String>(json['personalizations']);
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['phone_number'] = phoneNumber;
    _data['email'] = email;
    _data['jolly_email'] = jollyEmail;
    _data['country'] = country;
    _data['personalizations'] = personalizations;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class Subscription {
  Subscription({
    required this.id,
    required this.user_Id,
    required this.userId,
    required this.effectiveTime,
    required this.expiryTime,
    required this.updateTime,
    required this.isOTC,
    required this.productId,
    required this.serviceId,
    required this.spId,
    required this.statusCode,
    this.chargeMode,
    this.chargeNumber,
    this.referenceId,
    required this.details,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final int user_Id;
  late final String userId;
  late final String effectiveTime;
  late final String expiryTime;
  late final String updateTime;
  late final String isOTC;
  late final String productId;
  late final String serviceId;
  late final String spId;
  late final String statusCode;
  late final Null chargeMode;
  late final Null chargeNumber;
  late final Null referenceId;
  late final Details details;
  late final String createdAt;
  late final String updatedAt;

  Subscription.fromJson(Map<String, dynamic> json){
    id = json['id'];
    user_Id = json['user_id'];
    userId = json['userId'];
    effectiveTime = json['effectiveTime'];
    expiryTime = json['expiryTime'];
    updateTime = json['updateTime'];
    isOTC = json['isOTC'];
    productId = json['productId'];
    serviceId = json['serviceId'];
    spId = json['spId'];
    statusCode = json['statusCode'];
    chargeMode = null;
    chargeNumber = null;
    referenceId = null;
    details = Details.fromJson(json['details']);
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user_id'] = user_Id;
    _data['userId'] = userId;
    _data['effectiveTime'] = effectiveTime;
    _data['expiryTime'] = expiryTime;
    _data['updateTime'] = updateTime;
    _data['isOTC'] = isOTC;
    _data['productId'] = productId;
    _data['serviceId'] = serviceId;
    _data['spId'] = spId;
    _data['statusCode'] = statusCode;
    _data['chargeMode'] = chargeMode;
    _data['chargeNumber'] = chargeNumber;
    _data['referenceId'] = referenceId;
    _data['details'] = details.toJson();
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class Details {
  Details({
    required this.id,
    required this.code,
    required this.title,
    required this.amount,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String code;
  late final String title;
  late final int amount;
  late final String createdAt;
  late final String updatedAt;

  Details.fromJson(Map<String, dynamic> json){
    id = json['id'];
    code = json['code'];
    title = json['title'];
    amount = json['amount'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['code'] = code;
    _data['title'] = title;
    _data['amount'] = amount;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}