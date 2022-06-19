import 'package:efpl/application/auth/auth/auth_bloc.dart';
import 'package:efpl/application/settings/bloc/settings_bloc.dart';
import 'package:efpl/application/util/util_bloc.dart';
import 'package:efpl/domain/auth/user.dart';
import 'package:efpl/domain/settings/settings.dart';
import 'package:efpl/presentation/settings/action_types.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/auth/i_auth_repository.dart';
import '../../domain/settings/value_objects.dart';
import '../../injectable.dart';
import '../../services/snack_bar.dart';
import '../colors.dart';
import '../core/widgets/bouncing_ball_loading_indicator.dart';

// ignore: must_be_immutable
class SettingsView extends StatelessWidget {
  SettingsView({
    Key? key,
  }) : super(key: key);
  User? user;
  @override
  Widget build(BuildContext context) {
    // Get The bloc value from the provider
    var state = BlocProvider.of<AuthBloc>(context).state;
    if (state is Authenticated) {
      user = state.user;
    }
    if (state is Authorised && user == null) {
      user = state.user;
    }
    final UtilBloc _utilBloc = BlocProvider.of<UtilBloc>(context);

    _utilBloc.add(
      const UtilEvent.setDefaultLocale(),
    );
    return BlocConsumer<SettingsBloc, SettingsState>(
      listener: (context, state) {
        state.maybeMap(
            loadFailure: ((value) => {}),
            loadSuccess: (value) {},
            settingsUpdateSuccess: (value) {
              CustomSnackBar().showCustomSnackBar(
                showContext: context,
                headlineText: "Update Status",
                message: value.message,
                snackBarType: "success",
              );
              BlocProvider.of<SettingsBloc>(context).add(
                SettingsEvent.loadUserDetail(
                  user!.id.getOrCrash(),
                  user!.token.getOrCrash(),
                ),
              );
            },
            orElse: () {});
      },
      builder: (context, state) {
        return state.map(
          initial: (_) => WillPopScope(
            onWillPop: () async {
              Navigator.pushNamed(context, "/home");
              return true;
            },
            child: Scaffold(
              appBar: AppBar(
                leading: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pushNamed(context, "/home");
                    }),
                title: Text(
                  "Settings",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.blue[50],
                ),
                backgroundColor: Colors.blue[50],
                foregroundColor: ConstantColors.primary_900,
                elevation: 0,
              ),
              body: const Center(
                child: Text("initial"),
              ),
            ),
          ),
          loadFailure: (_) => WillPopScope(
            onWillPop: () async {
              Navigator.pushNamed(context, "/home");
              return true;
            },
            child: Scaffold(
              appBar: AppBar(
                leading: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pushNamed(context, "/home");
                    }),
                title: Text(
                  "Settings",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.blue[50],
                ),
                backgroundColor: Colors.blue[50],
                foregroundColor: ConstantColors.primary_900,
                elevation: 0,
              ),
              body: const Center(
                child: Text("Load failure"),
              ),
            ),
          ),
          settingsUpdateSuccess: (_) => WillPopScope(
            onWillPop: () async {
              Navigator.pushNamed(context, "/home");
              return true;
            },
            child: Scaffold(
              appBar: AppBar(
                leading: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pushNamed(context, "/home");
                    }),
                title: Text(
                  "Settings",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.blue[50],
                ),
                backgroundColor: Colors.blue[50],
                foregroundColor: ConstantColors.primary_900,
                elevation: 0,
              ),
              body: Container(),
            ),
          ),
          loadInProgress: (_) => WillPopScope(
            onWillPop: () async {
              Navigator.pushNamed(context, "/home");
              return true;
            },
            child: Scaffold(
              appBar: AppBar(
                leading: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pushNamed(context, "/home");
                    }),
                title: Text(
                  "Settings",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.blue[50],
                ),
                backgroundColor: Colors.blue[50],
                foregroundColor: ConstantColors.primary_900,
                elevation: 0,
              ),
              body: const BouncingBallLoadingIndicator(),
            ),
          ),
          loadSuccess: (state) => WillPopScope(
            onWillPop: () async {
              Navigator.pushNamed(context, "/home");
              return true;
            },
            child: Scaffold(
              appBar: AppBar(
                leading: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pushNamed(context, "/home");
                    }),
                title: Text(
                  "Settings",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.blue[50],
                ),
                backgroundColor: Colors.blue[50],
                foregroundColor: ConstantColors.primary_900,
                elevation: 0,
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(
                          Icons.person,
                          size: 50,
                          color: Color.fromARGB(255, 18, 140, 240),
                        ),
                        Text(
                          state.settings.userName.getOrCrash(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          user!.email.getOrCrash(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      UserDetailRow(
                        title: "Team Name",
                        value: state.settings.teamName.getOrCrash(),
                      ),
                      UserDetailRow(
                        title: "Favorite Team",
                        value: state.settings.favouriteEplTeam.getOrCrash(),
                      ),
                    ],
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 2,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ActionWidget(
                          icon: Icons.group,
                          label: "Update Team Name",
                          onTap: () {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(10),
                                ),
                              ),
                              context: context,
                              builder: (context) => Padding(
                                padding: MediaQuery.of(context).viewInsets,
                                child: BottomSheetWidget(
                                    label: updateTeamName,
                                    userId: user!.id.getOrCrash(),
                                    initialValue:
                                        state.settings.teamName.getOrCrash(),
                                    selectedTeam: state
                                        .settings.favouriteEplTeam
                                        .getOrCrash(),
                                    settings: state.settings),
                              ),
                            );
                          },
                        ),
                        ActionWidget(
                          icon: Icons.favorite_border_sharp,
                          label: "Update Favorite team",
                          onTap: () {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(10),
                                ),
                              ),
                              context: context,
                              builder: (context) => Padding(
                                padding: MediaQuery.of(context).viewInsets,
                                child: BottomSheetWidget(
                                  label: updateFavoriteTeam,
                                  userId: user!.id.getOrCrash(),
                                  initialValue: state.settings.favouriteEplTeam
                                      .getOrCrash(),
                                  settings: state.settings,
                                  selectedTeam: state.settings.favouriteEplTeam
                                      .getOrCrash(),
                                ),
                              ),
                            );
                          },
                        ),
                        ActionWidget(
                          icon: Icons.assignment_ind,
                          label: updateUserName,
                          onTap: () {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(10),
                                ),
                              ),
                              context: context,
                              builder: (context) => Padding(
                                padding: MediaQuery.of(context).viewInsets,
                                child: BottomSheetWidget(
                                  label: updateUserName,
                                  userId: user!.id.getOrCrash(),
                                  initialValue:
                                      state.settings.userName.getOrCrash(),
                                  selectedTeam: state.settings.favouriteEplTeam
                                      .getOrCrash(),
                                  settings: state.settings,
                                ),
                              ),
                            );
                          },
                        ),
                        ActionWidget(
                          icon: Icons.logout,
                          label: "Logout",
                          onTap: () {
                            getIt<IAuthRepository>().removeUser();
                            Navigator.popAndPushNamed(context, "/sign-in");
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// ignore: must_be_immutable
class BottomSheetWidget extends StatefulWidget {
  BottomSheetWidget({
    required this.label,
    required this.initialValue,
    required this.settings,
    required this.userId,
    required this.selectedTeam,
    Key? key,
  }) : super(key: key);
  final String label;
  final String initialValue;
  final Settings settings;
  final String userId;
  String selectedTeam;
  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  var valueController = TextEditingController();
  @override
  void initState() {
    valueController.text = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Update ${widget.label}",
                style: const TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 47, 108, 212),
                    fontWeight: FontWeight.w700),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          widget.label == updateTeamName || widget.label == updateUserName
              ? Flexible(
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    autofocus: true,
                    maxLength: widget.label == updateTeamName ? 10 : null,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Required field";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      // prefixIcon: Icon(Icons.email),
                      labelStyle: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(
                            fontSize: 18,
                            color: ConstantColors.primary_900.withOpacity(0.55),
                          ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ConstantColors.primary_900,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 0.0,
                        horizontal: 15.0,
                      ),
                    ),
                    controller: valueController,
                    autocorrect: false,
                    onChanged: (value) {},
                  ),
                )
              : Flexible(
                  child: // Drop Down
                      DropdownButton<String>(
                    value: widget.selectedTeam,
                    // value: "Saint George S.C",
                    isExpanded: true,
                    items: [
                      "Saint George S.C",
                      "Wolaita Dicha S.C",
                      "Hawassa Kenema S.C",
                      "Jimma Aba Jifar F.C",
                      "Sidama Coffee S.C",
                      "Addis Ababa City F.C",
                      "Sebeta City F.C",
                      "Adama City S.C",
                      "Fasil Kenema S.C",
                      "Arba Minch City F.C",
                      "Dire Dawa City S.C",
                      "Defence Force S.C",
                      "Wolkite City F.C",
                      "Ethiopian Coffee S.C",
                      "Hadiya Hossana F.C",
                      "Bahir Dar Kenema S.C"
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                          child: Text(
                            value,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          value: value);
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        widget.selectedTeam = value!;
                      });
                    },
                  ),
                ),
          Flexible(
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  var teamName = widget.settings.teamName.getOrCrash();
                  var userName = widget.settings.userName.getOrCrash();
                  switch (widget.label) {
                    case updateUserName:
                      userName = valueController.text;
                      break;
                    case updateTeamName:
                      teamName = valueController.text;
                      break;
                    default:
                      break;
                  }
                  var settings = Settings(
                    userName: UserName(userName),
                    teamName: TeamName(teamName),
                    favouriteEplTeam: FavouriteEplTeam(widget.selectedTeam),
                  );

                  BlocProvider.of<SettingsBloc>(context).add(
                    SettingsEvent.updateUserDetail(
                        settings, widget.userId, widget.label),
                  );
                  Navigator.pop(context);
                },
                child: const Text("Save"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ActionWidget extends StatelessWidget {
  const ActionWidget({
    required this.icon,
    required this.onTap,
    required this.label,
    Key? key,
  }) : super(key: key);
  final IconData icon;
  final void Function()? onTap;
  final String label;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
          radius: 20, backgroundColor: Colors.grey.shade400, child: Icon(icon)),
      title: Text(label),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}

class UserDetailRow extends StatelessWidget {
  const UserDetailRow({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width / 2,
      height: 80,
      child: Card(
        color: Colors.blue[50],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                value,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Flexible(
              child: Text(
                title,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
