import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/counter_viewmodel.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final counterVM = Provider.of<CounterViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Contador MVVM"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Valor actual del contador:",
                style: TextStyle(fontSize: 20)),
            Text(
              "${counterVM.count}",
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: counterVM.increment,
                  child: const Text("Incrementar"),
                ),
                const SizedBox(width: 15),
                ElevatedButton(
                  onPressed: counterVM.decrement,
                  child: const Text("Decrementar"),
                ),
                const SizedBox(width: 15),
                ElevatedButton(
                  onPressed: counterVM.reset,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, // 👈 Botón de reinicio en rojo
                  ),
                  child: const Text("Reiniciar"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
