import '../../domain/entities/subscription.dart';
import 'coupon_model.dart';
import 'subscription_payment_model.dart';

class SubscriptionModel extends Subscription {
  const SubscriptionModel({
    required int totalAiScan,
    required String street,
    required String status,
    required String state,
    required String serverMessage,
    required String postalCode,
    required int planAmount,
    required String paymentMethod,
    required List<SubscriptionPaymentModel> paymentHistory,
    required int mobileLicense,
    required String lastName,
    required bool isTrial,
    required String firstName,
    required int desktopLicense,
    required String city,
    required CouponModel appliedCoupon,
    required DateTime accountValidTill,
  }) : super(
          totalAiScan: totalAiScan,
          street: street,
          status: status,
          state: state,
          serverMessage: serverMessage,
          postalCode: postalCode,
          planAmount: planAmount,
          paymentMethod: paymentMethod,
          paymentHistory: paymentHistory,
          mobileLicense: mobileLicense,
          lastName: lastName,
          isTrial: isTrial,
          firstName: firstName,
          desktopLicense: desktopLicense,
          city: city,
          appliedCoupon: appliedCoupon,
          accountValidTill: accountValidTill,
        );

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionModel(
      totalAiScan: json['totalAiScan'],
      street: json['street'],
      status: json['status'],
      state: json['state'],
      serverMessage: json['serverMessage'],
      postalCode: json['postalCode'],
      planAmount: json['planAmount'],
      paymentMethod: json['paymentMethod'],
      paymentHistory: json['paymentHistory'].map((x) => SubscriptionPaymentModel.fromJson(x)),
      mobileLicense: json['mobileLicense'],
      lastName: json['lastName'],
      isTrial: json['isTrial'],
      firstName: json['firstName'],
      desktopLicense: json['desktopLicense'],
      city: json['city'],
      appliedCoupon: json['appliedCoupon'],
      accountValidTill: DateTime.parse(json['accountValidTill']),
    );
  }
}
