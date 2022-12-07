class Ecurie{
  final int id;
  final String nom;

  const Ecurie({
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