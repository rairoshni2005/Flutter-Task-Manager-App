import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';
import '../models/task.dart';
import '../services/storage_service.dart';
import '../widgets/task_card.dart';
import '../widgets/productivity_score.dart';
import '../widgets/confetti_overlay.dart';
import 'add_task_screen.dart';
import 'edit_task_screen.dart';
import 'calendar_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final StorageService _storageService = StorageService();
  late ConfettiController _confettiController;
  List<Task> _allTasks = [];
  List<Task> _filteredTasks = [];
  String _searchQuery = '';
  bool _sortByPriority = true;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(duration: const Duration(seconds: 2));
    _loadTasks();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  Future<void> _loadTasks() async {
    final tasks = await _storageService.getTasks();
    setState(() {
      _allTasks = tasks;
      _applyFilters();
    });
  }

  void _applyFilters() {
    List<Task> filtered = _allTasks.where((task) {
      final titleMatch = task.title.toLowerCase().contains(_searchQuery.toLowerCase());
      final descMatch = task.description.toLowerCase().contains(_searchQuery.toLowerCase());
      return titleMatch || descMatch;
    }).toList();

    if (_sortByPriority) {
      filtered.sort((a, b) => b.priority.index.compareTo(a.priority.index));
    } else {
      filtered.sort((a, b) => a.dueDate.compareTo(b.dueDate));
    }

    setState(() {
      _filteredTasks = filtered;
    });
  }

  void _toggleTask(Task task) async {
    final updatedState = !task.isCompleted;
    final updatedTask = task.copyWith(isCompleted: updatedState);
    await _storageService.updateTask(updatedTask);
    
    if (updatedState) {
      _confettiController.play();
    }
    
    _loadTasks();
  }

  void _deleteTask(String id) async {
    await _storageService.deleteTask(id);
    _loadTasks();
  }

  @override
  Widget build(BuildContext context) {
    return ConfettiOverlay(
      controller: _confettiController,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF0F172A), Color(0xFF1E293B)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            bottom: false,
            child: Column(
              children: [
                _buildHeader(),
                _buildSearchBar(),
                Expanded(
                  child: _filteredTasks.isEmpty ? _buildEmptyState() : _buildTaskList(),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: _buildFAB(),
      ),
    );
  }

  Widget _buildHeader() {
    final completedCount = _allTasks.where((t) => t.isCompleted).length;
    final totalCount = _allTasks.length;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello 👋',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white.withValues(alpha: 0.6),
                    ),
                  ),
                  const Text(
                    "Let's be productive today",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CalendarScreen()),
                  );
                },
                icon: const Icon(Icons.calendar_month, color: Colors.white, size: 28),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            DateFormat('EEEE, MMM dd').format(DateTime.now()),
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withValues(alpha: 0.5),
            ),
          ),
          const SizedBox(height: 20),
          ProductivityScore(completedTasks: completedCount, totalTasks: totalCount),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: TextField(
                onChanged: (val) {
                  _searchQuery = val;
                  _applyFilters();
                },
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Search tasks...',
                  hintStyle: TextStyle(color: Colors.white.withValues(alpha: 0.4)),
                  prefixIcon: const Icon(Icons.search, color: Color(0xFF6C63FF)),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(15),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF1E293B),
              borderRadius: BorderRadius.circular(16),
            ),
            child: PopupMenuButton<bool>(
              icon: const Icon(Icons.tune, color: Colors.white),
              onSelected: (val) {
                setState(() => _sortByPriority = val);
                _applyFilters();
              },
              itemBuilder: (context) => [
                const PopupMenuItem(value: true, child: Text('Sort by Priority')),
                const PopupMenuItem(value: false, child: Text('Sort by Due Date')),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskList() {
    return AnimationLimiter(
      child: ListView.builder(
        itemCount: _filteredTasks.length,
        padding: const EdgeInsets.only(bottom: 100),
        itemBuilder: (context, index) {
          final task = _filteredTasks[index];
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 375),
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: TaskCard(
                  task: task,
                  onToggle: (val) => _toggleTask(task),
                  onEdit: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditTaskScreen(task: task)),
                    );
                    if (result == true) _loadTasks();
                  },
                  onDelete: () => _deleteTask(task.id),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFAB() {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF6C63FF), Color(0xFF8B5CF6)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6C63FF).withValues(alpha: 0.4),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: FloatingActionButton.extended(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddTaskScreen()),
          );
          if (result == true) _loadTasks();
        },
        label: const Text('Add Task', style: TextStyle(fontWeight: FontWeight.bold)),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.transparent,
        elevation: 0,
        highlightElevation: 0,
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.assignment_rounded, size: 100, color: Colors.white.withValues(alpha: 0.1)),
          const SizedBox(height: 16),
          Text(
            _searchQuery.isEmpty ? 'No tasks yet!' : 'No results found',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(
            _searchQuery.isEmpty ? 'Tap "Add Task" to start your day' : 'Try searching for something else',
            style: TextStyle(color: Colors.white.withValues(alpha: 0.5)),
          ),
        ],
      ),
    );
  }
}
