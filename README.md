# 📱 Task Manager Mobile Application

A modern **Flutter-based Task Manager application** designed to help users organize, manage, and track daily tasks efficiently.

The application provides a clean user interface with productivity tracking, task categorization, calendar-based planning, and persistent data storage to improve task management and user productivity.

---

# 🚀 Project Objective

The objective of this project is to build a productivity-focused mobile application that allows users to:

- Create and manage daily tasks
- Organize tasks using categories
- Track completion progress
- Monitor productivity levels
- Plan schedules using a calendar view
- Store task data persistently

---

# ✨ Features

## ✅ Core Features

- Add new tasks
- Edit existing tasks
- Delete tasks
- Mark tasks as completed
- Search tasks
- Sort tasks based on priority and due date

---

## ⭐ Advanced Features

- Daily productivity score
- Confetti animation on task completion
- Calendar-based task view
- Task categories
- Task attachments
- Persistent data storage
- Modern UI with animations

---

# 🛠️ Tech Stack

## Frontend

- Flutter
- Dart

## Database / Storage

- MongoDB
- SharedPreferences

## Tools Used

- Visual Studio Code
- Android Studio
- MongoDB Compass
- Git & GitHub

---

# 📂 Project Structure

```
lib/

├── main.dart

├── models/
│   └── task.dart

├── services/
│   └── storage_service.dart

├── screens/
│   ├── home_screen.dart
│   ├── add_task_screen.dart
│   ├── edit_task_screen.dart
│   └── calendar_screen.dart

└── widgets/
    └── task_card.dart
```

---

# 📁 Folder Description

## models/

Contains application data models.

Example:

- Task model
- Task attributes
- Data structure definition

---

## services/

Handles:

- Data storage
- Database operations
- Application logic

---

## screens/

Contains all major application screens:

- Home screen
- Add task screen
- Edit task screen
- Calendar screen

---

## widgets/

Contains reusable UI components.

Example:

- Task cards
- Custom UI elements

---

# 📊 Key Features Explained

## 🗂️ Task Categories

Tasks can be organized into categories:

- Work
- Study
- Personal
- Health
- Other

This helps users manage different types of activities efficiently.

---

## 📎 Task Attachments

Users can attach additional information related to tasks:

- Images
- Documents
- Notes

This improves task organization and accessibility.

---

## 📈 Daily Productivity Score

The application calculates productivity based on completed tasks.

Formula:

```
Productivity Score =
(Completed Tasks / Total Tasks) × 100
```

This helps users analyze their daily progress.

---

## 🎉 Task Completion Animation

A confetti animation is displayed when users complete tasks.

Purpose:

- Improves user engagement
- Creates a rewarding experience

---

## 📅 Calendar Task View

Users can view tasks through a calendar interface.

Benefits:

- Track upcoming deadlines
- Plan schedules
- Organize daily activities

---

# 💾 Data Storage

The application uses MongoDB for storing task information.

## Database

```
task_manager_db
```

## Collection

```
tasks
```

Example document:

```json
{
  "title": "Complete Flutter Project",
  "description": "Finish final project submission",
  "priority": "High",
  "category": "Study",
  "dueDate": "2026-03-10",
  "isCompleted": false
}
```

---

# 🔄 Application Data Flow

```
User creates task
        ↓
Task object created
        ↓
Converted into data format
        ↓
Stored in database
        ↓
Retrieved when application starts
        ↓
Displayed in Flutter UI
```

---

# 🎨 UI/UX Design

The application follows a modern and minimal design approach.

UI features:

- Gradient headers
- Task cards
- Google Fonts
- Smooth animations
- Dark theme support
- Clean navigation

The design focuses on simplicity, usability, and better user experience.

---

# 🧠 Core Logic

## Productivity Calculation

```
productivityScore =
(completedTasks / totalTasks) * 100
```

---

## Task Searching

Tasks are filtered using search functionality.

Complexity:

```
O(n)
```

---

## Task Sorting

Tasks are sorted using Dart's built-in:

```
.sort()
```

function.

---

# ⚙️ Installation & Setup

## 1. Clone Repository

```bash
git clone https://github.com/yourusername/task-manager-app.git
```

---

## 2. Navigate to Project Folder

```bash
cd task-manager-app
```

---

## 3. Install Dependencies

```bash
flutter pub get
```

---

## 4. Run Application

```bash
flutter run
```

---

# 📈 Future Enhancements

Possible improvements:

- Push notifications
- Cloud synchronization
- AI-based task suggestions
- Voice-based task creation
- Team collaboration features

---

# ⚠️ Current Limitations

- No cloud synchronization
- No real-time collaboration
- No deadline notification system

---

# 🎯 Learning Outcomes

Through this project, I practiced:

✅ Flutter application development  
✅ Dart programming  
✅ Mobile UI/UX design  
✅ Database integration  
✅ State management  
✅ CRUD operations  
✅ Building real-world mobile applications  

---

# 👩‍💻 Author

**Roshni Rai**  
B.Tech Computer Science Engineering  
ITM Skills University  

Mobile application development enthusiast exploring Flutter and building practical applications.

---

# ⭐ License

This project is developed for educational and learning purposes.
