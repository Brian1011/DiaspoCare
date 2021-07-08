// To parse this JSON data, do
//
//     final transactionModel = transactionModelfromMap(jsonString);

import 'dart:convert';

TransactionModel transactionModelfromMap(String str) =>
    TransactionModel.fromMap(json.decode(str));

String transactionModelToJson(TransactionModel data) =>
    json.encode(data.toJson());

class TransactionModel {
  TransactionModel({
    this.transaction,
    this.parties,
  });

  Transaction transaction;
  Parties parties;

  factory TransactionModel.fromMap(Map<String, dynamic> json) =>
      TransactionModel(
        transaction: Transaction.fromMap(json["transaction"]),
        parties: Parties.fromMap(json["parties"]),
      );

  Map<String, dynamic> toJson() => {
        "transaction": transaction.toJson(),
        "parties": parties.toJson(),
      };
}

class Parties {
  Parties({
    this.beneficiary,
    this.vendor,
  });

  BeneficiaryModel beneficiary;
  Vendor vendor;

  factory Parties.fromMap(Map<String, dynamic> json) => Parties(
        beneficiary: BeneficiaryModel.fromMap(json["beneficiary"]),
        vendor: Vendor.fromMap(json["vendor"]),
      );

  Map<String, dynamic> toJson() => {
        "beneficiary": beneficiary.toJson(),
        "vendor": vendor.toJson(),
      };
}

class BeneficiaryModel {
  BeneficiaryModel({
    this.user,
    this.profile,
  });

  User user;
  BeneficiaryProfile profile;

  factory BeneficiaryModel.fromMap(Map<String, dynamic> json) =>
      BeneficiaryModel(
        user: User.fromMap(json["user"]),
        profile: BeneficiaryProfile.fromMap(json["profile"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "profile": profile.toJson(),
      };
}

class BeneficiaryProfile {
  BeneficiaryProfile({
    this.name,
    this.owner,
    this.creation,
    this.modified,
    this.modifiedBy,
    this.idx,
    this.docstatus,
    this.user,
    this.supporter,
    this.relation,
    this.country,
    this.doctype,
  });

  String name;
  String owner;
  DateTime creation;
  DateTime modified;
  String modifiedBy;
  int idx;
  int docstatus;
  String user;
  String supporter;
  String relation;
  String country;
  String doctype;

  factory BeneficiaryProfile.fromMap(Map<String, dynamic> json) =>
      BeneficiaryProfile(
        name: json["name"],
        owner: json["owner"],
        creation: DateTime.parse(json["creation"]),
        modified: DateTime.parse(json["modified"]),
        modifiedBy: json["modified_by"],
        idx: json["idx"],
        docstatus: json["docstatus"],
        user: json["user"],
        supporter: json["supporter"],
        relation: json["relation"],
        country: json["country"],
        doctype: json["doctype"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "owner": owner,
        "creation": creation.toIso8601String(),
        "modified": modified.toIso8601String(),
        "modified_by": modifiedBy,
        "idx": idx,
        "docstatus": docstatus,
        "user": user,
        "supporter": supporter,
        "relation": relation,
        "country": country,
        "doctype": doctype,
      };
}

class User {
  User({
    this.name,
    this.email,
    this.fullName,
  });

  String name;
  String email;
  String fullName;

  factory User.fromMap(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["email"],
        fullName: json["full_name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "full_name": fullName,
      };
}

class Vendor {
  Vendor({
    this.user,
    this.profile,
  });

  User user;
  VendorProfile profile;

  factory Vendor.fromMap(Map<String, dynamic> json) => Vendor(
        user: User.fromMap(json["user"]),
        profile: VendorProfile.fromMap(json["profile"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "profile": profile.toJson(),
      };
}

class VendorProfile {
  VendorProfile({
    this.name,
    this.owner,
    this.creation,
    this.user,
    this.pharmacyName,
    this.country,
    this.practitionerName,
    this.bankAccount,
    this.approved,
    this.currency,
    this.finserveRecipientPhoneNumber,
    this.paymentMethod,
    this.doctype,
  });

  String name;
  String owner;
  DateTime creation;
  String user;
  String pharmacyName;
  String country;
  String practitionerName;
  String bankAccount;
  String approved;
  String currency;
  String finserveRecipientPhoneNumber;
  String paymentMethod;
  String doctype;

  factory VendorProfile.fromMap(Map<String, dynamic> json) => VendorProfile(
        name: json["name"],
        owner: json["owner"],
        creation: DateTime.parse(json["creation"]),
        user: json["user"],
        pharmacyName: json["pharmacy_name"],
        country: json["country"],
        practitionerName: json["practitioner_name"],
        bankAccount: json["bank_account"],
        approved: json["approved"],
        currency: json["currency"],
        finserveRecipientPhoneNumber: json["finserve_recipient_phone_number"],
        paymentMethod: json["payment_method"],
        doctype: json["doctype"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "owner": owner,
        "creation": creation.toIso8601String(),
        "user": user,
        "pharmacy_name": pharmacyName,
        "country": country,
        "practitioner_name": practitionerName,
        "bank_account": bankAccount,
        "approved": approved,
        "currency": currency,
        "finserve_recipient_phone_number": finserveRecipientPhoneNumber,
        "payment_method": paymentMethod,
        "doctype": doctype,
      };
}

class Transaction {
  Transaction({
    this.name,
    this.owner,
    this.creation,
    this.idx,
    this.docstatus,
    this.basket,
    this.supporter,
    this.totalAmount,
    this.transactionCost,
    this.otherFees,
    this.status,
    this.convertedAmount,
    this.doctype,
  });

  String name;
  String owner;
  DateTime creation;
  int idx;
  int docstatus;
  String basket;
  String supporter;
  double totalAmount;
  double transactionCost;
  double otherFees;
  String status;
  double convertedAmount;
  String doctype;

  factory Transaction.fromMap(Map<String, dynamic> json) => Transaction(
        name: json["name"],
        owner: json["owner"],
        creation: DateTime.parse(json["creation"]),
        idx: json["idx"],
        docstatus: json["docstatus"],
        basket: json["basket"],
        supporter: json["supporter"],
        totalAmount: json["total_amount"],
        transactionCost: json["transaction_cost"],
        otherFees: json["other_fees"],
        status: json["status"],
        convertedAmount: json["converted_amount"],
        doctype: json["doctype"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "owner": owner,
        "creation": creation.toIso8601String(),
        "idx": idx,
        "docstatus": docstatus,
        "basket": basket,
        "supporter": supporter,
        "total_amount": totalAmount,
        "transaction_cost": transactionCost,
        "other_fees": otherFees,
        "status": status,
        "converted_amount": convertedAmount,
        "doctype": doctype,
      };
}
