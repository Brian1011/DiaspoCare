class Beneficiary {
  Beneficiary({
    this.user,
    this.profile,
  });

  User user;
  Profile profile;

  factory Beneficiary.fromJson(Map<String, dynamic> json) => Beneficiary(
        user: User.fromJson(json["user"]),
        profile: Profile.fromJson(json["profile"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "profile": profile.toJson(),
      };
}

class Profile {
  Profile({
    this.user,
    this.supporter,
    this.relation,
  });

  String user;
  String supporter;
  String relation;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        user: json["user"],
        supporter: json["supporter"],
        relation: json["relation"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "supporter": supporter,
        "relation": relation,
      };
}

class User {
  User({
    this.fullName,
    this.email,
  });

  String fullName;
  String email;

  factory User.fromJson(Map<String, dynamic> json) => User(
        fullName: json["full_name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "email": email,
      };
}
