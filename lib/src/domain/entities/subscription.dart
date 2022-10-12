import 'package:equatable/equatable.dart';

import 'coupon.dart';
import 'subscription_payment.dart';

class Subscription extends Equatable {
  final int totalAiScan;
  final String street;
  final String status;
  final String state;
  final String serverMessage;
  final String postalCode;
  final int planAmount;
  final String paymentMethod;
  final List<SubscriptionPayment> paymentHistory;
  final int mobileLicense;
  final String lastName;
  final bool isTrial;
  final String firstName;
  final int desktopLicense;
  final String city;
  final Coupon appliedCoupon;
  final DateTime accountValidTill;

  const Subscription({
    required this.totalAiScan,
    required this.street,
    required this.status,
    required this.state,
    required this.serverMessage,
    required this.postalCode,
    required this.planAmount,
    required this.paymentMethod,
    required this.paymentHistory,
    required this.mobileLicense,
    required this.lastName,
    required this.isTrial,
    required this.firstName,
    required this.desktopLicense,
    required this.city,
    required this.appliedCoupon,
    required this.accountValidTill,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalAiScan']=totalAiScan;
    data['street']=street;
    data['status']=status;
    data['state']=state;
    data['serverMessage']=serverMessage;
    data['postalCode']=postalCode;
    data['planAmount']=planAmount;
    data['paymentMethod']=paymentMethod;
    data['paymentHistory']=paymentHistory.map((x) => x.toJson());
    data['mobileLicense']=mobileLicense;
    data['lastName']=lastName;
    data['isTrial']=isTrial;
    data['firstName']=firstName;
    data['desktopLicense']=desktopLicense;
    data['city']=city;
    data['appliedCoupon']=appliedCoupon;
    data['accountValidTill']=accountValidTill;
    return data;
  }

  @override
  List<Object?> get props => [
        totalAiScan,
        street,
        status,
        state,
        serverMessage,
        postalCode,
        planAmount,
        paymentMethod,
        paymentHistory,
        mobileLicense,
        lastName,
        isTrial,
        firstName,
        desktopLicense,
        city,
        appliedCoupon,
        accountValidTill,
      ];

  @override
  bool? get stringify => true;
}
