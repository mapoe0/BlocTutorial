/*categories:
created_at:"2020-01-05 13:42:19.897976"
icon_url:"https://assets.chucknorris.host/img/avatar/chuck-norris.png"
id:"yevZ1C6IQViUoVvD6gM8Ng"
updated_at:"2020-01-05 13:42:19.897976"
url:"https://api.chucknorris.io/jokes/yevZ1C6IQViUoVvD6gM8Ng"
value:"There's no life on Mars because Chuck Norris have already been there." */
import 'package:equatable/equatable.dart';

class Joke extends Equatable {
  String id;

  String value;

  Joke({
    required this.id,
    required this.value,
  });

  @override
  List<Object?> get props => [id, value];
}
