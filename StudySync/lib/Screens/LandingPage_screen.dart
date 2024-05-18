import 'package:codex_app/Components/AlertBox.dart';
import 'package:codex_app/Components/LabelStyle.dart';
import 'package:codex_app/Components/NeoBox.dart';
import 'package:codex_app/Customs/Customized_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../Components/FloatingButton.dart';
import '../Components/HabitTile.dart';
import '../Components/MonthSummary.dart';
import '../DBHelpher/CodeSyncDB.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  HabitDatabase db = HabitDatabase();
  final _myBox = Hive.box("Habit_Database");

  @override
  void initState() {
    // if there is no current habit list, then it is the 1st time ever opening the app
    // then create default data
    if (_myBox.get("CURRENT_HABIT_LIST") == null) {
      db.createDefaultData();
    }

    // there already exists data, this is not the first time
    else {
      db.loadData();
    }

    // update the database
    db.updateDatabase();
    super.initState();
  }

  // checkbox was tapped
  void checkBoxTapped(bool? value, int index) {
    setState(() {
      db.updateList[index][1] = value;
    });
    db.updateDatabase();
  }

  // create a new habit
  final _newHabitNameController = TextEditingController();
  void createNewHabit() {
    // show alert dialog for user to enter the new habit details
    showDialog(
      context: context,
      builder: (context) {
        return UpdateDialog(
            controller: _newHabitNameController,
            hintText: 'Input your goal',
            title: 'CREATE NEW TASK',
            caption: 'Would you like to save task?',
            onSave: saveNewHabit,
            onCancel: cancelDialogBox);
      },
    );
  }

  // save new habit
  void saveNewHabit() {
    // add new habit to todays habit list
    setState(() {
      _newHabitNameController.text != ''
          ? db.updateList.add([_newHabitNameController.text, false])
          : null;
    });

    // clear textfield
    _newHabitNameController.clear();
    // pop dialog box
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  // cancel new habit
  void cancelDialogBox() {
    // clear textfield
    _newHabitNameController.clear();

    // pop dialog box
    Navigator.of(context).pop();
  }

  // open habit settings to edit
  void openHabitSettings(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return UpdateDialog(
          title: 'UPDATE TASK:',
          caption: 'Would you like to revised task?',
          controller: _newHabitNameController,
          hintText: db.updateList[index][0],
          onSave: () => saveExistingHabit(index),
          onCancel: cancelDialogBox,
        );
      },
    );
  }

  // save existing habit with a new name
  void saveExistingHabit(int index) {
    setState(() {
      db.updateList[index][0] = _newHabitNameController.text;
    });
    _newHabitNameController.clear();
    Navigator.pop(context);
    db.updateDatabase();
  }

  // delete habit
  void deleteHabit(int index) {
    deleteConfirm(context, 'Do you want to delete?', () {
      setState(() {
        db.updateList.removeAt(index);
      });
      db.updateDatabase();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: MyFloatingActionButton(onPressed: createNewHabit),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        toolbarHeight: 50,
        centerTitle: true,
        title: LabelText(
          label: 'STUDYSYNC DATA',
          letterSpacing: 3,
          fontsize: 16,
          fontweight: FontWeight.w500,
          colors: dblueBG,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 15),
        child: ListView(
          children: [
            // monthly summary heat map
            NeoBox(
              child: MonthlySummary(
                datasets: db.heatMapDataSet,
                startDate: _myBox.get("START_DATE"),
              ),
            ),
            const Gap(20),
            LabelText(
              label: 'DAILY TASK',
              fontsize: 14,
              fontweight: FontWeight.w400,
              letterSpacing: 3,
            ),
            const Divider(),
            // list of habits
            db.updateList.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: db.updateList.length,
                    itemBuilder: (context, index) {
                      return HabitTile(
                        habitName: db.updateList[index][0],
                        habitCompleted: db.updateList[index][1],
                        onChanged: (value) => checkBoxTapped(value, index),
                        settingsTapped: (context) => openHabitSettings(index),
                        deleteTapped: (context) => deleteHabit(index),
                      );
                    },
                  )
                : Center(
                    child: Column(
                      children: [
                        const Gap(50),
                        Image.asset(
                          'Assets/Gifs/NotFounds.gif',
                          scale: 3,
                        ),
                        LabelText(
                          label: 'No task found...',
                          fontsize: 15,
                        )
                      ],
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
