import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:koa_health/data/database.dart';
import 'package:koa_health/model/thought.dart';
import 'package:koa_health/model/user_preferences.dart';
import 'package:koa_health/resources/dimens.dart';
import 'package:koa_health/utils/locator.dart';
import 'package:koa_health/utils/navigation_manager.dart';
import 'package:koa_health/utils/thoughts_manager.dart';
import 'package:koa_health/utils/user_preferences_manager.dart';
import 'package:koa_health/views/buttons/infinite_button.dart';
import 'package:koa_health/views/buttons/thought_button.dart';
import 'package:koa_health/views/content_card.dart';
import 'package:koa_health/views/header.dart';
import 'package:koa_health/views/show_dialog.dart';
import 'package:koa_health/views/text.dart';
import 'package:koa_health/views/thought_items_form/thought_items_form.dart';

class ThoughtsScreen extends StatefulWidget {
  const ThoughtsScreen({Key? key}) : super(key: key);

  @override
  State<ThoughtsScreen> createState() => _ThoughtsScreenState();
}

class _ThoughtsScreenState extends State<ThoughtsScreen> {
  Database database = Database();
  ThoughtsManager thoughtsManager = locator<ThoughtsManager>();
  UserPreferences prefs = locator<UserPreferencesManager>().get();
  List<Thought> thoughts = [];
  @override
  void initState() {
    thoughts = thoughtsManager.getAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    thoughtsManager.getAll();
    return Scaffold(
      backgroundColor: Color(prefs.paletteColors.secondary),
      body: Column(
        children: [
          Header(title: translate('thoughts.title')),
          Expanded(
            child: ContentCard(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(Dimens.PADDING_LARGE),
                    child: thoughts.isEmpty
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppText(
                                translate('thoughts.empty_data_title'),
                                type: TextTypes.bigBold,
                                align: TextAlign.center,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: Dimens.PADDING_LARGE),
                                child: AppText(
                                  translate('thoughts.empty_data_body'),
                                  align: TextAlign.center,
                                ),
                              ),
                            ],
                          )
                        : ListView.builder(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            primary: false,
                            itemCount: thoughts.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                  padding: EdgeInsets.only(
                                      bottom: thoughts.last == thoughts[index] ? 0 : Dimens.PADDING_LARGE),
                                  child: ThoughtButton(thought: thoughts[index]));
                            }),
                  ),
                ),
                InfiniteButton(
                  text: translate('thoughts.add_title'),
                  onPress: () {
                    Thought thought = Thought(
                        feeling: database.feeling,
                        title: database.title,
                        items: database.defaultThoughtItems,
                        createDate: DateTime.now());
                    ShowDialog(
                        title: translate('thoughts.add_title'),
                        body: ThoughtItemsForm(
                          feeling: thought.feeling,
                          title: thought.title,
                          items: thought.items,
                        ),
                        action: ContentAction(
                            textAction: translate('common_texts.done'),
                            onPress: () async {
                              await thoughtsManager.add(thought);
                              NavigationManager(context).back();
                              setState(() {
                                thoughts = thoughtsManager.getAll();
                              });
                            })).show(context);
                  },
                ),
              ],
            )),
          ),
        ],
      ),
    );
  }
}
