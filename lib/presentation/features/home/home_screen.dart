import 'package:flop/domain/entity/article.dart';
import 'package:flutter/material.dart';
import 'package:flop/presentation/extensions/extensions.dart';
import 'package:flop/presentation/widgets/widgets.dart';
import 'package:flop/presentation/features/home/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//создание виджета главного экрана
class HomeScreen extends StatefulWidget {
  const HomeScreen({ super.key });

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

//состояние для главного виджета
class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Загружаем данные, только если еще не загружены
    final homeBloc = context.read<HomeBloc>();
    if (homeBloc.state is HomeInitial) {
      homeBloc.add(const HomeLoad());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Home',
          ),
            // Кнопка перезапуска
            actions: [
              IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                final homeBloc = context.read<HomeBloc>();
                homeBloc.emit(HomeInitial()); // Сбрасываем состояние блока в HomeInitial
                homeBloc.add(const HomeLoad()); // Загружаем данные заново
               },
            ),
          ],
        ),
        body: BlocBuilder<HomeBloc, HomeState> (
          builder: (context, state) { // Получаем текущее состояние блока
            if(state is HomeLoadInProgress) {
              return const Center(child: CircularProgressIndicator());
            }
            if(state is HomeLoadSuccess) {
              List<Article> articles = state.articles; // список статей
              return SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Header',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    20.ph,
                    ListView.separated(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: articles.length,
                      itemBuilder: (context, index) {
                        return ArticleCard(
                          title: articles[index].title,
                          desc: articles[index].description,
                          imageUrl: articles[index].imageUrl,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return 20.ph;
                      },
                    ),
                  ],
                ),
              );
            }
            if (state is HomeLoadFailure) { // Проверяем, произошла ли ошибка при загрузке

            }
            return const SizedBox();
          },
        )
      ),
    );
  }
}