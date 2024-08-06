
class EphemeralKeyModel {
  String? id;
  String? object;
  List<AssociatedObjects>? associatedObjects;
  int? created;
  int? expires;
  bool? livemode;
  String? secret;

  EphemeralKeyModel({this.id, this.object, this.associatedObjects, this.created, this.expires, this.livemode, this.secret});

  EphemeralKeyModel.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["object"] is String) {
      object = json["object"];
    }
    if(json["associated_objects"] is List) {
      associatedObjects = json["associated_objects"] == null ? null : (json["associated_objects"] as List).map((e) => AssociatedObjects.fromJson(e)).toList();
    }
    if(json["created"] is int) {
      created = json["created"];
    }
    if(json["expires"] is int) {
      expires = json["expires"];
    }
    if(json["livemode"] is bool) {
      livemode = json["livemode"];
    }
    if(json["secret"] is String) {
      secret = json["secret"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["object"] = object;
    if(associatedObjects != null) {
      _data["associated_objects"] = associatedObjects?.map((e) => e.toJson()).toList();
    }
    _data["created"] = created;
    _data["expires"] = expires;
    _data["livemode"] = livemode;
    _data["secret"] = secret;
    return _data;
  }
}

class AssociatedObjects {
  String? id;
  String? type;

  AssociatedObjects({this.id, this.type});

  AssociatedObjects.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["type"] is String) {
      type = json["type"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["type"] = type;
    return _data;
  }
}