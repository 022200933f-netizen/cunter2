import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/counter_viewmodel.dart';

class CounterViewTwo extends StatelessWidget {
  const CounterViewTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final usersViewModel = Provider.of<UsersViewModel>(context);
    final colors = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [colors.tertiaryContainer, colors.tertiary.withOpacity(0.3)],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.people, size: 60, color: Colors.teal),
            const SizedBox(height: 10),
            const Text(
              'CONTADOR DE USUARIOS',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: colors.tertiary,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: colors.tertiary.withOpacity(0.5),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Text(
                '${usersViewModel.count}',
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 40),
            Wrap(
              spacing: 15,
              runSpacing: 15,
              alignment: WrapAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: 'decrementUsers',
                  onPressed: usersViewModel.decrement,
                  backgroundColor: colors.error,
                  child: const Icon(Icons.remove, color: Colors.white, size: 28),
                ),
                FloatingActionButton(
                  heroTag: 'resetUsers',
                  onPressed: usersViewModel.reset,
                  backgroundColor: colors.secondary,
                  child: const Icon(Icons.refresh, color: Colors.white, size: 28),
                ),
                FloatingActionButton(
                  heroTag: 'incrementUsers',
                  onPressed: usersViewModel.increment,
                  backgroundColor: colors.tertiary,
                  child: const Icon(Icons.add, color: Colors.white, size: 28),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              _getUserMessage(usersViewModel.count),
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: colors.onBackground.withOpacity(0.7),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  String _getUserMessage(int count) {
    if (count == 0) {
      return 'No hay usuarios conectados';
    } else if (count == 1) {
      return '1 usuario activo en el sistema';
    } else if (count < 10) {
      return '$count usuarios utilizando la aplicación';
    } else {
      return '¡Gran actividad! $count usuarios conectados';
    }
  }
}