import 'package:desafio_listas/blocs/alllist_cubit.dart';
import 'package:desafio_listas/class_model_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyList extends StatelessWidget {
  const MyList({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllListCubit, List<Lista>>(
      builder: (context, state) {
        final cubit = context.read<AllListCubit>();
        return ListView.builder(
          itemCount: state.length,
          itemBuilder: (context, index) {
            final task = state[index];
            final wordRemoved = task.title;
            return Container(
                key: Key('Task $index'),
                margin: const EdgeInsets.all(15),
                color: theme.colorScheme.primaryContainer,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            task.title,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                              onPressed: () => showModalBottomSheet(
                                    context: context,
                                    builder: (context) => SizedBox(
                                      width: 428,
                                      height: 174,
                                      child: Padding(
                                        padding: const EdgeInsets.all(28),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Deseja remover $wordRemoved',
                                              style: const TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const Spacer(),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                MaterialButton(
                                                  onPressed: () {
                                                    cubit.removeTask(index);
                                                    Navigator.of(context).pop;
                                                  },
                                                  height: 80,
                                                  color: theme
                                                      .colorScheme.tertiary,
                                                  child: const Icon(
                                                    Icons.add_to_photos,
                                                    color: Colors.white,
                                                    size: 40,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                MaterialButton(
                                                  onPressed:
                                                      Navigator.of(context).pop,
                                                  height: 80,
                                                  color: Colors.redAccent,
                                                  child: const Icon(
                                                    Icons.cancel_presentation,
                                                    color: Colors.white,
                                                    size: 40,
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    isDismissible: false,
                                    barrierColor: Colors.black.withOpacity(0.7),
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(40),
                                      ),
                                    ),
                                  ),
                              icon: Icon(Icons.close,
                                  color: theme.colorScheme.onSecondary))
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        task.content,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Icon(Icons.access_time,
                              color: theme.colorScheme.onSecondary),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            task.date.toString(),
                            style: TextStyle(
                                fontSize: 16,
                                color: theme.colorScheme.onSecondary),
                          ),
                        ],
                      )
                    ],
                  ),
                ));
          },
        );
      },
    );
  }
}
