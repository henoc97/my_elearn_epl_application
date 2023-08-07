

class Types_cours{
  Types_cours({ required  this.cours});
  String cours;

  static List <Types_cours> getTypes_courss(){
    List<Types_cours> items_cours = <Types_cours>[];

    items_cours.add(Types_cours(cours: 'assets/photos/cours_1.jpg'));
    items_cours.add(Types_cours(cours: 'assets/photos/cours_2.jpg'));
    items_cours.add(Types_cours(cours: 'assets/photos/cours_3.jpg'));
    items_cours.add(Types_cours(cours: 'assets/photos/cours_4.jpg'));
    items_cours.add(Types_cours(cours: 'assets/photos/cours_5.jpg'));
    items_cours.add(Types_cours(cours: 'assets/photos/cours_6.webp'));
    items_cours.add(Types_cours(cours: 'assets/photos/cours_7.jpg'));
    items_cours.add(Types_cours(cours: 'assets/photos/cours_8.jpg'));
    items_cours.add(Types_cours(cours: 'assets/photos/cours_9.jpg'));
    items_cours.add(Types_cours(cours: 'assets/photos/cours_10.jpg'));
    
    return items_cours;
  }
}