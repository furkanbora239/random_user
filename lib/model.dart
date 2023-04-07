///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
// ignore_for_file: avoid_function_literals_in_foreach_calls

const String _jsonKeyRandomUserResults = 'results';
const String _jsonKeyRandomUserInfo = 'info';
const String _jsonKeyRandomUserInfoSeed = 'seed';
const String _jsonKeyRandomUserInfoResults = 'results';
const String _jsonKeyRandomUserInfoPage = 'page';
const String _jsonKeyRandomUserInfoVersion = 'version';

class RandomUserInfo {
/*
{
  "seed": "40e915b60b27487e",
  "results": 1,
  "page": 1,
  "version": "1.4"
} 
*/

  String? seed;
  String? results;
  String? page;
  String? version;

  RandomUserInfo({
    this.seed,
    this.results,
    this.page,
    this.version,
  });
  RandomUserInfo.fromJson(Map<String, dynamic> json) {
    seed = json[_jsonKeyRandomUserInfoSeed]?.toString();
    results = json[_jsonKeyRandomUserInfoResults]?.toString();
    page = json[_jsonKeyRandomUserInfoPage]?.toString();
    version = json[_jsonKeyRandomUserInfoVersion]?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data[_jsonKeyRandomUserInfoSeed] = seed;
    data[_jsonKeyRandomUserInfoResults] = results;
    data[_jsonKeyRandomUserInfoPage] = page;
    data[_jsonKeyRandomUserInfoVersion] = version;
    return data;
  }
}

const String _jsonKeyRandomUserResultsGender = 'gender';
const String _jsonKeyRandomUserResultsName = 'name';
const String _jsonKeyRandomUserResultsLocation = 'location';
const String _jsonKeyRandomUserResultsEmail = 'email';
const String _jsonKeyRandomUserResultsLogin = 'login';
const String _jsonKeyRandomUserResultsDob = 'dob';
const String _jsonKeyRandomUserResultsRegistered = 'registered';
const String _jsonKeyRandomUserResultsPhone = 'phone';
const String _jsonKeyRandomUserResultsCell = 'cell';
const String _jsonKeyRandomUserResultsId = 'id';
const String _jsonKeyRandomUserResultsPicture = 'picture';
const String _jsonKeyRandomUserResultsNat = 'nat';
const String _jsonKeyRandomUserResultsPictureLarge = 'large';
const String _jsonKeyRandomUserResultsPictureMedium = 'medium';
const String _jsonKeyRandomUserResultsPictureThumbnail = 'thumbnail';

class RandomUserResultsPicture {
/*
{
  "large": "https://randomuser.me/api/portraits/men/50.jpg",
  "medium": "https://randomuser.me/api/portraits/med/men/50.jpg",
  "thumbnail": "https://randomuser.me/api/portraits/thumb/men/50.jpg"
} 
*/

  String? large;
  String? medium;
  String? thumbnail;

  RandomUserResultsPicture({
    this.large,
    this.medium,
    this.thumbnail,
  });
  RandomUserResultsPicture.fromJson(Map<String, dynamic> json) {
    large = json[_jsonKeyRandomUserResultsPictureLarge]?.toString();
    medium = json[_jsonKeyRandomUserResultsPictureMedium]?.toString();
    thumbnail = json[_jsonKeyRandomUserResultsPictureThumbnail]?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data[_jsonKeyRandomUserResultsPictureLarge] = large;
    data[_jsonKeyRandomUserResultsPictureMedium] = medium;
    data[_jsonKeyRandomUserResultsPictureThumbnail] = thumbnail;
    return data;
  }
}

const String _jsonKeyRandomUserResultsIdName = 'name';
const String _jsonKeyRandomUserResultsIdValue = 'value';

class RandomUserResultsId {
/*
{
  "name": "HETU",
  "value": "NaNNA225undefined"
} 
*/

  String? name;
  String? value;

  RandomUserResultsId({
    this.name,
    this.value,
  });
  RandomUserResultsId.fromJson(Map<String, dynamic> json) {
    name = json[_jsonKeyRandomUserResultsIdName]?.toString();
    value = json[_jsonKeyRandomUserResultsIdValue]?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data[_jsonKeyRandomUserResultsIdName] = name;
    data[_jsonKeyRandomUserResultsIdValue] = value;
    return data;
  }
}

const String _jsonKeyRandomUserResultsRegisteredDate = 'date';
const String _jsonKeyRandomUserResultsRegisteredAge = 'age';

class RandomUserResultsRegistered {
/*
{
  "date": "2015-03-09T02:11:23.579Z",
  "age": 8
} 
*/

  String? date;
  String? age;

  RandomUserResultsRegistered({
    this.date,
    this.age,
  });
  RandomUserResultsRegistered.fromJson(Map<String, dynamic> json) {
    date = json[_jsonKeyRandomUserResultsRegisteredDate]?.toString();
    age = json[_jsonKeyRandomUserResultsRegisteredAge]?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data[_jsonKeyRandomUserResultsRegisteredDate] = date;
    data[_jsonKeyRandomUserResultsRegisteredAge] = age;
    return data;
  }
}

const String _jsonKeyRandomUserResultsDobDate = 'date';
const String _jsonKeyRandomUserResultsDobAge = 'age';

class RandomUserResultsDob {
/*
{
  "date": "1995-10-08T17:08:24.466Z",
  "age": 27
} 
*/

  String? date;
  String? age;

  RandomUserResultsDob({
    this.date,
    this.age,
  });
  RandomUserResultsDob.fromJson(Map<String, dynamic> json) {
    date = json[_jsonKeyRandomUserResultsDobDate]?.toString();
    age = json[_jsonKeyRandomUserResultsDobAge]?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data[_jsonKeyRandomUserResultsDobDate] = date;
    data[_jsonKeyRandomUserResultsDobAge] = age;
    return data;
  }
}

const String _jsonKeyRandomUserResultsLoginUuid = 'uuid';
const String _jsonKeyRandomUserResultsLoginUsername = 'username';
const String _jsonKeyRandomUserResultsLoginPassword = 'password';
const String _jsonKeyRandomUserResultsLoginSalt = 'salt';
const String _jsonKeyRandomUserResultsLoginMd5 = 'md5';
const String _jsonKeyRandomUserResultsLoginSha1 = 'sha1';
const String _jsonKeyRandomUserResultsLoginSha256 = 'sha256';

class RandomUserResultsLogin {
/*
{
  "uuid": "a3379b66-a5fb-45a1-bc01-2ea8b7285149",
  "username": "angrybutterfly265",
  "password": "sadie",
  "salt": "Ow9SvNgB",
  "md5": "0b62e48b137ec160ce72e52abd13300c",
  "sha1": "f330e7b6dcc4d7f27c0b02e055df996eaf9a8b40",
  "sha256": "cb1d77834a87777cb318c85848e44e9c1d078da0171012cb7d72f698088b5f0e"
} 
*/

  String? uuid;
  String? username;
  String? password;
  String? salt;
  String? md5;
  String? sha1;
  String? sha256;

  RandomUserResultsLogin({
    this.uuid,
    this.username,
    this.password,
    this.salt,
    this.md5,
    this.sha1,
    this.sha256,
  });
  RandomUserResultsLogin.fromJson(Map<String, dynamic> json) {
    uuid = json[_jsonKeyRandomUserResultsLoginUuid]?.toString();
    username = json[_jsonKeyRandomUserResultsLoginUsername]?.toString();
    password = json[_jsonKeyRandomUserResultsLoginPassword]?.toString();
    salt = json[_jsonKeyRandomUserResultsLoginSalt]?.toString();
    md5 = json[_jsonKeyRandomUserResultsLoginMd5]?.toString();
    sha1 = json[_jsonKeyRandomUserResultsLoginSha1]?.toString();
    sha256 = json[_jsonKeyRandomUserResultsLoginSha256]?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data[_jsonKeyRandomUserResultsLoginUuid] = uuid;
    data[_jsonKeyRandomUserResultsLoginUsername] = username;
    data[_jsonKeyRandomUserResultsLoginPassword] = password;
    data[_jsonKeyRandomUserResultsLoginSalt] = salt;
    data[_jsonKeyRandomUserResultsLoginMd5] = md5;
    data[_jsonKeyRandomUserResultsLoginSha1] = sha1;
    data[_jsonKeyRandomUserResultsLoginSha256] = sha256;
    return data;
  }
}

const String _jsonKeyRandomUserResultsLocationStreet = 'street';
const String _jsonKeyRandomUserResultsLocationCity = 'city';
const String _jsonKeyRandomUserResultsLocationState = 'state';
const String _jsonKeyRandomUserResultsLocationCountry = 'country';
const String _jsonKeyRandomUserResultsLocationPostcode = 'postcode';
const String _jsonKeyRandomUserResultsLocationCoordinates = 'coordinates';
const String _jsonKeyRandomUserResultsLocationTimezone = 'timezone';
const String _jsonKeyRandomUserResultsLocationTimezoneOffset = 'offset';
const String _jsonKeyRandomUserResultsLocationTimezoneDescription =
    'description';

class RandomUserResultsLocationTimezone {
/*
{
  "offset": "-7:00",
  "description": "Mountain Time (US & Canada)"
} 
*/

  String? offset;
  String? description;

  RandomUserResultsLocationTimezone({
    this.offset,
    this.description,
  });
  RandomUserResultsLocationTimezone.fromJson(Map<String, dynamic> json) {
    offset = json[_jsonKeyRandomUserResultsLocationTimezoneOffset]?.toString();
    description =
        json[_jsonKeyRandomUserResultsLocationTimezoneDescription]?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data[_jsonKeyRandomUserResultsLocationTimezoneOffset] = offset;
    data[_jsonKeyRandomUserResultsLocationTimezoneDescription] = description;
    return data;
  }
}

const String _jsonKeyRandomUserResultsLocationCoordinatesLatitude = 'latitude';
const String _jsonKeyRandomUserResultsLocationCoordinatesLongitude =
    'longitude';

class RandomUserResultsLocationCoordinates {
/*
{
  "latitude": "-28.6461",
  "longitude": "-109.2685"
} 
*/

  String? latitude;
  String? longitude;

  RandomUserResultsLocationCoordinates({
    this.latitude,
    this.longitude,
  });
  RandomUserResultsLocationCoordinates.fromJson(Map<String, dynamic> json) {
    latitude =
        json[_jsonKeyRandomUserResultsLocationCoordinatesLatitude]?.toString();
    longitude =
        json[_jsonKeyRandomUserResultsLocationCoordinatesLongitude]?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data[_jsonKeyRandomUserResultsLocationCoordinatesLatitude] = latitude;
    data[_jsonKeyRandomUserResultsLocationCoordinatesLongitude] = longitude;
    return data;
  }
}

const String _jsonKeyRandomUserResultsLocationStreetNumber = 'number';
const String _jsonKeyRandomUserResultsLocationStreetName = 'name';

class RandomUserResultsLocationStreet {
/*
{
  "number": 4544,
  "name": "Pispalan Valtatie"
} 
*/

  String? number;
  String? name;

  RandomUserResultsLocationStreet({
    this.number,
    this.name,
  });
  RandomUserResultsLocationStreet.fromJson(Map<String, dynamic> json) {
    number = json[_jsonKeyRandomUserResultsLocationStreetNumber]?.toString();
    name = json[_jsonKeyRandomUserResultsLocationStreetName]?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data[_jsonKeyRandomUserResultsLocationStreetNumber] = number;
    data[_jsonKeyRandomUserResultsLocationStreetName] = name;
    return data;
  }
}

class RandomUserResultsLocation {
/*
{
  "street": {
    "number": 4544,
    "name": "Pispalan Valtatie"
  },
  "city": "Rautjärvi",
  "state": "Northern Ostrobothnia",
  "country": "Finland",
  "postcode": 48589,
  "coordinates": {
    "latitude": "-28.6461",
    "longitude": "-109.2685"
  },
  "timezone": {
    "offset": "-7:00",
    "description": "Mountain Time (US & Canada)"
  }
} 
*/

  RandomUserResultsLocationStreet? street;
  String? city;
  String? state;
  String? country;
  String? postcode;
  RandomUserResultsLocationCoordinates? coordinates;
  RandomUserResultsLocationTimezone? timezone;

  RandomUserResultsLocation({
    this.street,
    this.city,
    this.state,
    this.country,
    this.postcode,
    this.coordinates,
    this.timezone,
  });
  RandomUserResultsLocation.fromJson(Map<String, dynamic> json) {
    street = (json[_jsonKeyRandomUserResultsLocationStreet] != null)
        ? RandomUserResultsLocationStreet.fromJson(
            json[_jsonKeyRandomUserResultsLocationStreet])
        : null;
    city = json[_jsonKeyRandomUserResultsLocationCity]?.toString();
    state = json[_jsonKeyRandomUserResultsLocationState]?.toString();
    country = json[_jsonKeyRandomUserResultsLocationCountry]?.toString();
    postcode = json[_jsonKeyRandomUserResultsLocationPostcode]?.toString();
    coordinates = (json[_jsonKeyRandomUserResultsLocationCoordinates] != null)
        ? RandomUserResultsLocationCoordinates.fromJson(
            json[_jsonKeyRandomUserResultsLocationCoordinates])
        : null;
    timezone = (json[_jsonKeyRandomUserResultsLocationTimezone] != null)
        ? RandomUserResultsLocationTimezone.fromJson(
            json[_jsonKeyRandomUserResultsLocationTimezone])
        : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (street != null) {
      data[_jsonKeyRandomUserResultsLocationStreet] = street!.toJson();
    }
    data[_jsonKeyRandomUserResultsLocationCity] = city;
    data[_jsonKeyRandomUserResultsLocationState] = state;
    data[_jsonKeyRandomUserResultsLocationCountry] = country;
    data[_jsonKeyRandomUserResultsLocationPostcode] = postcode;
    if (coordinates != null) {
      data[_jsonKeyRandomUserResultsLocationCoordinates] =
          coordinates!.toJson();
    }
    if (timezone != null) {
      data[_jsonKeyRandomUserResultsLocationTimezone] = timezone!.toJson();
    }
    return data;
  }
}

const String _jsonKeyRandomUserResultsNameTitle = 'title';
const String _jsonKeyRandomUserResultsNameFirst = 'first';
const String _jsonKeyRandomUserResultsNameLast = 'last';

class RandomUserResultsName {
/*
{
  "title": "Mr",
  "first": "Nooa",
  "last": "Kalm"
} 
*/

  String? title;
  String? first;
  String? last;

  RandomUserResultsName({
    this.title,
    this.first,
    this.last,
  });
  RandomUserResultsName.fromJson(Map<String, dynamic> json) {
    title = json[_jsonKeyRandomUserResultsNameTitle]?.toString();
    first = json[_jsonKeyRandomUserResultsNameFirst]?.toString();
    last = json[_jsonKeyRandomUserResultsNameLast]?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data[_jsonKeyRandomUserResultsNameTitle] = title;
    data[_jsonKeyRandomUserResultsNameFirst] = first;
    data[_jsonKeyRandomUserResultsNameLast] = last;
    return data;
  }
}

class RandomUserResults {
/*
{
  "gender": "male",
  "name": {
    "title": "Mr",
    "first": "Nooa",
    "last": "Kalm"
  },
  "location": {
    "street": {
      "number": 4544,
      "name": "Pispalan Valtatie"
    },
    "city": "Rautjärvi",
    "state": "Northern Ostrobothnia",
    "country": "Finland",
    "postcode": 48589,
    "coordinates": {
      "latitude": "-28.6461",
      "longitude": "-109.2685"
    },
    "timezone": {
      "offset": "-7:00",
      "description": "Mountain Time (US & Canada)"
    }
  },
  "email": "nooa.kalm@example.com",
  "login": {
    "uuid": "a3379b66-a5fb-45a1-bc01-2ea8b7285149",
    "username": "angrybutterfly265",
    "password": "sadie",
    "salt": "Ow9SvNgB",
    "md5": "0b62e48b137ec160ce72e52abd13300c",
    "sha1": "f330e7b6dcc4d7f27c0b02e055df996eaf9a8b40",
    "sha256": "cb1d77834a87777cb318c85848e44e9c1d078da0171012cb7d72f698088b5f0e"
  },
  "dob": {
    "date": "1995-10-08T17:08:24.466Z",
    "age": 27
  },
  "registered": {
    "date": "2015-03-09T02:11:23.579Z",
    "age": 8
  },
  "phone": "07-415-303",
  "cell": "045-446-40-82",
  "id": {
    "name": "HETU",
    "value": "NaNNA225undefined"
  },
  "picture": {
    "large": "https://randomuser.me/api/portraits/men/50.jpg",
    "medium": "https://randomuser.me/api/portraits/med/men/50.jpg",
    "thumbnail": "https://randomuser.me/api/portraits/thumb/men/50.jpg"
  },
  "nat": "FI"
} 
*/

  String? gender;
  RandomUserResultsName? name;
  RandomUserResultsLocation? location;
  String? email;
  RandomUserResultsLogin? login;
  RandomUserResultsDob? dob;
  RandomUserResultsRegistered? registered;
  String? phone;
  String? cell;
  RandomUserResultsId? id;
  RandomUserResultsPicture? picture;
  String? nat;

  RandomUserResults({
    this.gender,
    this.name,
    this.location,
    this.email,
    this.login,
    this.dob,
    this.registered,
    this.phone,
    this.cell,
    this.id,
    this.picture,
    this.nat,
  });
  RandomUserResults.fromJson(Map<String, dynamic> json) {
    gender = json[_jsonKeyRandomUserResultsGender]?.toString();
    name = (json[_jsonKeyRandomUserResultsName] != null)
        ? RandomUserResultsName.fromJson(json[_jsonKeyRandomUserResultsName])
        : null;
    location = (json[_jsonKeyRandomUserResultsLocation] != null)
        ? RandomUserResultsLocation.fromJson(
            json[_jsonKeyRandomUserResultsLocation])
        : null;
    email = json[_jsonKeyRandomUserResultsEmail]?.toString();
    login = (json[_jsonKeyRandomUserResultsLogin] != null)
        ? RandomUserResultsLogin.fromJson(json[_jsonKeyRandomUserResultsLogin])
        : null;
    dob = (json[_jsonKeyRandomUserResultsDob] != null)
        ? RandomUserResultsDob.fromJson(json[_jsonKeyRandomUserResultsDob])
        : null;
    registered = (json[_jsonKeyRandomUserResultsRegistered] != null)
        ? RandomUserResultsRegistered.fromJson(
            json[_jsonKeyRandomUserResultsRegistered])
        : null;
    phone = json[_jsonKeyRandomUserResultsPhone]?.toString();
    cell = json[_jsonKeyRandomUserResultsCell]?.toString();
    id = (json[_jsonKeyRandomUserResultsId] != null)
        ? RandomUserResultsId.fromJson(json[_jsonKeyRandomUserResultsId])
        : null;
    picture = (json[_jsonKeyRandomUserResultsPicture] != null)
        ? RandomUserResultsPicture.fromJson(
            json[_jsonKeyRandomUserResultsPicture])
        : null;
    nat = json[_jsonKeyRandomUserResultsNat]?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data[_jsonKeyRandomUserResultsGender] = gender;
    if (name != null) {
      data[_jsonKeyRandomUserResultsName] = name!.toJson();
    }
    if (location != null) {
      data[_jsonKeyRandomUserResultsLocation] = location!.toJson();
    }
    data[_jsonKeyRandomUserResultsEmail] = email;
    if (login != null) {
      data[_jsonKeyRandomUserResultsLogin] = login!.toJson();
    }
    if (dob != null) {
      data[_jsonKeyRandomUserResultsDob] = dob!.toJson();
    }
    if (registered != null) {
      data[_jsonKeyRandomUserResultsRegistered] = registered!.toJson();
    }
    data[_jsonKeyRandomUserResultsPhone] = phone;
    data[_jsonKeyRandomUserResultsCell] = cell;
    if (id != null) {
      data[_jsonKeyRandomUserResultsId] = id!.toJson();
    }
    if (picture != null) {
      data[_jsonKeyRandomUserResultsPicture] = picture!.toJson();
    }
    data[_jsonKeyRandomUserResultsNat] = nat;
    return data;
  }
}

class RandomUser {
/*
{
  "results": [
    {
      "gender": "male",
      "name": {
        "title": "Mr",
        "first": "Nooa",
        "last": "Kalm"
      },
      "location": {
        "street": {
          "number": 4544,
          "name": "Pispalan Valtatie"
        },
        "city": "Rautjärvi",
        "state": "Northern Ostrobothnia",
        "country": "Finland",
        "postcode": 48589,
        "coordinates": {
          "latitude": "-28.6461",
          "longitude": "-109.2685"
        },
        "timezone": {
          "offset": "-7:00",
          "description": "Mountain Time (US & Canada)"
        }
      },
      "email": "nooa.kalm@example.com",
      "login": {
        "uuid": "a3379b66-a5fb-45a1-bc01-2ea8b7285149",
        "username": "angrybutterfly265",
        "password": "sadie",
        "salt": "Ow9SvNgB",
        "md5": "0b62e48b137ec160ce72e52abd13300c",
        "sha1": "f330e7b6dcc4d7f27c0b02e055df996eaf9a8b40",
        "sha256": "cb1d77834a87777cb318c85848e44e9c1d078da0171012cb7d72f698088b5f0e"
      },
      "dob": {
        "date": "1995-10-08T17:08:24.466Z",
        "age": 27
      },
      "registered": {
        "date": "2015-03-09T02:11:23.579Z",
        "age": 8
      },
      "phone": "07-415-303",
      "cell": "045-446-40-82",
      "id": {
        "name": "HETU",
        "value": "NaNNA225undefined"
      },
      "picture": {
        "large": "https://randomuser.me/api/portraits/men/50.jpg",
        "medium": "https://randomuser.me/api/portraits/med/men/50.jpg",
        "thumbnail": "https://randomuser.me/api/portraits/thumb/men/50.jpg"
      },
      "nat": "FI"
    }
  ],
  "info": {
    "seed": "40e915b60b27487e",
    "results": 1,
    "page": 1,
    "version": "1.4"
  }
} 
*/

  List<RandomUserResults?>? results;
  RandomUserInfo? info;

  RandomUser({
    this.results,
    this.info,
  });
  RandomUser.fromJson(Map<String, dynamic> json) {
    if (json[_jsonKeyRandomUserResults] != null) {
      final v = json[_jsonKeyRandomUserResults];
      final arr0 = <RandomUserResults>[];
      v.forEach((v) {
        arr0.add(RandomUserResults.fromJson(v));
      });
      results = arr0;
    }
    info = (json[_jsonKeyRandomUserInfo] != null)
        ? RandomUserInfo.fromJson(json[_jsonKeyRandomUserInfo])
        : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (results != null) {
      final v = results;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data[_jsonKeyRandomUserResults] = arr0;
    }
    if (info != null) {
      data[_jsonKeyRandomUserInfo] = info!.toJson();
    }
    return data;
  }
}
