class UserModel {
  String? name;
  String? email;
  String? specialty;
  String? uid;
  String? image;

  UserModel({
    this.name,
    this.email,
    this.specialty,
    this.uid,
    this.image,
  });


  UserModel.fromJson( Map<String , dynamic>? json ){
    name = json!['name'];
    email = json['email'];
    specialty = json['specialty'];
    uid = json['uid'];
    image = json['image'];
  }

  Map<String , dynamic>  toMap() {
    return {
      'name' : name,
      'email' :email,
      'specialty' :specialty,
      'uid' :uid,
      'image' :image,
    };
  }

}
