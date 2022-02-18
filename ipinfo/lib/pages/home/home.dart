import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ipinfo/bloc/blocs.dart';
import 'package:ipinfo/styles.dart';
import 'package:ipinfo/widgets/custom_button.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController _ipController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<IpBloc, IpState>(
      listener: (context, state) {
        print("CURRENT STATE $state");
        _showResult(context, state);
        _showError(context, state);
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Center(
              child: Padding(
                padding: Styles.kPadding,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),
                      Text("ipinfo", style: Styles.kTitle),
                      const SizedBox(height: 40),
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Ip musn\'t be empty';
                            }
                            return null;
                          },
                          controller: _ipController,
                          style: Styles.kSubtitle,
                          cursorColor: Styles.kPrimary,
                          decoration: Styles.kTextFormDecoration.copyWith(
                            hintText: "Search IP Address",
                            prefixIcon: const Icon(
                              Icons.place,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      CustomButton(
                        loading: state is IpFetchingState,
                        text: "Search IP",
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context
                                .read<IpBloc>()
                                .add(IpSearchEvent(_ipController.text));
                            _ipController.clear();
                          }
                        },
                      ),
                      const Spacer(),
                      Text("antoniopetricciuoli.com", style: Styles.kSubtitle),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _valueResult(IconData icon, String title) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 10),
            Text(title, style: Styles.kSubtitle),
          ],
        ),
      );

  void _showResult(BuildContext context, IpState state) {
    if (WidgetsBinding.instance != null) {
      WidgetsBinding.instance!.addPostFrameCallback(
        (_) {
          if (state is IpFetchedState) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                backgroundColor: Styles.kScaffold,
                title: Text(
                  state.ip.ip,
                  style: Styles.kTitle,
                ),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _valueResult(Icons.flag, state.ip.country),
                    _valueResult(Icons.public, state.ip.region),
                    _valueResult(Icons.schedule, state.ip.timezone),
                    _valueResult(Icons.local_post_office, state.ip.postal),
                    _valueResult(Icons.dns, state.ip.org),
                    _valueResult(Icons.map, state.ip.loc),
                    const SizedBox(height: 40),
                    CustomButton(
                      text: "Find another ip",
                      onPressed: () => Navigator.pop(context),
                      loading: false,
                    ),
                  ],
                ),
              ),
            );
          }
        },
      );
    }
  }

  void _showError(BuildContext context, IpState state) {
    if (WidgetsBinding.instance != null) {
      WidgetsBinding.instance!.addPostFrameCallback(
        (_) {
          if (state is IpErrorState) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                backgroundColor: Styles.kScaffold,
                title: Text(
                  "Oops! Something went wrong",
                  style: Styles.kTitle,
                ),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Ip not found :(",
                      style: Styles.kSubtitle,
                    ),
                    const SizedBox(height: 40),
                    CustomButton(
                      text: "Try Again",
                      onPressed: () => Navigator.pop(context),
                      loading: false,
                    ),
                  ],
                ),
              ),
            );
          }
        },
      );
    }
  }
}
