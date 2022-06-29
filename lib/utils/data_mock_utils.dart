import 'dart:math';

import 'package:fitnest_x/data/model/activity_progress_data.dart';
import 'package:fitnest_x/data/model/meal/daily_nutrition_data.dart';
import 'package:fitnest_x/data/model/description_step.dart';
import 'package:fitnest_x/data/model/photo_comparison_data.dart';
import 'package:fitnest_x/data/model/stat_comparison_data.dart';
import 'package:fitnest_x/data/model/workout/exercise_data.dart';
import 'package:fitnest_x/data/model/meal/ingredient_data.dart';
import 'package:fitnest_x/data/model/latest_activity_content.dart';
import 'package:fitnest_x/data/model/workout/latest_workout_content.dart';
import 'package:fitnest_x/data/model/meal/meal_category_data.dart';
import 'package:fitnest_x/data/model/meal/meal_data.dart';
import 'package:fitnest_x/data/model/meal/meal_find_content.dart';
import 'package:fitnest_x/data/model/meal/meal_schedule_data.dart';
import 'package:fitnest_x/data/model/menu_item_data.dart';
import 'package:fitnest_x/data/model/notification_content.dart';
import 'package:fitnest_x/data/model/meal/nutrition_data.dart';
import 'package:fitnest_x/data/model/profile.dart';
import 'package:fitnest_x/data/model/schedule_item_content.dart';
import 'package:fitnest_x/data/model/sleep_schedule_item_content.dart';
import 'package:fitnest_x/data/model/meal/today_meal_content.dart';
import 'package:fitnest_x/data/model/today_target_item_content.dart';
import 'package:fitnest_x/data/model/workout/upcoming_workout_content.dart';
import 'package:fitnest_x/data/model/water_intake_update.dart';
import 'package:fitnest_x/data/model/workout/workout_item_info.dart';
import 'package:fitnest_x/data/model/workout/workout_type_content.dart';
import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/app_icons.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/utils/meal_time.dart';
import 'package:flutter/material.dart';

const _kMinWaterIntakePerUpdate = 10;
const _kMaxWaterIntakePerUpdate = 70;
const _kMockStartHour = 6;
const _kTargetCalories = 990;
const _kMinConsumedCalories = 30;
const _kMaxConsumedCalories = 80;
const _kMinActivityValue = 300;
const _kMaxActivityValue = 900;
const _kTargetActivityValue = 1000;
const _kMinLatestWorkoutProgress = 0.2;

class DataMockUtils {
  DataMockUtils._();

  static final Random _random = Random();

  static List<WaterIntakeUpdate> getMockIntakes(int length) {
    final now = DateTime.now();
    final result = <WaterIntakeUpdate>[];

    for (int i = 0; i < length; i++) {
      result.add(WaterIntakeUpdate(
          start:
              DateTime(now.year, now.month, now.day, _kMockStartHour + i * 2),
          end: i == length - 1
              ? null
              : DateTime(
                  now.year, now.month, now.day, _kMockStartHour + (i + 1) * 2),
          intakeInMl: _getRandomIntake()));
    }
    return result;
  }

  static int _getRandomIntake() =>
      10 *
      (_random.nextInt(_kMaxWaterIntakePerUpdate - _kMinWaterIntakePerUpdate) +
          _kMinWaterIntakePerUpdate);

  static int getMockConsumedCalories() =>
      10 *
      (_random.nextInt(_kMaxConsumedCalories - _kMinConsumedCalories) +
          _kMinConsumedCalories);

  static int getMockTotalCalories() => _kTargetCalories;

  static List<NotificationContent> getMockNotifications() {
    return const [
      NotificationContent(
          message: 'Hey, it\'s time for lunch',
          date: 'About 1 minute ago',
          assetPath: 'assets/images/notification_4.png',
          color: AppColors.blue2),
      NotificationContent(
          message: 'Don\'t miss your Lowerbody Workout',
          date: 'About 3 hours ago',
          assetPath: 'assets/images/notification_1.png',
          color: AppColors.purple2),
      NotificationContent(
          message: 'Hey, let\'s add some meals for your breakfast',
          date: 'About 3 hours ago',
          assetPath: 'assets/images/notification_3.png',
          color: AppColors.blue2),
      NotificationContent(
          message: 'Congratulations, You have finished AB Workout',
          date: '29 May',
          assetPath: 'assets/images/notification_2.png',
          color: AppColors.blue2),
      NotificationContent(
          message: 'Hey, it\'s time for lunch',
          date: '8 April',
          assetPath: 'assets/images/notification_4.png',
          color: AppColors.blue2),
      NotificationContent(
          message: 'Oops, You have missed your Lowerbody Workout',
          date: '3 April',
          assetPath: 'assets/images/notification_1.png',
          color: AppColors.purple2),
    ];
  }

  static List<UpcomingWorkoutContent> getMockUpcomingWorkouts() {
    final now = DateTime.now();

    return [
      UpcomingWorkoutContent(
          id: 1,
          title: 'Fullbody Workout',
          date: DateTime(now.year, now.month, now.day, 15),
          assetPath: 'assets/images/notification_6.png',
          sendNotification: true,
          color: AppColors.blue2),
      UpcomingWorkoutContent(
          id: 2,
          title: 'Upperbody Workout',
          date: now.subtract(const Duration(days: 3)),
          assetPath: 'assets/images/notification_5.png',
          sendNotification: false,
          color: AppColors.purple2),
    ];
  }

  static List<WorkoutTypeContent> getMockWorkoutTypes() {
    return const [
      WorkoutTypeContent(
        title: 'Fullbody Workout',
        exercises: 11,
        caloriesBurn: 320,
        duration: Duration(minutes: 32),
        imagePath: 'assets/images/fullbody_workout_type.png',
        backgroundImageData: WorkoutTypeBgImageData(
            path: 'assets/images/fullbody_workout.png', offset: Offset(0, 0.2)),
      ),
      WorkoutTypeContent(
        title: 'Lowerbody Workout',
        exercises: 12,
        caloriesBurn: 400,
        duration: Duration(minutes: 40),
        imagePath: 'assets/images/lowerbody_workout_type.png',
        backgroundImageData: WorkoutTypeBgImageData(
            path: 'assets/images/lowerbody_workout.png',
            margin: kHorizontalPadding20,
            offset: Offset(0, 0.2)),
      ),
      WorkoutTypeContent(
        title: 'AB Workout',
        exercises: 14,
        caloriesBurn: 300,
        duration: Duration(minutes: 20),
        imagePath: 'assets/images/ab_workout_type.png',
        backgroundImageData: WorkoutTypeBgImageData(
            path: 'assets/images/ab_workout.png',
            offset: Offset(0, 0.05),
            margin: EdgeInsets.symmetric(horizontal: 30)),
      ),
    ];
  }

  static Profile getMockUserProfile() => const Profile(
      id: 1,
      firstName: 'Stefani',
      lastName: 'Wong',
      imagePath: 'assets/images/user.png',
      program: 'Lose a Fat',
      height: 180,
      weight: 65,
      age: 22);

  static List<MenuItemData> getMockAccountMenuItems() {
    return const [
      MenuItemData.simple(
          title: 'Personal Data', iconData: AppIcons.profile_outlined),
      MenuItemData.simple(
          title: 'Achievement', iconData: AppIcons.document_outlined),
      MenuItemData.simple(
          title: 'Activity History', iconData: AppIcons.graph_outlined),
      MenuItemData.simple(
          title: 'Workout Progress', iconData: AppIcons.chart_outlined),
    ];
  }

  static List<MenuItemData> getMockOtherMenuItems() {
    return const [
      MenuItemData.simple(
          title: 'Contact Us', iconData: AppIcons.message_outlined),
      MenuItemData.simple(
          title: 'Privacy Policy', iconData: AppIcons.shield_done_outlined),
      MenuItemData.simple(
          title: 'Settings', iconData: AppIcons.settings_outlined),
    ];
  }

  static List<MenuItemData> getMockNotificationMenuItems() {
    return const [
      MenuItemData.toggle(
          title: 'Pop-up Notifications',
          iconData: AppIcons.notification_outlined),
    ];
  }

  static List<TodayTargetItemContent> getMockTodayTargetItems() {
    return const [
      TodayTargetItemContent(
          name: 'Water Intake',
          value: 3,
          unit: 'L',
          imagePath: 'assets/images/today_target_1.png'),
      TodayTargetItemContent(
          name: 'Foot Steps',
          value: 2400,
          imagePath: 'assets/images/today_target_2.png'),
    ];
  }

  static List<ActivityProgressData> getMockActivityProgressData() {
    final labels = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

    return labels
        .map((day) => ActivityProgressData(
            label: day,
            targetValue: _kTargetActivityValue,
            currentValue:
                _random.nextInt(_kMaxActivityValue - _kMinActivityValue) +
                    _kMinActivityValue))
        .toList();
  }

  static List<LatestActivityContent> getMockLatestActivityContent() {
    return const [
      LatestActivityContent(
          title: 'Drinking 300ml Water',
          subtitle: 'About 3 minutes ago',
          assetPath: 'assets/images/user.png',
          color: AppColors.blue2),
      LatestActivityContent(
          title: 'Eat Snack (Fitbar)',
          subtitle: 'About 10 minutes ago',
          assetPath: 'assets/images/snack.png',
          color: AppColors.purple2),
    ];
  }

  static List<WorkoutItemInfo> getMockWorkoutItemInfo() {
    return const [
      WorkoutItemInfo(
        name: 'Barbell',
        assetPath: 'assets/images/item_barbel.png',
      ),
      WorkoutItemInfo(
        name: 'Skipping Rope',
        assetPath: 'assets/images/item_skipping_rope.png',
      ),
      WorkoutItemInfo(
        name: 'Bottle 1 Liter',
        assetPath: 'assets/images/item_water_bottle.png',
      ),
      WorkoutItemInfo(
        name: 'Yoga Mat',
        assetPath: 'assets/images/item_mat.png',
      ),
    ];
  }

  static List<List<ExerciseData>> getMockExerciseData() {
    return const [
      [
        ExerciseData(
            id: 1,
            caloriesBurn: 200,
            difficulty: ExerciseDifficulty.easy,
            title: 'Warm Up',
            subtitle: '05:00',
            assetPath: 'assets/images/exercise_warm_up.png'),
        ExerciseData(
            id: 2,
            caloriesBurn: 390,
            difficulty: ExerciseDifficulty.easy,
            title: 'Jumping Jack',
            subtitle: '12x',
            assetPath: 'assets/images/exercise_jumping_jack.png'),
        ExerciseData(
            id: 3,
            caloriesBurn: 300,
            difficulty: ExerciseDifficulty.medium,
            title: 'Skipping',
            subtitle: '15x',
            assetPath: 'assets/images/exercise_skipping.png'),
        ExerciseData(
            id: 4,
            caloriesBurn: 400,
            difficulty: ExerciseDifficulty.medium,
            title: 'Squats',
            subtitle: '20x',
            assetPath: 'assets/images/exercise_squats.png'),
        ExerciseData(
            id: 5,
            caloriesBurn: 300,
            difficulty: ExerciseDifficulty.easy,
            title: 'Arm Raises',
            subtitle: '00:53',
            assetPath: 'assets/images/exercise_arm_raises.png'),
        ExerciseData(
            id: 6,
            caloriesBurn: 0,
            difficulty: ExerciseDifficulty.easy,
            title: 'Rest and Drink',
            subtitle: '02:00',
            assetPath: 'assets/images/exercise_rest.png'),
      ],
      [
        ExerciseData(
            id: 7,
            caloriesBurn: 300,
            difficulty: ExerciseDifficulty.medium,
            title: 'Incline Push-Ups',
            subtitle: '12x',
            assetPath: 'assets/images/exercise_incline.png'),
        ExerciseData(
            id: 8,
            caloriesBurn: 420,
            difficulty: ExerciseDifficulty.hard,
            title: 'Push-Ups',
            subtitle: '15x',
            assetPath: 'assets/images/exercise_push_up.png'),
        ExerciseData(
            id: 3,
            caloriesBurn: 300,
            difficulty: ExerciseDifficulty.medium,
            title: 'Skipping',
            subtitle: '15x',
            assetPath: 'assets/images/exercise_skipping.png'),
        ExerciseData(
            id: 9,
            caloriesBurn: 100,
            difficulty: ExerciseDifficulty.easy,
            title: 'Cobra Stretch',
            subtitle: '01:00',
            assetPath: 'assets/images/exercise_cobra_stretch.png'),
      ]
    ];
  }

  static List<DescriptionStep> getMockExerciseSteps() {
    return const [
      DescriptionStep(
          title: 'Spread Your Arms',
          description:
              'To make the gestures feel more relaxed, stretch your arms as you start this movement. No bending of hands.'),
      DescriptionStep(
          title: 'Rest at The Toe',
          description:
              'The basis of this movement is jumping. Now, what needs to be considered is that you have to use the tips of your feet'),
      DescriptionStep(
          title: 'Adjust Foot Movement',
          description:
              'Jumping Jack is not just an ordinary jump. But, you also have to pay close attention to leg movements.'),
      DescriptionStep(
          title: 'Clapping Both Hands',
          description:
              'This cannot be taken lightly. You see, without realizing it, the clapping of your hands helps you to keep your rhythm while doing the Jumping Jack'),
    ];
  }

  static List<LatestWorkoutContent> getMockLatestWorkoutContent() {
    return [
      LatestWorkoutContent(
          title: 'Fullbody Workout',
          caloriesBurn: 180,
          duration: const Duration(minutes: 20),
          assetPath: 'assets/images/fullbody_workout_type.png',
          color: AppColors.blue2,
          completed: max(_random.nextDouble(), _kMinLatestWorkoutProgress)),
      LatestWorkoutContent(
          title: 'Lowerbody Workout',
          caloriesBurn: 200,
          duration: const Duration(minutes: 30),
          assetPath: 'assets/images/lowerbody_workout_type.png',
          color: AppColors.purple2,
          completed: max(_random.nextDouble(), _kMinLatestWorkoutProgress)),
      LatestWorkoutContent(
          title: 'AB Workout',
          caloriesBurn: 220,
          duration: const Duration(minutes: 25),
          assetPath: 'assets/images/ab_workout_type.png',
          color: AppColors.blue2,
          completed: max(_random.nextDouble(), _kMinLatestWorkoutProgress))
    ];
  }

  static List<ScheduleItemContent> getMockScheduleItems() {
    final now = DateTime.now();
    return [
      ScheduleItemContent(
          title: 'Ab Workout',
          date: DateTime(now.year, now.month, now.day, 7, 30)),
      ScheduleItemContent(
          title: 'Upperbody Workout',
          date: DateTime(now.year, now.month, now.day, 9)),
      ScheduleItemContent(
          title: 'Lowerbody Workout',
          date: DateTime(now.year, now.month, now.day, 15)),
    ];
  }

  static List<TodayMealContent> getMockTodayMeals() {
    final now = DateTime.now();
    return [
      TodayMealContent(
          meal: const MealData(
              id: 6,
              name: 'Salmon Nigiri',
              assetPath: 'assets/images/food_nigiri.png',
              difficulty: 'Medium',
              calories: 120,
              cookDuration: Duration(minutes: 20)),
          showNotification: true,
          date: DateTime(now.year, now.month, now.day, 7)),
      TodayMealContent(
          meal: const MealData(
              id: 8,
              name: 'Lowfat Milk',
              assetPath: 'assets/images/food_milk.png',
              difficulty: 'Easy',
              calories: 80,
              cookDuration: Duration(minutes: 1)),
          showNotification: false,
          date: DateTime(now.year, now.month, now.day, 8))
    ];
  }

  static List<MealFindContent> getMockMealFindContent() {
    return const [
      MealFindContent(
          mealTime: MealTime.breakfast,
          amount: 120,
          assetPath: 'assets/images/food_pie.png'),
      MealFindContent(
          mealTime: MealTime.lunch,
          amount: 130,
          assetPath: 'assets/images/food_bread.png'),
      MealFindContent(
          mealTime: MealTime.dinner,
          amount: 150,
          assetPath: 'assets/images/food_salad.png'),
      MealFindContent(
          mealTime: MealTime.supper,
          amount: 90,
          assetPath: 'assets/images/food_oatmeal.png')
    ];
  }

  static List<MealCategoryData> getMockMealCategories() {
    return const [
      MealCategoryData(
          title: 'Salad', assetPath: 'assets/images/category_salad.png'),
      MealCategoryData(
          title: 'Cake', assetPath: 'assets/images/category_cake.png'),
      MealCategoryData(
          title: 'Pie', assetPath: 'assets/images/category_pie.png'),
      MealCategoryData(
          title: 'Smoothie', assetPath: 'assets/images/category_smoothie.png'),
      MealCategoryData(
          title: 'Porridge', assetPath: 'assets/images/category_porridge.png'),
    ];
  }

  static List<MealData> getMockDietRecommendations() {
    return const [
      MealData(
          id: 1,
          name: 'Honey Pancake',
          assetPath: 'assets/images/food_honey_pancake.png',
          difficulty: 'Easy',
          calories: 180,
          cookDuration: Duration(minutes: 30)),
      MealData(
          id: 2,
          name: 'Canai Bread',
          assetPath: 'assets/images/food_bread.png',
          difficulty: 'Easy',
          calories: 230,
          cookDuration: Duration(minutes: 20)),
      MealData(
          id: 3,
          name: 'Fruit Salad',
          assetPath: 'assets/images/food_salad.png',
          difficulty: 'Easy',
          calories: 120,
          cookDuration: Duration(minutes: 15)),
      MealData(
          id: 4,
          name: 'Chicken Steak',
          assetPath: 'assets/images/food_steak.png',
          difficulty: 'Medium',
          calories: 250,
          cookDuration: Duration(minutes: 45))
    ];
  }

  static List<MealData> getMockPopularMeals() {
    return const [
      MealData(
          id: 5,
          name: 'Blueberry Pancake',
          assetPath: 'assets/images/food_blueberry_pancake.png',
          difficulty: 'Medium',
          calories: 230,
          cookDuration: Duration(minutes: 30)),
      MealData(
          id: 6,
          name: 'Salmon Nigiri',
          assetPath: 'assets/images/food_nigiri.png',
          difficulty: 'Medium',
          calories: 120,
          cookDuration: Duration(minutes: 20)),
      MealData(
          id: 7,
          name: 'Oatmeal',
          assetPath: 'assets/images/food_oatmeal.png',
          difficulty: 'Easy',
          calories: 100,
          cookDuration: Duration(minutes: 15)),
    ];
  }

  static List<NutritionData> getMockNutritionData() {
    return const [
      NutritionData(type: NutritionType.calories, value: 180),
      NutritionData(type: NutritionType.fats, value: 30),
      NutritionData(type: NutritionType.proteins, value: 20),
      NutritionData(type: NutritionType.carbs, value: 50),
    ];
  }

  static List<IngredientData> getMockIngredients() {
    return const [
      IngredientData(
          name: 'Wheat Flour',
          assetPath: 'assets/images/ingredients_flour.png',
          amount: 100,
          units: 'gr'),
      IngredientData(
          name: 'Sugar',
          assetPath: 'assets/images/ingredients_sugar.png',
          amount: 3,
          units: 'tbsp'),
      IngredientData(
          name: 'Baking Soda',
          assetPath: 'assets/images/ingredients_soda.png',
          amount: 2,
          units: 'tsp'),
      IngredientData(
          name: 'Eggs',
          assetPath: 'assets/images/ingredients_eggs.png',
          amount: 2,
          units: 'items'),
      IngredientData(
          name: 'Oil',
          assetPath: 'assets/images/ingredients_cooking_oil.png',
          amount: 50,
          units: 'ml'),
      IngredientData(
          name: 'Blueberry',
          assetPath: 'assets/images/ingredients_blueberry.png',
          amount: 300,
          units: 'gr'),
    ];
  }

  static List<DescriptionStep> getMockRecipeSteps() {
    return const [
      DescriptionStep(
          title: 'Step 1',
          description: 'Prepare all of the ingredients that needed'),
      DescriptionStep(
          title: 'Step 2',
          description: 'Mix flour, sugar, salt, and baking powder',
          isActive: false),
      DescriptionStep(
          title: 'Step 3',
          description:
              'In a seperate place, mix the eggs and liquid milk until blended',
          isActive: false),
      DescriptionStep(
          title: 'Step 4',
          description:
              'Put the egg and milk mixture into the dry ingredients, stir until smooth',
          isActive: false),
      DescriptionStep(
          title: 'Step 5',
          description:
              'Pellentesque convallis, elit non bibendum faucibus, odio magna scelerisque',
          isActive: false),
      DescriptionStep(
          title: 'Step 6',
          description:
              'In hac habitasse platea dictumst. Aliquam erat volutpat. Nam in elementum',
          isActive: false),
      DescriptionStep(
          title: 'Step 7',
          description: 'Sed scelerisque orci dolor, et facilisis velit cursus',
          isActive: false),
      DescriptionStep(
          title: 'Step 8',
          description:
              'Nunc sit amet efficitur tortor. Morbi condimentum ut nulla vitae pulvinar. Curabitur ac iaculis',
          isActive: false)
    ];
  }

  static Map<MealTime, List<MealScheduleData>> getMockMealSchedule() {
    final now = DateTime.now();
    final result = <MealTime, List<MealScheduleData>>{
      MealTime.breakfast: [
        MealScheduleData(
            meal: const MealData(
                id: 1,
                name: 'Honey Pancake',
                assetPath: 'assets/images/food_honey_pancake.png',
                difficulty: 'Easy',
                calories: 180,
                cookDuration: Duration(minutes: 30)),
            dateTime: DateTime(now.year, now.month, now.day, 7)),
        MealScheduleData(
            meal: const MealData(
                id: 9,
                name: 'Coffee',
                assetPath: 'assets/images/food_coffee.png',
                difficulty: 'Easy',
                calories: 40,
                cookDuration: Duration(minutes: 5)),
            dateTime: DateTime(now.year, now.month, now.day, 7, 30))
      ],
      MealTime.lunch: [
        MealScheduleData(
            meal: const MealData(
                id: 4,
                name: 'Chicken Steak',
                assetPath: 'assets/images/food_steak.png',
                difficulty: 'Medium',
                calories: 250,
                cookDuration: Duration(minutes: 45)),
            dateTime: DateTime(now.year, now.month, now.day, 13)),
        MealScheduleData(
            meal: const MealData(
                id: 10,
                name: 'Milk',
                assetPath: 'assets/images/food_milk.png',
                difficulty: 'Easy',
                calories: 90,
                cookDuration: Duration(minutes: 1)),
            dateTime: DateTime(now.year, now.month, now.day, 13, 20))
      ],
      MealTime.snacks: [
        MealScheduleData(
            meal: const MealData(
                id: 11,
                name: 'Orange',
                assetPath: 'assets/images/food_orange.png',
                difficulty: 'Easy',
                calories: 30,
                cookDuration: Duration(minutes: 1)),
            dateTime: DateTime(now.year, now.month, now.day, 16, 30)),
        MealScheduleData(
            meal: const MealData(
                id: 11,
                name: 'Apple Pie',
                assetPath: 'assets/images/food_apple_pie.png',
                difficulty: 'Medium',
                calories: 110,
                cookDuration: Duration(minutes: 35)),
            dateTime: DateTime(now.year, now.month, now.day, 16, 40))
      ],
      MealTime.dinner: [
        MealScheduleData(
            meal: const MealData(
                id: 3,
                name: 'Fruit Salad',
                assetPath: 'assets/images/food_salad.png',
                difficulty: 'Easy',
                calories: 120,
                cookDuration: Duration(minutes: 15)),
            dateTime: DateTime(now.year, now.month, now.day, 19, 10)),
        MealScheduleData(
            meal: const MealData(
                id: 7,
                name: 'Oatmeal',
                assetPath: 'assets/images/food_oatmeal.png',
                difficulty: 'Easy',
                calories: 100,
                cookDuration: Duration(minutes: 15)),
            dateTime: DateTime(now.year, now.month, now.day, 20, 10))
      ]
    };

    return result;
  }

  static List<DailyNutritionData> getMockDailyNutrition() {
    return const [
      DailyNutritionData(
          data: NutritionData(type: NutritionType.calories, value: 900),
          total: 1800),
      DailyNutritionData(
          data: NutritionData(type: NutritionType.proteins, value: 200),
          total: 300),
      DailyNutritionData(
          data: NutritionData(type: NutritionType.fats, value: 120),
          total: 140),
      DailyNutritionData(
          data: NutritionData(type: NutritionType.carbs, value: 50), total: 140)
    ];
  }

  static List<SleepScheduleItemContent> getMockSleepSchedule() {
    final now = DateTime.now();
    return [
      SleepScheduleItemContent(
          title: 'Bedtime',
          assetPath: 'assets/images/sleep_bed.png',
          dateTime: DateTime(now.year, now.month, now.day, 22),
          showNotification: true),
      SleepScheduleItemContent(
          title: 'Alarm',
          assetPath: 'assets/images/sleep_alarm.png',
          dateTime: DateTime(now.year, now.month, now.day + 1, 6, 10),
          showNotification: true)
    ];
  }

  static Map<DateTime, List<String>> getMockGalleryContent() {
    final now = DateTime.now();

    return <DateTime, List<String>>{
      DateTime(now.year, now.month - 1, now.day): [
        'assets/images/gallery_01.png',
        'assets/images/gallery_03.png',
        'assets/images/gallery_02.png',
        'assets/images/gallery_08.png',
        'assets/images/gallery_04.png',
      ],
      DateTime(now.year, now.month - 2, now.day - 2): [
        'assets/images/gallery_04.png',
        'assets/images/gallery_06.png',
        'assets/images/gallery_05.png',
        'assets/images/gallery_01.png',
        'assets/images/gallery_02.png',
      ],
    };
  }

  static List<PhotoComparisonData> getMockPhotoComparisonData() {
    return const [
      PhotoComparisonData(
          title: 'Front Facing',
          firstImagePath: 'assets/images/gallery_01.png',
          secondImagePath: 'assets/images/gallery_04.png'),
      PhotoComparisonData(
          title: 'Back Facing',
          firstImagePath: 'assets/images/gallery_07.png',
          secondImagePath: 'assets/images/gallery_02.png'),
      PhotoComparisonData(
          title: 'Left Facing',
          firstImagePath: 'assets/images/gallery_03.png',
          secondImagePath: 'assets/images/gallery_05.png'),
      PhotoComparisonData(
          title: 'Right Facing',
          firstImagePath: 'assets/images/gallery_06.png',
          secondImagePath: 'assets/images/gallery_08.png'),
    ];
  }

  static List<StatComparisonData> getMockStatComparisonData() {
    return const [
      StatComparisonData(title: 'Lose Weight', value: 0.33),
      StatComparisonData(title: 'Height Increase', value: 0.88),
      StatComparisonData(title: 'Muscle Mass Increase', value: 0.57),
      StatComparisonData(title: 'Abs', value: 0.89),
    ];
  }
}
