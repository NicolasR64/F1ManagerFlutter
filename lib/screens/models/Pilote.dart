import 'Ecurie.dart';

class Pilote{
  int id;
  String nom;
  String prenom;
  String numero;
  String ecurie;
  int points;

  Pilote({
    required this.id,
    required this.nom,
    required this.prenom,
    required this.numero,
    required this.ecurie,
    required this.points,
});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nom': nom,
      'prenom': prenom,
      'numero': numero,
      'ecurie': ecurie,
      'points': points,
    };
  }

  @override
  String toString() {
    return 'Pilote{id: $id, nom: $nom, prenom: $prenom, numero: $numero, ecurie: $ecurie, points: $points}';
  }
}