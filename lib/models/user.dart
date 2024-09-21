class User {
  final String firstName,
      maidenName,
      lastName,
      email,
      phone,
      username,
      password,
      birthDate,
      image;
  final int age, id;

  const User({
    required this.id,
    required this.firstName,
    required this.maidenName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.username,
    required this.password,
    required this.birthDate,
    required this.image,
    required this.age,
  });

  factory User.fromJson(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      firstName: map['firstName'],
      maidenName: map['maidenName'],
      lastName: map['lastName'],
      email: map['email'],
      phone: map['phone'],
      username: map['username'],
      password: map['password'],
      birthDate: map['birthDate'],
      image: map['image'],
      age: map['age'],
    );
  }
}

