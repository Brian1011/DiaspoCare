class BeneficiaryRelation {
  BeneficiaryRelation({
    this.name,
  });

  String name;

  factory BeneficiaryRelation.fromJson(Map<String, dynamic> json) =>
      BeneficiaryRelation(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
