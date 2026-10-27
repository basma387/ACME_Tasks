import 'dart:async';

final List<Map<String,dynamic>> database = [

  {
    'id': 1,
    'name': 'John Doe',
    'height': 180,
    'employment status': 'Employed',
  },

  {
    'id': 2,
    'name': 'Jane Smith',
    'height': 165,
    'employment status': 'Unemployed',
  },

  {
    'id': 3,
    'name': 'Jane Doe',
    'height': 170,
    'employment status': 'Employed',
  }

];

Future <List<Map<String,dynamic>?>> fetchUserInfo() async{
  print("------Fetching user information from the database...------");
  await Future.delayed(const Duration(milliseconds: 1500));
  return List<Map<String,dynamic>>.from(database);
}

Stream<int> countdown() async*{
  for (int i=3; i>0; i--){
    await Future.delayed(const Duration(seconds: 1));
    yield i;
  } 
}

void main() async{
  print("------ Fetching ------");
  final Stream<int> countdownStream = countdown();
  await for (final int value in countdownStream){
    print( ' $value seconds remaining...');
}
print ('------ Countdown complete! ------');
final List<Map<String,dynamic>?> userInfo = await fetchUserInfo();
print('------ User Information ------');
for(final profile in userInfo){
  print('ID: ${profile?['id']}');
  print('Name: ${profile?['name']}');
  print('Height: ${profile?['height']}');
  print('Employment Status: ${profile?['employment status']}');
  print('-----------------------------');
}

}

