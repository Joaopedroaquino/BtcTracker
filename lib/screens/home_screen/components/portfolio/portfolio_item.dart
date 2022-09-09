import 'dart:math' as math;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../components/chart.dart';
import '../../../../components/custom_icon.dart';
import '../../../../components/models/currency.dart';
import '../../../../utils/constants.dart';
import '../currency_title.dart';

class PortfolioItem extends StatelessWidget {
  final Currency currency;
    //Future = dados futuros
  Future<Map> _recuparPrecoBitcoin() async {
    String url = "https://blockchain.info/ticker";
    http.Response respostaEnderecoURL = await http.get(Uri.parse(url));
    return json.decode(respostaEnderecoURL.body);}

    


  

  const PortfolioItem({
    Key? key,
    required this.currency,
  }) : super(key: key);

  Widget currentAmount() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              currency.usdAmountString,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 2),
            Text(
              '${currency.currentAmount} ${currency.code}',
              style: const TextStyle(
                color: kSecondaryTextColor,
              ),
            ),
          ],
        ),
        const Spacer(),
        Icon(
          currency.profit >= 0
              ? FontAwesomeIcons.caretUp
              : FontAwesomeIcons.caretDown,
          size: 16,
        ),
        const SizedBox(width: 2),
        Text(currency.profitString),
      ],
    );
  }



  Widget portfolioChart() {
    final minPrice = currency.priceHistory.reduce(math.min);
    final maxPrice = currency.priceHistory.reduce(math.max);

    return Chart(
      data: currency.priceHistory,
      minData: minPrice,
      maxData: maxPrice,
      minY: 0.94 * minPrice,
      paddingTop: 72,
      thickness: 2,
      gradientColors: [
        kSecondaryColor,
        kSecondaryColor.withOpacity(0),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

return FutureBuilder<Map>(
      future: _recuparPrecoBitcoin(),

      builder: (context, snapshot){
        //declarando variáveis
        double _precoBitcoin = 0.0;
        String resultadoConexaoFuture = "";

        switch( snapshot.connectionState ){
          case ConnectionState.none :
            print("conexao none");
            resultadoConexaoFuture = "Nenhuma Conexão";
            break;

          case ConnectionState.waiting :
            print("conexao waiting");
            resultadoConexaoFuture = "Carregando...";
            break;

          case ConnectionState.active :
            print("conexao active");
            resultadoConexaoFuture = "Ativa...";
            break;

          case ConnectionState.done :
            print("conexao done");
            if( snapshot.hasError ){
              resultadoConexaoFuture = "Mal Sucedida! Erro ao carregar os dados!";
            }
            else {
              _precoBitcoin = snapshot.data!["BRL"]["buy"];
              resultadoConexaoFuture = "Bem Sucedida!";

              print(_precoBitcoin);
              print(resultadoConexaoFuture);
              //resultadoConexaoFuture = "Preço do bitcoin: ${_precoBitcoin.toString()} ";
            }
            break;
        }

    return ClipRRect(
      borderRadius: BorderRadius.circular(28),
      child: Container(
        width: 210,
        height: 160,
        color: kPrimaryColor,
        child: Stack(
          children: [
            portfolioChart(),
            Positioned(
              left: 20,
              top: 20,
              child: Row(
                children: [
                  CustomIcon(icon: currency.icon),
                  const SizedBox(width: 16),
                  CurrencyTitle(
                    code: currency.code,
                    name: currency.name,
                  ),
                ],
              ),
            ),
            Positioned(
              left: 20,
              right: 20,
              bottom: 20,
              child: currentAmount(),
            ),
          
          ],
        ),
      ),
    );
  }

  
);
  
}


}