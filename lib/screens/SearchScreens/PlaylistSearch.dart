import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vibe_music/screens/TpScreen.dart';
import 'package:vibe_music/utils/colors.dart';

class PlaylistSearch extends StatefulWidget {
  const PlaylistSearch({required this.playlists, super.key});
  final List playlists;
  @override
  State<PlaylistSearch> createState() => _PlaylistSearchState();
}

class _PlaylistSearchState extends State<PlaylistSearch> {
  List playlists = [];

  @override
  void initState() {
    super.initState();
    playlists = widget.playlists;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: playlists.length,
      itemBuilder: (context, index) {
        Map playlist = playlists[index];
        return ListTile(
          onTap: () {
            Navigator.pushNamed(context, '/playlist',
                arguments: {'playlistId': playlist['browseId']});
            // Navigator.push(
            //     context,
            //     CupertinoPageRoute(
            //         builder: (_) => TpSrceen(playListId: playlist)));
          },
          title: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  playlist['thumbnails'].last['url'],
                  height: 100,
                  width: 100,
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        playlist['title'],
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        playlist['author'],
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 14, color: grayColor),
                      ),
                      Text(
                        playlist['itemCount'] + ' songs',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 14, color: grayColor),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}



// Column(
//           children: [
//             Image.network(playlist['thumbnails'].last['url']),
//             Text(
//               playlist['title'],
//               overflow: TextOverflow.ellipsis,
//               maxLines: 2,
//             ),
//             Text(
//               playlist['author'],
//               overflow: TextOverflow.ellipsis,
//             ),
//           ],
//         );,