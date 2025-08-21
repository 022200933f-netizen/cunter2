import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/counter_viewmodelmotos.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final motorsViewModel = Provider.of<MotorsViewModel>(context);
    final colors = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [colors.primaryContainer, colors.primary.withOpacity(0.3)],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.motorcycle, size: 60, color: Colors.deepOrange),
            const SizedBox(height: 10),
            const Text(
              'CONTADOR DE MOTOS',
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
                color: colors.primary,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: colors.primary.withOpacity(0.5),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Text(
                '${motorsViewModel.count}',
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildActionButton(
                  icon: Icons.remove,
                  color: colors.error,
                  onPressed: motorsViewModel.decrement,
                ),
                const SizedBox(width: 20),
                _buildActionButton(
                  icon: Icons.refresh,
                  color: colors.secondary,
                  onPressed: motorsViewModel.reset,
                  isReset: true,
                ),
                const SizedBox(width: 20),
                _buildActionButton(
                  icon: Icons.add,
                  color: colors.primary,
                  onPressed: motorsViewModel.increment,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              _getMotorcycleMessage(motorsViewModel.count),
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

  Widget _buildActionButton({
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
    bool isReset = false,
  }) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.5),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white),
        onPressed: onPressed,
      ),
    );
  }

  String _getMotorcycleMessage(int count) {
    if (count == 0) {
      return 'No hay motos en el taller';
    } else if (count == 1) {
      return '¡1 moto lista para entrega!';
    } else if (count < 5) {
      return '$count motos en reparación';
    } else {
      return '¡Taller a máxima capacidad! $count motos';
    }
  }
}