class AuthParams {
  String? name;
  String? email;
  String? password;
  String? password_confirmation;
  int? verify_code;
  String? new_password;
  String? new_password_confirmation;

  AuthParams({
    this.name,
    this.email,
    this.password,
    this.password_confirmation,
    this.verify_code,
    this.new_password,
    this.new_password_confirmation,
  });

  Map<String, dynamic> toJson() {
    return {
      if (email != null) "email": email,
      if (password != null) "password": password,
      if (name != null) "name": name,
      if (password_confirmation != null)
        "password_confirmation": password_confirmation,
      if (verify_code != null) "verify_code": verify_code,
      if (new_password != null) "new_password": new_password,
      if (new_password_confirmation != null)
        "new_password_confirmation": new_password_confirmation,
    };
  }
}
