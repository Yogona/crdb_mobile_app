class User{
  static int _id = 0, _roleId = 0;
  static void setId(int id){_id = id;}
  static int getId(){return _id;}
  static void setRoleId(int roleId){_roleId = roleId;}
  static int getRoleId(){return _roleId;}

  static String _firstName = "", _lastName = "", _dob = "", _gender = "", _address = "", _phone = "", _email = "";
  static void setFirstName(String firstName){_firstName = firstName;}
  static String getFirstName(){return _firstName;}
  static void setLastname(String lastName){_lastName = lastName;}
  static String getLastName(){return _lastName;}
  static void setDOB(String dob){_dob = dob;}
  static String getDOB(){return _dob;}
  static void setGender(String gender){_gender = gender;}
  static String getGender(){return _gender;}
  static void setAddress(String address){_address = address;}
  static String getAddress(){return _address;}
  static void setPhone(String phone){_phone = phone;}
  static String getPhone(){return _phone;}
  static void setEmail(String email){_email = email;}
  static String getEmail(){return _email;}
}