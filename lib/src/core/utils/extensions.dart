import '../params/token_request.dart';
import 'enums.dart';

extension RemoteSfOrgExtension on RemoteSfOrg {
  String? get remoteConfigName {
    switch (this) {
      case RemoteSfOrg.prod:
        return 'prod';
      case RemoteSfOrg.uat:
        return 'uat';
      case RemoteSfOrg.dev:
        return 'dev';
      case RemoteSfOrg.stripe:
        return 'stripe';
      case RemoteSfOrg.offline:
        return 'offline';
      default:
        return null;
    }
  }

  TokenRequestParams get param {
    switch (this) {
      case RemoteSfOrg.prod:
        return const TokenRequestParams(
          grantType: 'password',
          clientId: '3MVG9kBt168mda_.eRIIO1mdpTgWevFInNoVgqOCZ6yYsUBvJy_BiERgL7riZ3AVko25RJ3BLkbHVHLPp4cB4',
          clientSecret: '13A8215A8BF4F58C5A335D87C31B3592DF2BA80E59A229325BFC05F1A6B9B3AC',
          username: 'tim.berrier@vehiclehub.tech',
          password: 'Vehicle2021',
        );
      case RemoteSfOrg.uat:
        return const TokenRequestParams(
          grantType: 'password',
          clientId: '3MVG9MwiKwcReohzlfKsMS0PHdCafrddWfFTsVZgOkdiftmipIKlQgzZQaE1u5Wo4uFOMupRXOXUmXQIVfqpH',
          clientSecret: 'E3E580F0D5B28F7C89C23322A91F5E5B972D121C99A0732B687BD77A5A0A5B16',
          username: 'tim.berrier@vehiclehub.tech.uat',
          password: 'Vehicle2021',
        );
      case RemoteSfOrg.dev:
        return const TokenRequestParams(
          grantType: 'password',
          clientId: '3MVG98dostKihXN5gpetF.4fzRcddNuTOJgA3nlXwVdDZMYL99av4.cKUW.rUmfVX3v8uV9Lw6OXRhocwVCwh',
          clientSecret: 'BF7C71B8880C403FB5161BC9E87E60CB2B527D15AF99CA2D84A7F58EE4F14763',
          username: 'tim.berrier@vehiclehub.tech.dev',
          password: 'Vehicle2021',
        );
      case RemoteSfOrg.stripe:
        return const TokenRequestParams(
          grantType: 'password',
          clientId: '3MVG9MwiKwcReohzlfKsMS0PHdGtSuLELXaE.TaqxfemLsSb0RFHa.LhGYApSYGX8FDnOBWAaHgXKK3grEqvK',
          clientSecret: '46431D0A6F87E74FC1D5D76299966AA2FD44F9F6257FAE4190758FA1A9A2F8B6',
          username: 'tim.berrier@vehiclehub.tech.stripe',
          password: 'Vehicle2021',
        );
      case RemoteSfOrg.offline:
        return const TokenRequestParams(
          grantType: 'password',
          clientId: '',
          clientSecret: '',
          username: '',
          password: '',
        );
    }
  }
}
