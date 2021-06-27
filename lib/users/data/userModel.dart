class UserModel {
  String? firstName;
  String? lastName;
  String? email;
  String? profilePic;
  UserModel({this.email, this.firstName, this.lastName, this.profilePic});
  factory UserModel.fromJsonn(Map<String, dynamic> data) {
    return UserModel(
        firstName: data['first_name'],
        lastName: data['last_name'],
        email: data['email'],
        profilePic: data['avatar']);
  }
}
