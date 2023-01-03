class Ecurie{
  int id;
  String nom;

  Ecurie({
    required this.id,
    required this.nom,
});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nom': nom,
    };
  }

  @override
  String toString() {
    return 'Ecurie{id: $id, nom: $nom}';
  }
}