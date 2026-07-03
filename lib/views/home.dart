import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:redacteur/models/redacteur.dart';
import 'package:redacteur/services/database_manager.dart';
import 'package:sqflite/sqflite.dart';

class RedacteurInterfaceUtilisateur extends StatefulWidget {
  const RedacteurInterfaceUtilisateur({super.key});

  @override
  State<RedacteurInterfaceUtilisateur> createState() =>
      _RedacteurInterfaceUtilisateurState();
}

class _RedacteurInterfaceUtilisateurState
    extends State<RedacteurInterfaceUtilisateur> {
  final FocusNode _focus = FocusNode();
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _prenomController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  List<Redacteur> redacteurs = [];
  @override
  void initState() {
    super.initState();
    _focus.addListener(() {
      setState(() {});
    });
    chargerRedacteur();
  }

  Future<void> chargerRedacteur() async {
    await DatabaseManager().dbInit();
    List<Redacteur> liste = await DatabaseManager().getRedacteurs();
    print('Chargement effectues');
    setState(() {
      redacteurs = liste;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        leading: Icon(Icons.menu, color: Colors.white),
        actions: [Icon(Icons.search, color: Colors.white)],
        title: Text(
          'Gestion des redacteurs',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            TextField(
              controller: _nomController,
              cursorColor: _focus.hasFocus ? Colors.grey : Colors.blue,
              decoration: InputDecoration(
                hintText: _focus.hasFocus ? 'Nom' : '',
                label: Text('Nom'),
                floatingLabelStyle: TextStyle(
                  color: _focus.hasFocus ? Colors.grey : Colors.blue,
                ),
                labelStyle: TextStyle(),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
            TextField(
              controller: _prenomController,
              cursorColor: _focus.hasFocus ? Colors.grey : Colors.blue,
              decoration: InputDecoration(
                hintText: _focus.hasFocus ? 'Prenom' : '',
                label: Text('Prenom'),
                floatingLabelStyle: TextStyle(
                  color: _focus.hasFocus ? Colors.grey : Colors.blue,
                ),
                labelStyle: TextStyle(),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
            TextField(
              controller: _emailController,
              cursorColor: _focus.hasFocus ? Colors.grey : Colors.blue,
              decoration: InputDecoration(
                hintText: _focus.hasFocus ? 'Email' : '',
                label: Text('Email'),
                floatingLabelStyle: TextStyle(
                  color: _focus.hasFocus ? Colors.grey : Colors.blue,
                ),
                labelStyle: TextStyle(),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
            TextButton(
              onPressed: () async {
                if(_nomController.text.isEmpty || _prenomController.text.isEmpty || _emailController.text.isEmpty){
                  return;
                }
                await DatabaseManager().insertRedacteur(Redacteur(redacteurId: redacteurs.isEmpty? 0:redacteurs.length + 1, nom: _nomController.text, prenom: _prenomController.text, email: _emailController.text));
                print('\ncliquez\n');
                print('Vous etes : ${_nomController.text} ${_prenomController.text} ${_emailController.text} ');
                var liste = await DatabaseManager().getRedacteurs();
                _nomController.clear();
                _prenomController.clear();
                _emailController.clear();
                setState(() {
                  redacteurs = liste;
                  print(redacteurs.length);
                });
              },
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Colors.pink,
                ),
                child: Row(
                  children: [
                    Icon(Icons.add, size: 28),
                    Text(
                      'Ajouter un redacteur',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: ListView.builder(itemCount: redacteurs.length, itemBuilder: (BuildContext context, int index){
                int indexInverse = redacteurs.length - 1 - index;
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
          
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${redacteurs[indexInverse].nom} ${redacteurs[indexInverse].prenom}', style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20
                      ),),
                      Text(redacteurs[indexInverse].email)
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                    IconButton(icon: Icon(Icons.delete), onPressed: () async{
                      int id = redacteurs[indexInverse].redacteurId!;
                      await DatabaseManager().deleteRedacteur(id);
                      var liste = await DatabaseManager().getRedacteurs();

                      setState(() {
                        redacteurs = liste;
                      });
                    },),
                    IconButton(icon: Icon(Icons.edit_rounded), onPressed: () {
                      TextEditingController _nom = TextEditingController(text: redacteurs[indexInverse].nom);
                      TextEditingController _prenom = TextEditingController(text: redacteurs[indexInverse].prenom);
                      TextEditingController _email = TextEditingController(text: redacteurs[indexInverse].email);
      
                      showDialog(context: context, builder: (context){
                        return AlertDialog(
                          constraints: BoxConstraints(maxHeight: 350),
                          title: Text('Modifier Redacteur', style: TextStyle(fontSize: 18,),textAlign: TextAlign.center,),
                          content: Container(
                            child: Column(
                              children: [
                                TextField(
                                  controller: _nom,
                                  decoration: InputDecoration(
                                    hintText: _focus.hasFocus? redacteurs[indexInverse].nom:'',
                                    labelText: 'Nom'
                                  ),
                                ),
                                TextField(
                                  controller: _prenom,
                                  decoration: InputDecoration(
                                    hintText: _focus.hasFocus? redacteurs[indexInverse].prenom:'',
                                    labelText: 'Prenom'
                                  ),
                                ),
                                TextField(
                                  controller: _email,
                                  decoration: InputDecoration(
                                    hintText: _focus.hasFocus? redacteurs[indexInverse].email:'',
                                    labelText: 'Email'
                                  ),
                                ),

                                SizedBox(height: 30,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(onPressed: (){Navigator.pop(context);}, child: Text('Annuler', style: TextStyle(color: Colors.green),)),
                                    TextButton(onPressed: () async {
                                      Redacteur redacteur = Redacteur(redacteurId: redacteurs[indexInverse].redacteurId, nom: _nom.text, prenom: _prenom.text, email: _email.text);
                                      await DatabaseManager().updateRedacteur(redacteur);
                                      var liste = await DatabaseManager().getRedacteurs();
                                      setState(() {
                                        redacteurs = liste;
                                      });
                                      Navigator.pop(context);

                                    }, child: Text('Enregistrer', style: TextStyle(color: Colors.green),))
                                  ],
                                )


                              ],
                            ),
                          ),
                          
                        );
                      });
                    },),
                    
                  ],)
                ],
              );
            }))

          ],
        ),
      ),
    );
  }
}
