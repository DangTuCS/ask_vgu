// ignore_for_file: unused_element

import 'package:ask_vgu/utils/env/app_env.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:graphql_flutter/graphql_flutter.dart';




// Generate a JSON Web Token
// You can provide the payload as a key-value map or a string
final jwt = JWT(
  // Payload
  {
    "https://graphlit.io/jwt/claims": {
      "x-graphlit-environment-id": AppEnv.environmentId,
      "x-graphlit-organization-id": AppEnv.organizationId,
      "x-graphlit-role": "Contributor",
    },
  },
  issuer: 'graphlit',
  audience: Audience(["https://portal.graphlit.io",]),
);

// Sign it (default with HS256 algorithm)
final token = jwt.sign(SecretKey(AppEnv.secretKey),expiresIn: const Duration(days: 14));
// final token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwczovL2dyYXBobGl0LmlvL2p3dC9jbGFpbXMiOnsieC1ncmFwaGxpdC1lbnZpcm9ubWVudC1pZCI6IjAwMzc4NTYyLTc2NzUtNGNjYy1iMmE0LTUyY2Y3N2Y1YmI1NCIsIngtZ3JhcGhsaXQtb3JnYW5pemF0aW9uLWlkIjoiOWI0ZDMyY2QtZWVmMi00Y2QyLWFkOWEtMDk3MmQ0YmY3YmQxIiwieC1ncmFwaGxpdC1yb2xlIjoiQ29udHJpYnV0b3IifSwiZXhwIjoxNzExMDA2ODkzLCJpc3MiOiJncmFwaGxpdCIsImF1ZCI6Imh0dHBzOi8vcG9ydGFsLmdyYXBobGl0LmlvIn0.p4l98UZVlm9R2nRc7kQrwPXZ-ojErymXIDiga-XHBP8";

final _httpLink = HttpLink(AppEnv.graphqlUrl);

final _authLink = AuthLink(
  headerKey: 'Authorization',
  getToken: () {
    return 'Bearer $token';
  },
);

Link _link = _authLink.concat(_httpLink);

final GraphQLClient graphlitClient = GraphQLClient(
  cache: GraphQLCache(),
  link: _link,
);
