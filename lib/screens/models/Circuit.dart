class Circuit{
  final int id;
  final String nom;
  final String pays;

  const Circuit({
    required this.id,
    required this.nom,
    required this.pays,
});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nom': nom,
      'pays': pays,
    };
  }

  @override
  String toString() {
    return 'Circuit{id: $id, nom: $nom, pays: $pays}';
  }
}