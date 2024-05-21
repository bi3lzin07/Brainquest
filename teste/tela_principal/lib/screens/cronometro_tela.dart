import 'package:flutter/material.dart';
import 'dart:async';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cronômetro Pomodoro',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CronometroTela(),
    );
  }
}

class CronometroTela extends StatefulWidget {
  @override
  _CronometroTela createState() => _CronometroTela();
}

class _CronometroTela extends State<CronometroTela> {
  Duration studyDuration =
      Duration(minutes: 1); // Changed the initial study duration to 1 minute
  Duration breakDuration =
      Duration(minutes: 1); // Changed the initial break duration to 1 minute
  Timer? _studyTimer;
  Timer? _breakTimer;
  Duration remainingStudyTime = Duration(minutes: 1);
  Duration remainingBreakTime = Duration(minutes: 1);

  void startStudyTimer() {
    _studyTimer?.cancel();
    _studyTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (remainingStudyTime.inSeconds > 0) {
          remainingStudyTime -= Duration(seconds: 1);
        } else {
          _studyTimer?.cancel();
        }
      });
    });
  }

  void startBreakTimer() {
    _breakTimer?.cancel();
    _breakTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (remainingBreakTime.inSeconds > 0) {
          remainingBreakTime -= Duration(seconds: 1);
        } else {
          _breakTimer?.cancel();
        }
      });
    });
  }

  void stopTimers() {
    _studyTimer?.cancel();
    _breakTimer?.cancel();
  }

  void resetTimers() {
    stopTimers();
    setState(() {
      remainingStudyTime = studyDuration;
      remainingBreakTime = breakDuration;
    });
  }

  void setStudyDuration(double value) {
    setState(() {
      studyDuration = Duration(minutes: value.toInt());
      remainingStudyTime = studyDuration;
    });
  }

  void setBreakDuration(double value) {
    setState(() {
      breakDuration = Duration(minutes: value.toInt());
      remainingBreakTime = breakDuration;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cronômetro Pomodoro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: _buildTimerCard(
                    title: 'Estudando',
                    duration: remainingStudyTime,
                    durationSetter: setStudyDuration,
                    maxDuration: 120,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: _buildTimerCard(
                    title: 'Descanso',
                    duration: remainingBreakTime,
                    durationSetter: setBreakDuration,
                    maxDuration: 30,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: startStudyTimer,
                  child: Text('Iniciar Estudo'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: startBreakTimer,
                  child: Text('Iniciar Descanso'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: stopTimers,
                  child: Text('Parar'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: resetTimers,
                  child: Text('Resetar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimerCard({
    required String title,
    required Duration duration,
    required void Function(double) durationSetter,
    required double maxDuration,
    required Color color,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: color),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${duration.inMinutes.toString().padLeft(2, '0')}',
                    style: TextStyle(fontSize: 32, color: color),
                  ),
                  Text(
                    ':',
                    style: TextStyle(fontSize: 32, color: color),
                  ),
                  Text(
                    '${(duration.inSeconds % 60).toString().padLeft(2, '0')}',
                    style: TextStyle(fontSize: 32, color: color),
                  ),
                ],
              ),
            ),
            Slider(
              value: duration.inMinutes.toDouble(),
              min: 1,
              max:
                  maxDuration, // Changed the max value to be greater than the min value
              divisions: maxDuration.toInt() - 1,
              onChanged: durationSetter,
              activeColor: color,
              label: duration.inMinutes.toString(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _studyTimer?.cancel();
    _breakTimer?.cancel();
    super.dispose();
  }
}
