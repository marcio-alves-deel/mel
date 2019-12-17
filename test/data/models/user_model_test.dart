import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mel/entities.dart' show UserEntity;
import 'package:mel/models.dart' show UserModel;

import '../../fixtures/fixture_reader.dart';

void main() {
  final tUserModel = UserModel(
      uid: "1",
      email: "Emely.Connelly@example.com",
      firstName: "Carlotta",
      lastName: "Rau",
      birthDate: "2019-10-27 16:17:07.252",
      avatar:
          "data:image/svg+xml;charset=UTF-8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20baseProfile%3D%22full%22%20width%3D%22undefined%22%20height%3D%22undefined%22%3E%20%3Crect%20width%3D%22100%25%22%20height%3D%22100%25%22%20fill%3D%22grey%22%2F%3E%20%20%3Ctext%20x%3D%220%22%20y%3D%2220%22%20font-size%3D%2220%22%20text-anchor%3D%22start%22%20fill%3D%22white%22%3Eundefinedxundefined%3C%2Ftext%3E%20%3C%2Fsvg%3E");
  final tUserModelIncomplete = UserModel(
      uid: "1",
      email: "Emely.Connelly@example.com",
      firstName: "Carlotta",
      lastName: "Rau");
  group('should be a subclass of UserEntity', () {
    test('with complete information', () async {
      expect(tUserModel, isA<UserEntity>());
    });

    test('without birthDate or avatar', () async {
      expect(tUserModelIncomplete, isA<UserEntity>());
    });
  });

  group('fromJson', () {
    test('should return a UserModel with the complete data', () async {
      final Map<String, dynamic> jsonMap = json.decode(fixture('user.json'));
      final result = UserModel.fromJson(jsonMap);
      expect(result, tUserModel);
    });

    test('should return a UserModel without birthDate or avatar', () async {
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('user_incomplete.json'));
      final result = UserModel.fromJson(jsonMap);
      expect(result, tUserModelIncomplete);
    });
  });

  group('toJson', () {
    test('should return a JSON map from complete date', () async {
      final result = tUserModel.toJson();
      final expected = {
        "userId": "1",
        "email": "Emely.Connelly@example.com",
        "firstName": "Carlotta",
        "lastName": "Rau",
        "birthDate": "2019-10-27 16:17:07.252",
        "avatar":
            "data:image/svg+xml;charset=UTF-8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20baseProfile%3D%22full%22%20width%3D%22undefined%22%20height%3D%22undefined%22%3E%20%3Crect%20width%3D%22100%25%22%20height%3D%22100%25%22%20fill%3D%22grey%22%2F%3E%20%20%3Ctext%20x%3D%220%22%20y%3D%2220%22%20font-size%3D%2220%22%20text-anchor%3D%22start%22%20fill%3D%22white%22%3Eundefinedxundefined%3C%2Ftext%3E%20%3C%2Fsvg%3E"
      };

      expect(result, expected);
    });

    test('should return a JSON map without birthDate or avatar', () async {
      final result = tUserModelIncomplete.toJson();
      final expected = {
        "userId": "1",
        "email": "Emely.Connelly@example.com",
        "firstName": "Carlotta",
        "lastName": "Rau",
        "birthDate": null,
        "avatar": null
      };

      expect(result, expected);
    });
  });
}
