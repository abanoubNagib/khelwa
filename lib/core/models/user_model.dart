
class User {
  int? id;
  String? fName;
  String? lName;
  String? email;
  String? phone;
  String? image;
  String? userRandomKey;
  String? dateOfBirth;
  String? genderIndex;
  String? token;
  bool? isActivated;
  String? message;


  User({
    this.id,
    this.fName,
    this.lName,
    this.email,
    this.phone,
    this.image,
    this.userRandomKey,
    this.dateOfBirth,
    this.genderIndex,
    this.token,
    this.isActivated,
    this.message,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fName = json['f_name'] == '' ? null : json['f_name'];
    lName = json['l_name'] == '' ? null : json['l_name'];
    email = json['email'] == '' ? null : json['email'];
    phone = json['phone'];
    image = json['image'];
    userRandomKey = json['user_random_key'] == '' ? null : json['user_random_key'];
    dateOfBirth = json['date_of_birth'] == '' ? null : json['date_of_birth'];
    genderIndex = json['gender_index'] ?? '1';
    token = json['token'] == '' ? null : json['token'];
  }

  User.fromOtpJson(Map<String, dynamic> json) {
    phone = json['phone'].toString();
    isActivated = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['f_name'] = fName == '' ? null : fName;
    data['l_name'] = lName == '' ? null : lName;
    data['email'] = email == '' ? null : email;
    data['phone'] = phone;
    data['image'] = image;
    data['user_random_key'] = userRandomKey == '' ? null : userRandomKey;
    data['date_of_birth'] = dateOfBirth == '' ? null : dateOfBirth;
    data['gender_index'] = genderIndex;
    data['gender'] = genderIndex;
    data['token'] = token == '' ? null : token;
    data['isActive'] = isActivated;
    return data;
  }

  Map<String, dynamic> toOtpJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone'] = phone;
    data['isActive'] = isActivated;
    return data;
  }
}
