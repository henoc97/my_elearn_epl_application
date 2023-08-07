import 'package:flutter/material.dart';


class ShowDialog{
  void showDialogRigth(BuildContext context, String dbmsg,) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Message"),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(width: 230,
                  child: Text(dbmsg, style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),)),
                const Icon(
                  Icons.done_outline_rounded,
                  size: 40,
                  color: Colors.green,
                )
              ],
            ),
            actions: <Widget>[
              TextButton(
                child:  const Text("Fermer"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }


void showDialogWrong(BuildContext context, String dbmsg,) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Message"),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(dbmsg),
                const Icon(
                  Icons.done_outline_rounded,
                  size: 40,
                  color: Colors.red,
                )
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: const Text("Fermer"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

void showDialogWrongidentity(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Message"),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 200,
                  child:  Text("Cette personne n'a pas été enrégistrée",
                  style: TextStyle( fontWeight: FontWeight.w600,fontSize: 18),
                  )),
                
                Image.asset("assets/photos/cancel_480px.png",  scale: 8,)
              ],
            ),
            actions: <Widget>[
               TextButton(
                child: Text("Réessayer",style: 
                            TextStyle(
                              shadows: [for (int i = 0; i<= 6; i++)
                                  Shadow(color:Color.fromARGB(255, 5, 204, 18),
                                  blurRadius: i * 10,
                                   )
                              ],
                              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
}
 