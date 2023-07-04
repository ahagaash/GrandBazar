class UserPasswordChangeRequest {
  String password;

  UserPasswordChangeRequest({
    required this.password,
  });

  factory UserPasswordChangeRequest.fromJson(Map<String, dynamic> json) =>
      UserPasswordChangeRequest(
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "password": password,
      };
}
