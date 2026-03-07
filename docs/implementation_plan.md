# Implementation Plan - Task Manager UI Upgrade

Upgrade the Task Manager application with a modern, premium design including dark theme, animations, and new visual features while maintaining existing functionality.

## Proposed Changes

### [Component] Core & Theme
#### [MODIFY] [main.dart](file:///Users/roshnirai/Desktop/to-do/lib/main.dart)
- Implement a modern dark theme (#0F172A background, #1E293B card).
- Configure Google Fonts (Poppins, Inter) as the default text style.
- Define custom color schemes and elevated button styles with gradients.

### [Component] UI Components
#### [MODIFY] [task_card.dart](file:///Users/roshnirai/Desktop/to-do/lib/widgets/task_card.dart)
- Redesign with 16px rounded corners and soft shadows.
- Add priority-based badge styling (Custom container/tag).
- Improve spacing and typography.

#### [NEW] [productivity_score.dart](file:///Users/roshnirai/Desktop/to-do/lib/widgets/productivity_score.dart)
- A new widget to calculate and display the daily productivity score using a circular progress indicator or styled card.

#### [NEW] [confetti_overlay.dart](file:///Users/roshnirai/Desktop/to-do/lib/widgets/confetti_overlay.dart)
- A wrapper/overlay to trigger confetti animations when a task is completed.

### [Component] Screens
#### [MODIFY] [home_screen.dart](file:///Users/roshnirai/Desktop/to-do/lib/screens/home_screen.dart)
- Add a gradient header with greeting and date.
- Integrate the Productivity Score section.
- Implement the modern rounded search bar.
- Add "Calendar View" navigation button.
- Integrate `flutter_staggered_animations` for list items.
- Implement a friendly empty state with an illustration/styled icon.

#### [NEW] [calendar_screen.dart](file:///Users/roshnirai/Desktop/to-do/lib/screens/calendar_screen.dart)
- Implement `table_calendar` to view tasks scheduled for specific days.
- Highlight dates with tasks and show details on tap.

#### [MODIFY] [add_task_screen.dart](file:///Users/roshnirai/Desktop/to-do/lib/screens/add_task_screen.dart)
- Redesign form fields with rounded borders and clean spacing.
- Style the priority dropdown and date picker.
- Use gradient styling for the save button.

#### [MODIFY] [edit_task_screen.dart](file:///Users/roshnirai/Desktop/to-do/lib/screens/edit_task_screen.dart)
- Apply the same redesign as `AddTaskScreen`.

### [Component] Animations
- Use `FadeInAnimation` from `flutter_staggered_animations` for the task list.
- Implement smooth transitions using the `animations` package (OpenContainer).

## Verification Plan

### Automated Tests
- Run `flutter analyze` to ensure no errors with new packages.
- Run `flutter test` to ensure existing widgets still build (after updates).

### Manual Verification
1. Verify the **Dark Theme** application across all screens.
2. Check **Google Fonts** rendering.
3. Test **Confetti Animation** when marking a task as "Done".
4. Navigate to **Calendar View** and verify task highlighting.
5. Verify **Productivity Score** updates correctly when tasks are toggled.
6. Test **Search and Filter** functionality in the new UI.
7. Ensure **Persistence** still works (tasks remain after restart).
