class MainPages {
  static String HomeScreen = "Home";
  static String BudgetScreen = "Budget";
  static String CalendarScreen = "Kalender";
  static String TaskScreen = "Aufgaben";
}

class CurrentPages {
  static String HomeScreen = "Home";

  static BudgetScreens budget = BudgetScreens();
  static TaskScreens task = TaskScreens();
  static CalendarScreens calendar = CalendarScreens();
}

class BudgetScreens {
  final String BudgetScreen = "Budget";
  final String BudgetCategoryScreen = "BudgetCategory";
  final String BudgetAddCategoryScreen = "BudgetAddCategory";
  final String BudgetEditCategoryScreen = "BudgetEditCategory";
  final String BudgetAddExpenditureScreen = "BudgetAddExpenditure";
  final String BudgetEditExpenditureScreen = "BudgetEditExpenditure";
  final String BudgetSettingsScreen = "BudgetSettingsScreen";
}

class TaskScreens {
  final String TaskAddScreen = "TaskAdd";
  final String TasksDailyScreen = "TasksDaily";
  final String TaskEditScreen = "TaskEdit";
  final String TaskDetailScreen = "TaskDetail";
  final String TaskOverviewScreen = "Aufgaben";
  final String TaskScreen = "Task";
}

class CalendarScreens {

}