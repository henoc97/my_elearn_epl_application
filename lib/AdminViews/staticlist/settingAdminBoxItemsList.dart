

class SettingAdminBoxItems {
  final String actionIconData1;
  final String actionIconData;
  final String actionText;
  final String actionExplanation;

  SettingAdminBoxItems({required this.actionIconData,required this.actionIconData1, required this.actionText, required this.actionExplanation});
  
  static List<SettingAdminBoxItems> getSettingAdminBoxItems(){

    List<SettingAdminBoxItems> boxItems = <SettingAdminBoxItems>[] ;


    boxItems.add(SettingAdminBoxItems(actionExplanation: 'Prof/Cours/Video/Exercices', actionIconData: "google_classroom_512px", actionText: 'Ajouter Prof et ces cours', actionIconData1: 'document_512px'));
    boxItems.add(SettingAdminBoxItems(actionExplanation: 'Choisir le professeur chargé d\'un cours', actionIconData: "google_classroom_512px", actionText: 'Lier un Prof à un cours ', actionIconData1: 'document_512px'));
    boxItems.add(SettingAdminBoxItems(actionExplanation: 'Graduation/Filière/Domaine/UE', actionIconData: "bookmark_512px", actionText: 'Ajouter des informations', actionIconData1: 'windows_notepad_512px'));
    boxItems.add(SettingAdminBoxItems(actionExplanation: 'Faire un lien entre les graduations, les filières, les domaines et les UE', actionIconData: "bookmark_512px", actionText: 'Lier Les filières et les cours', actionIconData1: 'windows_notepad_512px'));
  
    return boxItems;
  }
}

