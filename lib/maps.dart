
// MAPS - very flexible,
//        all keys must be unique


void main(){
  print("hello world");

  var mymap = {1:"apple" , 2:"banana" , 3:"pear"};
  print(mymap);

  var maptwo = {
    'key 1':'value 1',
     3 : 'value 2',
     4.3 : true
  };
  print(maptwo);

  // can use - .isEmpty, .length, .keys, .values,
  //    .containsKey(''), .containsValue(), .remove(*key*)
  print("value at 'key 1' ${maptwo['key 1']}");
}