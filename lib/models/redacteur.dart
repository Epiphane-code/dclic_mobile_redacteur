class Redacteur {
  int? redacteurId;
  String nom;
  String prenom;
  String email;

  Redacteur({
    required this.redacteurId,
    required this.nom,
    required this.prenom,
    required this.email,
  });

  Redacteur.noID({
    this.redacteurId,
    required this.nom,
    required this.prenom,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {'redacteurId': redacteurId, 'nom': nom, 'prenom': prenom, 'email': email};
  }

  factory Redacteur.fromMap(Map<String, dynamic> map) {
    return Redacteur(
      redacteurId: map['redacteurId'],
      nom: map['nom'],
      prenom: map['prenom'],
      email: map['email'],
    );
  }
}
