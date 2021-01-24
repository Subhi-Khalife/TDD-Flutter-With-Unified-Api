class User {
  int id;
  String fullName;
  String username;
  String phone;
  dynamic profileImg;
  String userScope;
  dynamic email;
  dynamic gender;
  dynamic birthday;
  dynamic emailVerifiedAt;
  dynamic phoneVerifiedAt;
  dynamic createdAt;
  String tokenApi;

  User(
      {this.id,
      this.fullName,
      this.username,
      this.phone,
      this.profileImg,
      this.userScope,
      this.email,
      this.gender,
      this.birthday,
      this.emailVerifiedAt,
      this.phoneVerifiedAt,
      this.createdAt,
      this.tokenApi});
}
