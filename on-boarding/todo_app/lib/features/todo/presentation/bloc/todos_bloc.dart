import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/features/todo/domain/entities/task_entity.dart';
import 'package:todo_app/features/todo/domain/usecases/add_task_usecase.dart';
import 'package:todo_app/features/todo/domain/usecases/get_task_usecase.dart';
import 'package:todo_app/features/todo/domain/usecases/update_completion.dart';

part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  TodosBloc() : super(TodosInitial()) {
    on<GetTasks>(_onGetTasks);
    on<AddTask>(_onAddTask);
    on<ChangeIsCompleted>(_onChangeIsCompleted);
  }
  final GetTaskUsecase getTask = GetTaskUsecase();
  final AddTaskUsecase addTask = AddTaskUsecase();
  final UpdateCompletion updateCompletion = UpdateCompletion();

  Future<void> _onGetTasks(GetTasks event, Emitter<TodosState> emit) async {
    emit(TodosLoading());
    final result = await getTask.call(null);
    result.fold(
      (failure) {
        emit(Error(error: failure.error));
      },
      (tasks) {
        emit(TodosLoaded(tasks: tasks));
      },
    );
  }

  Future<void> _onAddTask(AddTask event, Emitter<TodosState> emit) async {
    emit(TodosLoading());
    final result = await addTask.call(event.task);
    await result.fold(
      (failure) {
        emit(Error(error: failure.error));
      },
      (temp) async {
        await _onGetTasks(GetTasks(), emit);
      },
    );
  }

  Future<void> _onChangeIsCompleted(
      ChangeIsCompleted event, Emitter<TodosState> emit) async {
    emit(TodosLoading());

    final result = await updateCompletion.call(event.id,event.isComplted);
    await result.fold(
      (failure) {
        emit(Error(error: failure.error));
      },
      (temp) async {
        await _onGetTasks(GetTasks(), emit);
      },
    );
  }
}
