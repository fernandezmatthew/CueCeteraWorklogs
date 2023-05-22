void main() {
  // dart programs start at void main
  
  // variables are statically-typed
  // some Dart variable types: int, String, bool, dynamic
  // dynamic type CAN be changed in the future, going to avoid using these in tutorial
  // Strings need single quotes?
  
  // List type available, stores variables in an array, do not have to match type:
  //    List list = [a, b, c]
  // while different data types are OKAY, not good preactice typically. for specfic:
  //    List<String> list = [a, b, c]
  // some functions: add(d), remove(d)
  
  User user1 = User('FatherOfCalculus', 23);
  user1.login();
  
  User user2 = User('DaddyOfPhysics', 22);
  user2.login();
  
  SuperUser user3 = SuperUser('TryndTheMere', 18);
  user3.login();
  user3.publish();
  return;
}

class User {
  // variables seem to be "public" by default
  String username;
  int age;
  
  // constructors can be overridden. To use an initializer list, can use the ':' char
  // like in c++, can also put this.var in the arguments list for the function.
  User(this.username, this.age) {}
  
  void login() {
    print(username + ' logged in!');
  }
}

// inheritance example. User "extends" child of other class
class SuperUser extends User {
  
  // make a constructor for the child that invokes the parent constructor like so
  SuperUser(String username, int age) : super(username, age);
  
  void publish() {
    print('Published update!');
  }
}

// if we are just returning a function in one line, we can convert to an arrow function

/*String greeting() {
  return 'Hello, World!';
}

int getAge() {
  return 23;
}*/

String greeting() => 'Hello, World!';
int getAge() => 23;