class Redacteur {
  final int? id;
  final String fname;
  final String lname;
  final String email;

  Redacteur(
      {required this.id,
      required this.fname,
      required this.lname,
      required this.email});

  Redacteur.sansId(this.id,
      {required this.fname, required this.lname, required this.email});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fname': fname,
      'lname': lname,
      'email': email,
    };
  }

  //define a method from map
  factory Redacteur.fromMap(Map<String, dynamic> map) {
    return Redacteur(
      id: map['id'],
      fname: map['fname'],
      lname: map['lname'],
      email: map['email'],
    );
  }
}
