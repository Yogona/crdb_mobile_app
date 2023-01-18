class Person{
  late int id;
  late String _firstName, _lastName, _dob, _gender, _address, _phone, _email, _pwd;

  Person(this._gender);

  void setId(int id){this.id = id;}
  int getId(){return id;}

  void setFirstName(String name){_firstName = name;}
  String getFirstName(){return _firstName;}

  void setLastName(String name){_lastName = name;}
  String getLastName(){return _lastName;}

  void setDOB(String dob){_dob = dob;}
  String getDOB(){return _dob;}

  void setGender(String gender){_gender = gender;}
  String getGender(){return _gender;}

  void setAddress(String address){_address = address;}
  String getAddress(){return _address;}

  void setPhone(String phone){_phone = phone;}
  String getPhone(){return _phone;}

  void setEmail(String email){_email = email;}
  String getEmail(){return _email;}

  void setPwd(String pwd){_pwd = pwd;}
  String getPwd(){return _pwd;}
}