

class SettingAddProfAndCourseBoxItems {
  
  final String actionIconData;
  final String actionText;

  SettingAddProfAndCourseBoxItems({required this.actionIconData, required this.actionText,});
  
  static List<SettingAddProfAndCourseBoxItems> getSettingAddProfAndCourseBoxItems(){

    List<SettingAddProfAndCourseBoxItems> boxItems = <SettingAddProfAndCourseBoxItems>[] ;


    boxItems.add(SettingAddProfAndCourseBoxItems(actionIconData: "google_classroom_512px", actionText: 'Ajouter un professeur', ));
    boxItems.add(SettingAddProfAndCourseBoxItems(actionIconData: "about_512px", actionText: 'Description d\'un professeur', ));
    boxItems.add(SettingAddProfAndCourseBoxItems(actionIconData: "bookmark_512px", actionText: 'Ajouter un Cours', ));
    boxItems.add(SettingAddProfAndCourseBoxItems(actionIconData: "vegas_512px", actionText: 'Ajouter une vidéo',));
    boxItems.add(SettingAddProfAndCourseBoxItems(actionIconData: "notability_512px", actionText: 'Ajouter un exercice', ));
    boxItems.add(SettingAddProfAndCourseBoxItems(actionIconData: "synchronize_512px", actionText: 'Valider la mise à jour',));
   
    return boxItems;
  }
}
