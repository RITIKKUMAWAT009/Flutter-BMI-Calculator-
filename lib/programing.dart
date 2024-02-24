
import 'dart:io';

void main(){
 // var readLineSync = stdin.readLineSync();
 // stdout.write(readLineSync);
  var myClass = MyClass();
  myClass.add(3, 2);
  MyClass.map();
}
class MyClass{
  int add(int a,int b){
    List<String> list=["name","fsdof"];
    var reversed = list.reversed;
    print(reversed.first);
    return a+b;
  }
   static void map(){
    var myMap={
      "k1":2,
      "k2":"ok",
    };
    var keys = myMap.keys;
    var entries = myMap.entries;
    print(entries);
    print(keys);

  }

}