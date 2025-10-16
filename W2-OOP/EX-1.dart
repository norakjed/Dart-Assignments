enum Skill { FLUTTER, DART, OTHER }

class Address {
  final String street, city, zipCode;

  Address(this.street, this.city, this.zipCode); 
}

class Employee {
  String _name;
  double _baseSalary;
  List<Skill> _skills;
  Address _address;
  int _yearsOfExperience;

  // Getter
  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skills => _skills;
  Address get address => _address;
  int get yearsOfExperience => _yearsOfExperience;

  // Default Employee Contructor
  Employee(this._name, this._baseSalary, this._skills, this._address, this._yearsOfExperience);

  // Mobile-developer Contructors
  Employee.mobileDeveloper(String name, double baseSalary, Address address, int yearsOfExperience)
    : _name = name,
      _baseSalary = baseSalary,
      _address = address,
      _yearsOfExperience = yearsOfExperience,
      _skills = [Skill.FLUTTER, Skill.DART];

  // Methods
  void printDetails() {
    print('Employee: ${_name}, Base Salary: \$${_baseSalary}\nTotal Salary: ${calculateSalary()}');
  }
  
  double calculateSalary(){
    double total = _baseSalary;

    total += _yearsOfExperience;

    for (var skills in _skills){
      switch (skills){
        case Skill.DART:
          total += 3000;
          break;
        case Skill.FLUTTER:
          total += 5000;
          break;
        case Skill.OTHER:
          total += 1000;
          break;
      }
    }

    return total;

  }
  
}

void main() {
  var emp1 = Employee('Sokea', 40000, [Skill.DART], Address('Street 123', 'Phnom Penh', '123'), 3 );
  emp1.printDetails();

  var emp2 = Employee('Ronan', 45000, [Skill.FLUTTER], Address('Street 456', 'Phnom Penh', '456'), 4 );
  emp2.printDetails();

  var emp3 = Employee.mobileDeveloper('Norakjed', 50000, Address('Street 789', 'Phnom Penh', '789'), 5);
  emp3.printDetails();
}