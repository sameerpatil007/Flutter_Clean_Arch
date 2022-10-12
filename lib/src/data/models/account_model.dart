import '../../domain/entities/account.dart';
import 'contact_model.dart';
import 'customer_model.dart';
import 'subscription_model.dart';

class AccountModel extends Account {
  const AccountModel({
    required ContactModel user,
    required SubscriptionModel? subscription,
    required CustomerModel company,
  }) : super(
          user: user,
          company: company,
          subscription: subscription,
        );

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    return AccountModel(
      user: ContactModel.fromJson(json['user']),
      company: CustomerModel.fromJson(json['company']),
      subscription: json['subscription'] != null ? SubscriptionModel.fromJson(json['subscription']) : null,
    );
  }
}
