import 'dart:math';
import 'package:flutter/material.dart';

class Jkp extends StatefulWidget {
  @override
  _JkpState createState() => _JkpState();
}

class _JkpState extends State<Jkp> {

  var _imagemApp = AssetImage("assets/images/jokenpo.jpg");
  var _mensagemAlerta = "Escolha uma opção abaixo:";
  String minhaEscolha = "assets/images/jokenpo.jpg";

  void _selectedOption(String minhaOpcao){

    

    var options = ["Pedra", "Papel", "Tesoura"];
    var n = Random().nextInt(3);
    var escolhaBot = options[n];

    switch(escolhaBot){

      case "Pedra":
        setState(() {
          this._imagemApp = AssetImage("assets/images/pedra.jpg");
        });
        break;

        case "Papel":
        setState(() {
          this._imagemApp = AssetImage("assets/images/papel.jpg");
        });
        break;

        case "Tesoura":
        setState(() {
          this._imagemApp = AssetImage("assets/images/tesoura.jpg");
        });
        break;
    }

    switch(minhaOpcao){

      case "Pedra":
        minhaEscolha = "assets/images/pedra.jpg";
        setState(() {
          this.minhaEscolha = minhaEscolha;
        });
        break;

        case "Papel":
        minhaEscolha = "assets/images/papel.jpg";
        setState(() {
          this.minhaEscolha = minhaEscolha;
        });
        break;

        case "Tesoura":
        minhaEscolha = "assets/images/tesoura.jpg";
        setState(() {
          this.minhaEscolha = minhaEscolha;
        });
        break;
    }

    if(
      (minhaOpcao == "Pedra" && escolhaBot == "Tesoura") ||
      (minhaOpcao == "Tesoura" && escolhaBot == "Papel") ||
      (minhaOpcao == "Papel" && escolhaBot == "Pedra")
    ){
      setState(() {
        this._mensagemAlerta = "Você ganhou!";
      });
    }else if(
      (minhaOpcao == "Pedra" && escolhaBot == "Tesoura") ||
      (minhaOpcao == "Tesoura" && escolhaBot == "Papel") ||
      (minhaOpcao == "Papel" && escolhaBot == "Pedra")
    ){
      setState(() {
        this._mensagemAlerta = "Você Perdeu!";
      });
    }else{
      setState(() {
        this._mensagemAlerta = "Empatou!";
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pedra, Papel e tesoura"),
        backgroundColor: Colors.lightBlue, centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do bot:",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Image(image: this._imagemApp),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              this._mensagemAlerta,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
         Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RaisedButton(
                      child: Text('Pedra', style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      onPressed: () => _selectedOption("Pedra"),
                    ),RaisedButton(
                      child: Text('Papel', style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      onPressed: () => _selectedOption("Papel"),
                    ),RaisedButton(
                      child: Text('Tesoura', style: TextStyle(color: Colors.blueGrey, fontSize: 16),
                      ),
                      onPressed: () => _selectedOption("Tesoura"),
                    ),
                    Image.asset(minhaEscolha, width: 100,)
                    ],
                    )
        ],
      ),
    );
  }
}