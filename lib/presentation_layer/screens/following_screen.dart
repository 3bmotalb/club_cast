import 'package:club_cast/data_layer/bloc/intial_cubit/general_app_cybit.dart';
import 'package:club_cast/data_layer/bloc/room_cubit/general_app_cubit_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class FollowingScreen extends StatelessWidget {
  const FollowingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GeneralAppcubit, GeneralAppStates>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Following',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              backgroundColor: Colors.transparent,
              leading: MaterialButton(
                onPressed: ()
                {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
              elevation: 0,
            ),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: CircleAvatar(radius: 30),
                          title: Text(
                            'AhmedHamed',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          subtitle: Text(
                            'ahmedhamed@gmail.com',
                            style: GoogleFonts.rubik(
                              color: Colors.grey[400],
                              fontSize: 13,
                            ),
                          ),
                          trailing: MaterialButton(
                            color: Theme.of(context).primaryColor,
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'Unfollow',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          );
        },
        listener: (context, state) {});
  }
}
