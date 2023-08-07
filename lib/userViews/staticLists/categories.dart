
class Categorie{
  Categorie({ required  this.cats});
  String cats;

  static List <Categorie> getCategories(){
    List<Categorie> items = <Categorie>[];

    items.add(Categorie(cats: 'assets/photos/cat_1.jpg'));
    items.add(Categorie(cats: 'assets/photos/cat_2.jpg'));
    items.add(Categorie(cats: 'assets/photos/cat_3.jpg'));
    items.add(Categorie(cats: 'assets/photos/cat_4.jpg'));
    items.add(Categorie(cats: 'assets/photos/cat_5.jpg'));
    items.add(Categorie(cats: 'assets/photos/cat_6.jpg'));
    items.add(Categorie(cats: 'assets/photos/cat_7.jpg'));
    items.add(Categorie(cats: 'assets/photos/cat_8.jpg'));
    items.add(Categorie(cats: 'assets/photos/cat_9.jpeg'));
    items.add(Categorie(cats: 'assets/photos/cat_10.jpg'));
    
    return items;
  }
}
