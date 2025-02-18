import 'package:asalema_widgets/models/user_model.dart';
import 'package:asalema_widgets/themeData/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:asalema_widgets/asalema_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

PublicationUserModel currentUser = PublicationUserModel(
  id: const Uuid().v4(),
  avatar:
      'https://www.artmajeur.com/medias/hd/m/o/monika-cherkaoui/artwork/12638387_xxx-2019-08-12-seagull-screaming.jpg',
  firstname: 'Dannie',
  lastname: 'Lop',
  username: '@dannielop01',
  verified: false,
);

void main() async {
  setLocaleMessages('fr', FrShortMessagesKosmos());
  await ScreenUtil.ensureScreenSize();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Asalema Widgets Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Asalema Widgets Example'),
    );
  }
}

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  late PublicationUserModel user1;
  late PublicationUserModel user2;
  late PublicationModel textPublicationModel;
  late PublicationModel imagePublicationModel;
  late PublicationModel videoPublicationModel;
  late List<PublicationModel> listPublicationModel;

  late List<CommentPublicationModel> listCommentPublicationModel;

  late TextEditingController bottombarController;

  @override
  void initState() {
    bottombarController = TextEditingController();

    user1 = PublicationUserModel(
      id: const Uuid().v4(),
      avatar: 'https://upload.wikimedia.org/wikipedia/commons/9/9a/Gull_portrait_ca_usa.jpg',
      firstname: 'Lise',
      lastname: 'Clark',
      username: '@lise.clark71',
      verified: true,
    );

    user2 = PublicationUserModel(
      id: const Uuid().v4(),
      avatar: 'https://mvistatic.com/photosmvi/2021/05/31/P26658416D4103215G.jpg',
      firstname: 'Alice',
      lastname: 'Youp',
      username: '@youp521',
      verified: true,
    );

    String firstPubId = const Uuid().v4();

    textPublicationModel = PublicationModel(
      sharedBy: user1.id,
      id: firstPubId,
      usermodel: currentUser,
      date: DateTime.now(),
      comment: "Qu'est ce qu'il fait bon vivre à Nice, c'est incroyable à cette période.",
      responses: 5,
      likes: 57,
      type: 'text',
      me: true,
    );

    String secondPubId = const Uuid().v4();
    imagePublicationModel = PublicationModel(
      sharedBy: null,
      color: Colors.black.value,
      image:
          'https://images.unsplash.com/photo-1517999144091-3d9dca6d1e43?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjEzNzYzNn0?utm_source=dictionnaire&utm_medium=referral',
      id: secondPubId,
      usermodel: user2,
      date: DateTime.now(),
      comment:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed volutpat nisi non velit blandit facilisis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur congue lobortis odio at scelerisque. Nullam et risus enim. Proin quis neque nibh. Sed iaculis urna velit, id malesuada orci imperdiet sit amet. Donec aliquam nisi sed dolor congue, eu pellentesque libero lacinia.",
      responses: 2,
      likes: 120,
      type: 'image',
      me: false,
    );

    String thirdPubId = const Uuid().v4();
    videoPublicationModel = PublicationModel(
      sharedBy: null,
      color: Colors.pinkAccent.value,
      video: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      image:
          'https://images.unsplash.com/photo-1559251606-c623743a6d76?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fHBpbmt8ZW58MHx8MHx8&w=1000&q=80',
      id: thirdPubId,
      usermodel: user1,
      date: DateTime.now(),
      comment:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed volutpat nisi non velit blandit facilisis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur congue lobortis odio at scelerisque. Nullam et risus enim. Proin quis neque nibh. Sed iaculis urna velit, id malesuada orci imperdiet sit amet. Donec aliquam nisi sed dolor congue, eu pellentesque libero lacinia.",
      responses: 2,
      likes: 120,
      type: 'video',
      me: false,
    );

    listPublicationModel = [
      textPublicationModel,
      imagePublicationModel,
      videoPublicationModel,
    ];

    String firstCommentId = const Uuid().v4();
    listCommentPublicationModel = [
      CommentPublicationModel(
        liked: false,
        pubid: firstPubId,
        usermodel: user1,
        id: firstCommentId,
        date: DateTime.now(),
        me: false,
        comment: "Vraiment sensationnel, je le trouve sublime... J'aimerais bien avoir le meme.",
        responses: 2,
        likes: 5,
      ),
      CommentPublicationModel(
        liked: false,
        usermodel: user2,
        id: const Uuid().v4(),
        pubid: firstPubId,
        date: DateTime.now(),
        me: false,
        comment: "T'as vraiment raison wow!",
        responses: 0,
        likes: 8,
        responseTo: firstCommentId,
      ),
      CommentPublicationModel(
        liked: false,
        usermodel: currentUser,
        id: const Uuid().v4(),
        pubid: firstPubId,
        date: DateTime.now(),
        me: true,
        comment: "Super!",
        responses: 0,
        likes: 1,
        responseTo: firstCommentId,
      ),
      CommentPublicationModel(
        liked: false,
        pubid: firstPubId,
        usermodel: currentUser,
        id: const Uuid().v4(),
        date: DateTime.now(),
        me: true,
        comment: "J'avoue c'est trop bien!",
        responses: 0,
        likes: 0,
      ),
      CommentPublicationModel(
        liked: false,
        pubid: firstPubId,
        usermodel: user2,
        id: const Uuid().v4(),
        date: DateTime.now(),
        me: false,
        comment: "Genial!",
        responses: 0,
        likes: 17,
      ),
      CommentPublicationModel(
        liked: false,
        usermodel: currentUser,
        id: const Uuid().v4(),
        pubid: secondPubId,
        date: DateTime.now(),
        me: true,
        comment: "Incroyable, un des plus beaux tatouages que je n'ai jamais vu. Merci a TattooCity pour l'inspi.",
        responses: 0,
        likes: 2,
      ),
      CommentPublicationModel(
        liked: false,
        usermodel: user2,
        pubid: secondPubId,
        id: const Uuid().v4(),
        date: DateTime.now(),
        me: false,
        comment: "Super jolie !",
        responses: 0,
        likes: 12,
      ),
    ];

    super.initState();
  }

  Future<List<CommentPublicationModel>> getCommentList(PublicationModel publicationModel,
      CommentPublicationModel? commentPublicationModel, bool firstCall, int limit) async {
    await Future.delayed(const Duration(seconds: 2));
    return commentPublicationModel == null
        ? listCommentPublicationModel
            .where((element) => publicationModel.id == element.pubid && element.responseTo == null)
            .toList()
        : listCommentPublicationModel.where((element) => element.responseTo == commentPublicationModel.id).toList();
  }

  Future<PublicationModel> getRefreshedPublicationModel(String pubid, String userid) async {
    return listPublicationModel.firstWhere((element) => element.id == pubid);
  }

  void onSend(String pubid, String? reponseTo, String text, String userid) {
    listCommentPublicationModel.insert(
      0,
      CommentPublicationModel(
        liked: false,
        pubid: pubid,
        usermodel: currentUser,
        id: const Uuid().v4(),
        date: DateTime.now(),
        me: true,
        comment: text,
        responses: 0,
        likes: 0,
        responseTo: reponseTo,
      ),
    );

    int i = 0;
    for (; i < listPublicationModel.length; i++) {
      if (listPublicationModel[i].id == pubid) {
        int responses = listPublicationModel[i].responses;
        listPublicationModel[i] = listPublicationModel[i].copyWith(responses: responses + 1);
        break;
      }
    }

    CommentPublicationModel itCommentPublicationModel;
    while (reponseTo != null) {
      itCommentPublicationModel = listCommentPublicationModel.firstWhere((element) => element.id == reponseTo);
      reponseTo = itCommentPublicationModel.responseTo;
      itCommentPublicationModel.responses++;
    }
  }

  Future<void> onRefresh(String id) async {
    return Future.delayed(const Duration(seconds: 1));
  }

  void onLike(String pubid, String? commentid, bool newState, String userid) {
    dynamic item;
    if (commentid != null) {
      item = listCommentPublicationModel.singleWhere((element) => element.id == commentid);
    } else {
      item = listPublicationModel.firstWhere((element) => element.id == pubid);
    }
    item.liked = newState;
    newState ? item.likes++ : item.likes--;
  }

  @override
  void dispose() {
    bottombarController.dispose();
    super.dispose();
  }

  int itemFetchCount = 15;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));
    return Container(
      color: Colors.black,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 252, 252, 252),
          body: Padding(
            padding: EdgeInsets.fromLTRB(25.w, 23.h, 25.w, 0),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PublicationOpen(
                              publicationModelProvider: listPublicationModel[0],
                              onLike: onLike,
                              onLikeComment: onLike,
                              locale: "fr",
                              onSend: onSend,
                              bottombarController: bottombarController,
                              onRefresh: onRefresh,
                              onPop: (x) {},
                              onReport: (x, y, z) {},
                              onDelete: (x, y, z) {},
                              onPubShare: (
                                x,
                                y,
                              ) {},
                              onPubEdit: (x) {},
                              onAvatarTap: (x) {},
                              listCommentModels: listCommentPublicationModel,
                              itemFetchCount: itemFetchCount,
                              onClickComment: (
                                  {required CommentPublicationModel commentPublicationModel,
                                  required PublicationModel publicationModel}) {},
                              liked: true)),
                    );
                  },
                  child: Publication(
                    liked: true,
                    themeDataApp: ThemeDataApp(),
                    publicationModelProvider: listPublicationModel[0],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0.h),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PublicationOpen(
                                publicationModelProvider: listPublicationModel[1],
                                onLike: onLike,
                                onLikeComment: onLike,
                                locale: "fr",
                                onSend: onSend,
                                bottombarController: bottombarController,
                                onRefresh: onRefresh,
                                onPop: (x) {},
                                onReport: (x, y, z) {},
                                onDelete: (x, y, z) {},
                                onPubShare: (
                                  x,
                                  y,
                                ) {},
                                onPubEdit: (x) {},
                                onAvatarTap: (x) {},
                                listCommentModels: listCommentPublicationModel,
                                itemFetchCount: itemFetchCount,
                                onClickComment: (
                                    {required CommentPublicationModel commentPublicationModel,
                                    required PublicationModel publicationModel}) {},
                                liked: true)),
                      );
                    },
                    child: Publication(
                      liked: false,
                      themeDataApp: defaultThemeDataApp().copyWith(borderRadius: 0),
                      publicationModelProvider: listPublicationModel[1],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0.h),
                  child: Publication(
                    liked: false,
                    themeDataApp: const ThemeDataApp().copyWith(borderRadius: 10.r),
                    publicationModelProvider: listPublicationModel[2],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
