import '../models/exercises.dart';

// 'All',
// 'Back',
// 'Abs',
// 'Traps',
// 'Triceps',
// 'Forearms',
// 'Calves',
// 'Front Delts',
// 'Glutes',
// 'Chest',
// 'Biceps',
// 'Quads',
// 'Hamstrings',
// 'Side Delts',
// 'Rear Delts',

List<Exercise> DEFAULT_EXERCISES = [
  // Back
  Exercise(
    name: 'Barbell Bent Over Row',
    barWeight: 45,
    bodyparts: ['Back'],
    barInKG: false,
  ),
  Exercise(
    name: 'Cambered Bar Row',
    barWeight: 45,
    bodyparts: ['Back'],
    barInKG: false,
  ),
  Exercise(
    name: 'Barbell Row to Chest',
    barWeight: 45,
    bodyparts: ['Back'],
    barInKG: false,
  ),
  Exercise(
    name: 'Underhand EZ Bar Row',
    barWeight: 45,
    bodyparts: ['Back'],
    barInKG: false,
  ),
  Exercise(
    name: 'Smith Machine Row',
    barWeight: 45,
    bodyparts: ['Back'],
    barInKG: false,
  ),
  Exercise(
    name: 'Chest Supported Row',
    barWeight: 45,
    bodyparts: ['Back'],
    barInKG: false,
  ),
  Exercise(
    name: 'Machine Chest Supported Row',
    barWeight: 45,
    bodyparts: ['Back'],
    barInKG: false,
  ),
  Exercise(
    name: 'T Bar Row',
    barWeight: 45,
    bodyparts: ['Back'],
    barInKG: false,
  ),
  Exercise(
    name: 'Incline Dumbbell Row',
    barWeight: 45,
    bodyparts: ['Back'],
    barInKG: false,
  ),
  Exercise(
    name: 'Two Arm Dumbbell Row',
    barWeight: 45,
    bodyparts: ['Back'],
    barInKG: false,
  ),
  Exercise(
    name: 'Single Arm Dumbbell Row',
    barWeight: 45,
    bodyparts: ['Back'],
    barInKG: false,
  ),
  Exercise(
    name: 'Hammer Low Row',
    barWeight: 45,
    bodyparts: ['Back'],
    barInKG: false,
  ),
  Exercise(
    name: 'Seal Row',
    barWeight: 45,
    bodyparts: ['Back'],
    barInKG: false,
  ),
  Exercise(
    name: 'Inverted Row',
    barWeight: 45,
    bodyparts: ['Back'],
    barInKG: false,
  ),
  Exercise(
    name: 'Seated Cable Row',
    barWeight: 45,
    bodyparts: ['Back'],
    barInKG: false,
  ),
  Exercise(
    name: 'Normal Grip Pullup',
    barWeight: 45,
    bodyparts: ['Back'],
    barInKG: false,
  ),
  Exercise(
    name: 'Wide Grip Pullup',
    barWeight: 45,
    bodyparts: ['Back'],
    barInKG: false,
  ),
  Exercise(
    name: 'Parallel Grip Pullup',
    barWeight: 45,
    bodyparts: ['Back'],
    barInKG: false,
  ),
  Exercise(
    name: 'Underhand Pullup',
    barWeight: 45,
    bodyparts: ['Back'],
    barInKG: false,
  ),
  Exercise(
    name: 'Assisted Normal Grip Pullup',
    barWeight: 45,
    bodyparts: ['Back'],
    barInKG: false,
    assisted: true,
  ),
  Exercise(
    name: 'Assisted Wide Grip Pullup',
    barWeight: 45,
    bodyparts: ['Back'],
    barInKG: false,
    assisted: true,
  ),
  Exercise(
    name: 'Assisted Parallel Pullup',
    barWeight: 45,
    bodyparts: ['Back'],
    barInKG: false,
    assisted: true,
  ),
  Exercise(
    name: 'Assisted Underhand Pullup',
    barWeight: 45,
    bodyparts: ['Back'],
    barInKG: false,
    assisted: true,
  ),
  Exercise(
    name: 'Normal Grip Pulldown',
    barWeight: 45,
    bodyparts: ['Back'],
    barInKG: false,
  ),
  Exercise(
    name: 'Wide Grip Pulldown',
    barWeight: 45,
    bodyparts: ['Back'],
    barInKG: false,
  ),
  Exercise(
    name: 'Parallel Pulldown',
    barWeight: 45,
    bodyparts: ['Back'],
    barInKG: false,
  ),
  Exercise(
    name: 'Underhand Pulldown',
    barWeight: 45,
    bodyparts: ['Back'],
    barInKG: false,
  ),
  Exercise(
    name: 'Narrow Grip Pulldown',
    barWeight: 45,
    bodyparts: ['Back'],
    barInKG: false,
  ),
  Exercise(
    name: 'Hammer High Row',
    barWeight: 45,
    bodyparts: ['Back'],
    barInKG: false,
  ),
  Exercise(
    name: 'Dumbbell Pullover',
    barWeight: 45,
    bodyparts: ['Back'],
    barInKG: false,
  ),
  Exercise(
    name: 'Machine Pullover',
    barWeight: 45,
    bodyparts: ['Back'],
    barInKG: false,
  ),
  Exercise(
    name: 'Straight Arm Pulldown',
    barWeight: 45,
    bodyparts: ['Back'],
    barInKG: false,
  ),
  //Ab
  Exercise(
    name: 'Hanging Knee Raise',
    barWeight: 45,
    bodyparts: ['Abs'],
    barInKG: false,
  ),
  Exercise(
    name: 'Hanging Straight Leg Raise',
    barWeight: 45,
    bodyparts: ['Abs'],
    barInKG: false,
  ),
  Exercise(
    name: 'Machine Crunch',
    barWeight: 45,
    bodyparts: ['Abs'],
    barInKG: false,
  ),
  Exercise(
    name: 'Modified Candlestick',
    barWeight: 45,
    bodyparts: ['Abs'],
    barInKG: false,
  ),
  Exercise(
    name: 'Rope Crunch',
    barWeight: 45,
    bodyparts: ['Abs'],
    barInKG: false,
  ),
  Exercise(
    name: 'Slant Board Situp',
    barWeight: 45,
    bodyparts: ['Abs'],
    barInKG: false,
  ),
  Exercise(
    name: 'V-Up',
    barWeight: 45,
    bodyparts: ['Abs'],
    barInKG: false,
  ),
  Exercise(
    name: 'Reaching Situp',
    barWeight: 45,
    bodyparts: ['Abs'],
    barInKG: false,
  ),
  //Traps
  Exercise(
    name: 'Barbell Shrug',
    barWeight: 45,
    bodyparts: ['Traps'],
    barInKG: false,
  ),
  Exercise(
    name: 'Barbell Bent Shrug',
    barWeight: 45,
    bodyparts: ['Traps'],
    barInKG: false,
  ),
  Exercise(
    name: 'Dumbbell Shrug',
    barWeight: 45,
    bodyparts: ['Traps'],
    barInKG: false,
  ),
  Exercise(
    name: 'Dumbbell Lean Shrug',
    barWeight: 45,
    bodyparts: ['Traps'],
    barInKG: false,
  ),
  Exercise(
    name: 'Cable Single Arm Side Shrug',
    barWeight: 45,
    bodyparts: ['Traps'],
    barInKG: false,
  ),
  Exercise(
    name: 'Cable Side Shrug',
    barWeight: 45,
    bodyparts: ['Traps'],
    barInKG: false,
  ),
  Exercise(
    name: 'Seated Dumbbell Shrug',
    barWeight: 45,
    bodyparts: ['Traps'],
    barInKG: false,
  ),
  Exercise(
    name: 'Cable Shrug',
    barWeight: 45,
    bodyparts: ['Traps'],
    barInKG: false,
  ),
  Exercise(
    name: 'Cable Bent Shrug',
    barWeight: 45,
    bodyparts: ['Traps'],
    barInKG: false,
  ),
  Exercise(
    name: 'Dumbbell Bent Shrug',
    barWeight: 45,
    bodyparts: ['Traps'],
    barInKG: false,
  ),
  //Triceps
  //Forearms
  //Calves
  //Front Delts
  //Glutes
  //Chest
  //Quads
  //Hamstrings
  //Side Delts
  //Rear Delts
];
