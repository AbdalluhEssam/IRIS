class NotificationModel {
  String? notificationId;
  String? message;
  String? sender;
  String? date;
  String? userId;
  String? usersName;
  String? usersEmail;
  String? usersPassword;
  String? gender;
  String? dateOfBirth;
  String? age;
  String? usersPhone;
  String? abilityToTalk;
  String? abilityToListen;
  String? image;
  String? bloodType;
  String? oxygenRatio;
  String? heartRate;
  String? accountType;
  String? dateOfRegistration;
  String? liveLink;

  NotificationModel(
      {this.notificationId,
        this.message,
        this.sender,
        this.date,
        this.userId,
        this.usersName,
        this.usersEmail,
        this.usersPassword,
        this.gender,
        this.dateOfBirth,
        this.age,
        this.usersPhone,
        this.abilityToTalk,
        this.abilityToListen,
        this.image,
        this.bloodType,
        this.oxygenRatio,
        this.heartRate,
        this.accountType,
        this.dateOfRegistration,
        this.liveLink});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    notificationId = json['notification_id'].toString();
    message = json['message'].toString();
    sender = json['sender'].toString();
    date = json['date'].toString();
    userId = json['user_id'].toString();
    usersName = json['users_name'].toString();
    usersEmail = json['users_email'].toString();
    usersPassword = json['users_password'].toString();
    gender = json['gender'].toString();
    dateOfBirth = json['date_of_birth'].toString();
    age = json['age'].toString();
    usersPhone = json['users_phone'].toString();
    abilityToTalk = json['ability_to_talk'].toString();
    abilityToListen = json['ability_to_listen'].toString();
    image = json['image'].toString();
    bloodType = json['blood_type'].toString();
    oxygenRatio = json['oxygen_ratio'].toString();
    heartRate = json['heart_rate'].toString();
    accountType = json['account_type'].toString();
    dateOfRegistration = json['date_of_registration'].toString();
    liveLink = json['live_link'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notification_id'] = this.notificationId;
    data['message'] = this.message;
    data['sender'] = this.sender;
    data['date'] = this.date;
    data['user_id'] = this.userId;
    data['users_name'] = this.usersName;
    data['users_email'] = this.usersEmail;
    data['users_password'] = this.usersPassword;
    data['gender'] = this.gender;
    data['date_of_birth'] = this.dateOfBirth;
    data['age'] = this.age;
    data['users_phone'] = this.usersPhone;
    data['ability_to_talk'] = this.abilityToTalk;
    data['ability_to_listen'] = this.abilityToListen;
    data['image'] = this.image;
    data['blood_type'] = this.bloodType;
    data['oxygen_ratio'] = this.oxygenRatio;
    data['heart_rate'] = this.heartRate;
    data['account_type'] = this.accountType;
    data['date_of_registration'] = this.dateOfRegistration;
    data['live_link'] = this.liveLink;
    return data;
  }
}
