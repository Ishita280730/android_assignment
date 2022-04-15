
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'content_display_bloc.dart';
import 'content_display_event.dart';
import 'content_display_state.dart';

class DataFromAPI extends StatefulWidget {

  const DataFromAPI({Key? key, required String title}) : super(key: key);

  @override
  _DataFromAPIState createState() => _DataFromAPIState();

}

class _DataFromAPIState extends State<DataFromAPI> {

  @override
  void initState() {
    context.read<UserDetailsBloc>().add(GetUserData());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('User Details'),
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue.shade700,
        ),
        body:
        BlocBuilder<UserDetailsBloc,UserDetailsState>(builder: (context,state){
          return
            state.users != null && state.users != [] ?
            ListView.builder(
              itemCount: state.users!.length,
              itemBuilder: (context, index){
                return
                  Padding(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                    child: Card(
                      color: Colors.white,
                      child: Row(
                          children: [
                             Expanded(
                               flex: 12,
                               child: Padding(
                                 padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.01,
                                     MediaQuery.of(context).size.width*0.02,
                                     MediaQuery.of(context).size.width*0.02,
                                     MediaQuery.of(context).size.width*0.02),
                                 child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children:<Widget> [

                                               Text(state.users![index].name!,
                                                      style: TextStyle(fontWeight:FontWeight.bold,fontSize: MediaQuery.of(context).size.width *0.06, color: Colors.blue.shade700),),
                                              Padding(
                                                padding:  EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.01,
                                                    MediaQuery.of(context).size.width*0.02,
                                                    MediaQuery.of(context).size.width*0.02,
                                                    MediaQuery.of(context).size.width*0.01),
                                                child: Text(state.users![index].subjects!.toString()),
                                              ),

                                              Padding(
                                                padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.01,
                                                    MediaQuery.of(context).size.width*0.01,
                                                    MediaQuery.of(context).size.width*0.02,
                                                    MediaQuery.of(context).size.width*0.01),
                                                child: Text(state.users![index].qualification!.toString()),
                                              ),

                                              Padding(
                                                padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.01,
                                                    MediaQuery.of(context).size.width*0.02,
                                                    MediaQuery.of(context).size.width*0.01,
                                                    MediaQuery.of(context).size.width*0.02),
                                                child: SizedBox(
                                                  height:  MediaQuery.of(context).size.height *0.05,
                                                  width:  MediaQuery.of(context).size.width * 0.3,
                                                  child: ElevatedButton(onPressed: (){}, child: Text('View More'), style: ButtonStyle(
                                                      backgroundColor:
                                                      MaterialStateColor.resolveWith(
                                                              (states) =>
                                                          Colors.blue.shade700),
                                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                            borderRadius:
                                                            BorderRadius.circular(MediaQuery.of(context).size.width*20),

                                                          )))),
                                                ),
                                              )
                                            ],
                                  ),
                               ),
                             ),

                         Spacer(),

                                    SizedBox(
                                          height: MediaQuery.of(context).size.height *0.15,
                                          width: MediaQuery.of(context).size.width *0.3,
                                          child: Padding(
                                            padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.01),
                                            child: Card(
                                              child: Image.network(state.users![index].profileImage!),color: Colors.blue.shade50,
                                            ),
                                          )
                                        ),


                          ],
                        ),
                    ),
                  );
              },
            ) : Center(
              child: CircularProgressIndicator(),
            );
        })
    );
  }
}



