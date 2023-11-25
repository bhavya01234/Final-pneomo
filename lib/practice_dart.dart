import 'dart:io';

class human{
  // CONSTRUCTOR : function that returns no value and made of class name
  human();

}
class myclass{
  //constructor (optional)
  myclass(){
    print("this is fully optional");
  }

  void printname(String name){
    print("this is my name : $name");
  }
}

void main(){
  print("welcome to dart");
  // stdout.write is same as print
  stdout.write("enter your name : ");
  // to take input from user : stdinLineSync
  var name = stdin.readLineSync();
  print("welcome,  $name");

  human(); //creating class object  (now can be done without new* keyword)
  // non-nullable (a)
  int a;
  a=0;
  //nullable (b)
  int? b;
  print(a);
  print(b);

  //parse converts the string '92789474034' into bigint (integer)     FORMAT :
  BigInt x;
  x  = BigInt.parse('92789474034');

  print(x);

  num z = 9;
  num r = 22.3;
  bool isLogin =true;

  var something = "dsdfcd";
  //to make dynamic, dont initialize in var to assign any type
  var hey;
  hey =0;
  hey = true;
  hey = "hello";

  var myc = myclass();
  myc.printname("kabir");

  //    LIST
  var mylist =[1,2,3,5,6,2.4,21,3];
  mylist.add(50);
  print(mylist);
  print(mylist.length);

  var secondlist=[];

  secondlist.addAll(mylist);
  print("$secondlist");

  mylist.insert(4, 6987);
  print(mylist);

  secondlist.insertAll(4, mylist);
  print(secondlist);
  secondlist[1]=998;
  print("secondlist :\n $secondlist");

  //if range exceeded, it will not replace the extras, it will insert those
  secondlist.replaceRange(2, 7, [222,333,444,555,666,777]);
  secondlist.removeLast();
  // 50 removed,,, more : .removerange, .removeat
  print(secondlist);

  // 3 WAYS OF USING REV, LEN, etc functions
  var rev = secondlist.reversed;
  print(rev);
  print("${secondlist.reversed}");
  print(secondlist.reversed);
  print(secondlist.first);
  print(secondlist.last);
  print(secondlist.isEmpty);
  print(secondlist.elementAt(4));
}