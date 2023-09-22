import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:untitled/features/GoogleSignIn/GoogleSignIn.dart';
import 'package:untitled/features/GoogleSignIn/login_Screen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'config/routes/routes.dart';
import 'features/articleList/presentation/bloc/article/local/local_article_bloc.dart';
import 'features/articleList/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'features/articleList/presentation/bloc/article/remote/remote_article_event.dart';
import 'features/articleList/presentation/pages/HomeScreen/HomeScreen.dart';
import 'inject_getit.dart';

Future main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDv8yum-K4W2T2jnlLlrpysbd9HmEmcRgA",
      appId: "1:861427703528:android:89db1f4fa87855a92a735d",
      messagingSenderId: "861427703528",
      projectId: "auth-final-task",
      storageBucket: "auth-final-task.appspot.com",

    ),
  );
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GoogleSignInProvider>(
        create: (_) => GoogleSignInProvider(),child:MultiBlocProvider(providers: [BlocProvider<RemoteArticlesBloc>(
    create: (context) => sl()..add(const GetArticles()),),
    BlocProvider(
    create: (_) => sl<LocalArticleBloc>(),)],
    child:const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.onGenerateRoutes,
      home: MyHomePage(),
    )));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});





  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData){
            return HomeScreen();
          }else if (snapshot.hasError) {
            return Center(child: Text('Something went wrong'),);
          } else {
            return LoginScreen();
          }
        });

  }
}
