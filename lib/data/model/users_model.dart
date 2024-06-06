class UsersModel {
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

  UsersModel(
      {this.userId,
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

  UsersModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    usersName = json['users_name'];
    usersEmail = json['users_email'];
    usersPassword = json['users_password'];
    gender = json['gender'];
    dateOfBirth = json['date_of_birth'];
    age = json['age'];
    usersPhone = json['users_phone'];
    abilityToTalk = json['ability_to_talk'];
    abilityToListen = json['ability_to_listen'];
    image = json['image'];
    bloodType = json['blood_type'];
    oxygenRatio = json['oxygen_ratio'];
    heartRate = json['heart_rate'];
    accountType = json['account_type'];
    dateOfRegistration = json['date_of_registration'];
    liveLink = json['live_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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

class PermissionModel {
  String? id;
  String? name;

  PermissionModel({this.id, this.name});

  PermissionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    name = json['name'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}




class UserModel {
  String? usersId;
  String? usersName;
  String? usersEmail;
  String? usersPassword;
  String? usersPhone;
  String? usersVerfiycode;
  String? usersApprove;
  String? usersCreate;
  String? employeesId;
  String? employeesName;
  String? employeesAge;
  String? nationalid;
  String? employeesPhone;
  String? employeesPhoto;
  String? employeesStudy;
  String? jobDescription;
  String? startData;
  String? endData;
  String? employeesSalary;
  String? status;
  String? userId;
  String? createdAt;

  UserModel(
      {this.usersId,
        this.usersName,
        this.usersEmail,
        this.usersPassword,
        this.usersPhone,
        this.usersVerfiycode,
        this.usersApprove,
        this.usersCreate,
        this.employeesId,
        this.employeesName,
        this.employeesAge,
        this.nationalid,
        this.employeesPhone,
        this.employeesPhoto,
        this.employeesStudy,
        this.jobDescription,
        this.startData,
        this.endData,
        this.employeesSalary,
        this.status,
        this.userId,
        this.createdAt});

  UserModel.fromJson(Map<String, dynamic> json) {
    usersId = json['users_id'].toString();
    usersName = json['users_name'].toString();
    usersEmail = json['users_email'].toString();
    usersPassword = json['users_password'].toString();
    usersPhone = json['users_phone'].toString();
    usersVerfiycode = json['users_verfiycode'].toString();
    usersApprove = json['users_approve'].toString();
    usersCreate = json['users_create'].toString();
    employeesId = json['employees_id'].toString();
    employeesName = json['employees_name'].toString();
    employeesAge = json['employees_age'].toString();
    nationalid = json['nationalid'].toString();
    employeesPhone = json['employees_phone'].toString();
    employeesPhoto = json['employees_photo'].toString();
    employeesStudy = json['employees_study'].toString();
    jobDescription = json['job_description'].toString();
    startData = json['start_data'].toString();
    endData = json['end_data'].toString();
    employeesSalary = json['employees_salary'].toString();
    status = json['status'].toString();
    userId = json['user_id'].toString();
    createdAt = json['createdAt'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['users_id'] = this.usersId;
    data['users_name'] = this.usersName;
    data['users_email'] = this.usersEmail;
    data['users_password'] = this.usersPassword;
    data['users_phone'] = this.usersPhone;
    data['users_verfiycode'] = this.usersVerfiycode;
    data['users_approve'] = this.usersApprove;
    data['users_create'] = this.usersCreate;
    data['employees_id'] = this.employeesId;
    data['employees_name'] = this.employeesName;
    data['employees_age'] = this.employeesAge;
    data['nationalid'] = this.nationalid;
    data['employees_phone'] = this.employeesPhone;
    data['employees_photo'] = this.employeesPhoto;
    data['employees_study'] = this.employeesStudy;
    data['job_description'] = this.jobDescription;
    data['start_data'] = this.startData;
    data['end_data'] = this.endData;
    data['employees_salary'] = this.employeesSalary;
    data['status'] = this.status;
    data['user_id'] = this.userId;
    data['createdAt'] = this.createdAt;
    return data;
  }
}


class ProfileModel {
  String? model;
  String? regular;
  String? years;
  String? employeesId;
  String? employeesName;
  String? employeesAge;
  String? nationalid;
  String? employeesPhone;
  String? employeesPhoto;
  String? employeesStudy;
  String? jobDescription;
  String? startData;
  String? endData;
  String? employeesSalary;
  String? status;
  String? userId;
  String? createdAt;
  String? id;
  String? name;
  String? usersId;
  String? usersName;
  String? usersEmail;
  String? usersPassword;
  String? usersPhone;
  String? usersVerfiycode;
  String? usersApprove;
  String? usersCreate;

  ProfileModel(
      {this.model,
        this.regular,
        this.years,
        this.employeesId,
        this.employeesName,
        this.employeesAge,
        this.nationalid,
        this.employeesPhone,
        this.employeesPhoto,
        this.employeesStudy,
        this.jobDescription,
        this.startData,
        this.endData,
        this.employeesSalary,
        this.status,
        this.userId,
        this.createdAt,
        this.id,
        this.name,
        this.usersId,
        this.usersName,
        this.usersEmail,
        this.usersPassword,
        this.usersPhone,
        this.usersVerfiycode,
        this.usersApprove,
        this.usersCreate});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    model = json['model'].toString();
    regular = json['regular'].toString();
    years = json['years'].toString();
    employeesId = json['employees_id'].toString();
    employeesName = json['employees_name'].toString();
    employeesAge = json['employees_age'].toString();
    nationalid = json['nationalid'].toString();
    employeesPhone = json['employees_phone'].toString();
    employeesPhoto = json['employees_photo'].toString();
    employeesStudy = json['employees_study'].toString();
    jobDescription = json['job_description'].toString();
    startData = json['start_data'].toString();
    endData = json['end_data'].toString();
    employeesSalary = json['employees_salary'].toString();
    status = json['status'].toString();
    userId = json['user_id'].toString();
    createdAt = json['createdAt'].toString();
    id = json['id'].toString();
    name = json['name'].toString();
    usersId = json['users_id'].toString();
    usersName = json['users_name'].toString();
    usersEmail = json['users_email'].toString();
    usersPassword = json['users_password'].toString();
    usersPhone = json['users_phone'].toString();
    usersVerfiycode = json['users_verfiycode'].toString();
    usersApprove = json['users_approve'].toString();
    usersCreate = json['users_create'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['model'] = this.model;
    data['regular'] = this.regular;
    data['years'] = this.years;
    data['employees_id'] = this.employeesId;
    data['employees_name'] = this.employeesName;
    data['employees_age'] = this.employeesAge;
    data['nationalid'] = this.nationalid;
    data['employees_phone'] = this.employeesPhone;
    data['employees_photo'] = this.employeesPhoto;
    data['employees_study'] = this.employeesStudy;
    data['job_description'] = this.jobDescription;
    data['start_data'] = this.startData;
    data['end_data'] = this.endData;
    data['employees_salary'] = this.employeesSalary;
    data['status'] = this.status;
    data['user_id'] = this.userId;
    data['createdAt'] = this.createdAt;
    data['id'] = this.id;
    data['name'] = this.name;
    data['users_id'] = this.usersId;
    data['users_name'] = this.usersName;
    data['users_email'] = this.usersEmail;
    data['users_password'] = this.usersPassword;
    data['users_phone'] = this.usersPhone;
    data['users_verfiycode'] = this.usersVerfiycode;
    data['users_approve'] = this.usersApprove;
    data['users_create'] = this.usersCreate;
    return data;
  }
}

