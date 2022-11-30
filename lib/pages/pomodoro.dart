import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ponto_trabalho/store/pomodoro.store.dart';
import 'package:ponto_trabalho/widgets/cronometro.dart';
import 'package:provider/provider.dart';
import '../widgets/EntradaTempo.dart';

class Pomodoro extends StatelessWidget {
  const Pomodoro({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Cronometro(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: Observer(
              builder: (_) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    EntradaTempo(
                      titulo: 'Trabalho',
                      valor: store.tempoTrabalho,
                      inc: (store.iniciado && store.estaTrabalhando() ? null : store.incrementarTempoTrabalho),
                      dec: (store.iniciado && store.estaTrabalhando() ? null : store.decrementarTempoTrabalho),
                    ),
                    EntradaTempo(
                        titulo: 'Descanso',
                        valor: store.tempoDescanso,
                        inc: (store.estaDescansando() && store.iniciado) ? null : store.incrementarTempoDescanso,
                        dec: (store.estaDescansando() && store.iniciado) ? null : store.decrementarTempoDescanso,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
