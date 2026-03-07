# 📱 Task Manager Mobile Application

A modern **Flutter-based Task Manager application** designed to help users organize, track, and manage their daily tasks efficiently. The app provides a clean user interface, productivity tracking, task categorization, and a calendar-based task view to improve daily productivity.

---

# 🚀 Features

### ✅ Core Features

* Add Tasks
* Edit Tasks
* Delete Tasks
* Mark Tasks as Completed
* Search Tasks
* Sort Tasks by Priority or Due Date

### ⭐ Advanced Features

* Daily Productivity Score
* Confetti Animation on Task Completion
* Calendar Task View
* Task Categories
* Task Attachments
* Persistent Data Storage

---

# 🎯 Project Objective

The goal of this application is to provide users with a **simple yet powerful task management system** that improves productivity by allowing users to:

* Organize tasks efficiently
* Track progress through productivity scoring
* Categorize tasks
* Visualize schedules through a calendar interface
* Maintain task data even after restarting the application

---

# 🛠️ Tech Stack

### Frontend

* Flutter
* Dart

### Database / Storage

* MongoDB
* Local Storage (SharedPreferences)

### Tools

* MongoDB Compass
* Visual Studio Code / Android Studio
* Git & GitHub

---

# 📂 Project Structure

```
lib/
│
├── main.dart
│
├── models/
│   └── task.dart
│
├── services/
│   └── storage_service.dart
│
├── screens/
│   ├── home_screen.dart
│   ├── add_task_screen.dart
│   ├── edit_task_screen.dart
│   └── calendar_screen.dart
│
└── widgets/
    └── task_card.dart
```

### Folder Explanation

**models/**
Contains the data model used in the application.

**services/**
Handles data storage and business logic.

**screens/**
Contains the UI screens of the application.

**widgets/**
Reusable UI components.

---

# 📊 Key Features Explained

## 1️⃣ Task Categories

Tasks can be grouped into categories such as:

* Work
* Study
* Personal
* Health
* Other

This helps users organize tasks effectively.

---

## 2️⃣ Task Attachments

Users can attach files to tasks such as:

* Images
* Documents
* Notes

This allows storing additional information related to a task.

---

## 3️⃣ Daily Productivity Score

The application calculates a **productivity score** based on task completion.

Formula:

```
Productivity Score = 
(Completed Tasks / Total Tasks) × 100
```

This score helps users track their daily performance.

---

## 4️⃣ Confetti Animation

When a task is completed, a **confetti animation** appears on the screen to create a rewarding experience.

This improves motivation and user engagement.

---

## 5️⃣ Calendar Task View

Tasks can be viewed in a **calendar format**, allowing users to:

* See upcoming deadlines
* Plan tasks for specific days
* Organize schedules efficiently

---

# 💾 Data Storage

The application uses **MongoDB** for persistent data storage.

### Database

```
task_manager_db
```

### Collection

```
tasks
```

Example stored document:

```
{
"title": "Finish Flutter Project",
"description": "Complete final mobile app submission",
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
Converted to JSON
        ↓
Stored in MongoDB
        ↓
Retrieved when app loads
        ↓
Displayed in UI
```

---

# 🎨 UI/UX Design

The application uses a **modern and minimal design approach**.

UI highlights include:

* Gradient headers
* Task cards
* Google Fonts
* Smooth animations
* Dark theme support

The interface focuses on **simplicity and usability**.

---

# 🧠 Core Logic

### Productivity Calculation

```
productivityScore =
(completedTasks / totalTasks) * 100
```

### Task Filtering

Tasks are filtered using a search algorithm with **O(n)** time complexity.

### Task Sorting

Tasks are sorted using Dart’s built-in `.sort()` function.

---

# ⚙️ Installation

### 1️⃣ Clone the Repository

```
git clone https://github.com/yourusername/task-manager-app.git
```

### 2️⃣ Navigate to Project Folder

```
cd task-manager-app
```

### 3️⃣ Install Dependencies

```
flutter pub get
```

### 4️⃣ Run the Application

```
flutter run
```

---

# 📈 Future Improvements

Possible future enhancements include:

* Push notifications for deadlines
* Cloud synchronization
* AI-based task suggestions
* Voice task input
* Team collaboration features

---

# ⚠️ Limitations

* No cloud sync currently
* No real-time collaboration
* No notification reminders

---

# 👨‍💻 Author

Developed as a **Mobile Application Development Project** using Flutter.

---

# ⭐ Contributing

Contributions are welcome!
Feel free to fork this repository and submit pull requests.

---

# 📄 License

This project is for educational purposes.
