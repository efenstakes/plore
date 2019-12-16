

class User {
  int id;
  String name;
  String email;

  User({ this.id, this.name, this.email });

  String toString() {
    return 'name '+ this.name;
  }

  static User fromJson(json) {
    return User(
      id: json['id'], name: json['name'], 
      email: json['email'],
    );
  }// User fromJson(json) { .. }

}// class User { .. }