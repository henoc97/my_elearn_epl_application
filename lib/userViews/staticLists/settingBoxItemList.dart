
class SettingBoxItems {

  final String actionIconData;
  final String actionText;
  final String actionExplanation;

  SettingBoxItems({required this.actionIconData, required this.actionText, required this.actionExplanation});
  
  static List<SettingBoxItems> getSettingBoxItems(){

    List<SettingBoxItems> boxItems = <SettingBoxItems>[] ;


    boxItems.add(SettingBoxItems(actionExplanation: 'Historique de la version', actionIconData: "driver_booster_512px", actionText: 'Change Logs'));
  //  boxItems.add(SettingBoxItems(actionExplanation: 'Taux sur Google Play Store', actionIconData: "star_96px", actionText: 'Evaluer Nous'));
    boxItems.add(SettingBoxItems(actionExplanation: 'Prendre Contact avec nous', actionIconData: "Phone Link_512px", actionText: 'Contacter Nous'));
    boxItems.add(SettingBoxItems(actionExplanation: 'Mode d\'utilisation', actionIconData: "info_512px", actionText: 'Documentation'));
    boxItems.add(SettingBoxItems(actionExplanation: 'Partager EPL\'s school avec tes amis', actionIconData: "share_512px", actionText: 'Partager'));
    boxItems.add(SettingBoxItems(actionExplanation: 'Français/Anglais', actionIconData: "avast_512px", actionText: 'Langage'));
    boxItems.add(SettingBoxItems(actionExplanation: 'Version 5.17.0', actionIconData: "about_512px", actionText: 'Apropos de nous'));
    boxItems.add(SettingBoxItems(actionExplanation: 'Ajout/Supp des cours', actionIconData: "wallpaper_engine_512px", actionText: 'Administrateur'));
    
    
    return boxItems;
  }
}
