import 'package:equatable/equatable.dart';

import 'contact.dart';
import 'customer.dart';
import 'subscription.dart';

class Account extends Equatable {
  final Contact? user;
  final Customer? company;
  final Subscription? subscription;

  const Account({
    this.user,
    this.company,
    this.subscription,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user'] = user?.toJson();
    data['company'] = company?.toJson();
    data['subscription'] = subscription?.toJson();
    return data;
  }

  @override
  List<Object?> get props => [
        user,
        company,
        subscription,
      ];

  @override
  bool? get stringify => true;
}
