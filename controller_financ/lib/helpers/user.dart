class User {
  int id;
  String name;
  String first_name;
  String last_Name;
  String email;
  String picture_url;

  User();

  User.fromMap(Map map){
    id = map['id'];
    name = map['name'];
    first_name = map['first_name'];
    last_Name = map['last_Name'];
    email = map['email'];
    picture_url = map['picture']['data']['url'];
  }
  
  Map toMap() {
    Map<String, dynamic> map = {
      'name': name,
      'first_name': first_name,
      'last_Name' : 'last_Name',
      'email': email,
      'picture_url' : picture_url,  
    };
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

    @override
  String toString() {
    // TODO: implement toString
    return "User(id: $id, name: $name, email: $email, first_name: $first_name, last_Name: $last_Name, picture_url: $picture_url)";
  }
}

