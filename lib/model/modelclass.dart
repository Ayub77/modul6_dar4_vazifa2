class User{

  String email= "";
  String password= "";
  String number= "";
  String address= "";

   User(this.email,this.number,this.address);
   User.from(this.email,this.password);


    User.fromJson(Map<String, dynamic> json)
      : email = json['email'],
      password = json['password'],
      number = json['number'],
      address = json['address'];


    Map<String, dynamic> toJson()=>{
      'email' : email,
      'password' : password,
      'number' : number,
      'address' : address
    };

}