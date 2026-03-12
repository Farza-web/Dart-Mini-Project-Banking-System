import 'dart:io';
 Map<String,double>accounts={};
main(){
  while(true){
    print("\n=====BANKING SYSTEM=====");
    print("1.Create Account");
    print("2.Deposite Money");
    print("3.Withdrawal Money");
    print("4.Check Balance");
    print("5.Show All Accounts");
    print("6.Exit");
    stdout.write("Enter your Choice (1,2,3,...):");
    int choice =int.parse(stdin.readLineSync()!);
    switch(choice){
      case 1:
      createAccount();
      break;
      case 2:
      depositeMoney();
      break;
      case 3:
      withdrawMoney();
      break;
      case 4:
      checkBalance();
      break;
      case 5:
      showAccounts();
      break;
      case 6:
      print("Thank you for using the Banking System.");
      return;
      default:
      print("Invalid choice ! Try again.");

    }

  }

 

}
void createAccount (){
  stdout.write("Enter account holder name:");
  String name = stdin.readLineSync()!;
  accounts[name]=0.0;
  print("Account created successfully!");
}
void depositeMoney(){
  stdout.write("Enter account holder name:");
  String name =stdin.readLineSync()!;
  if (accounts.containsKey(name)){
    stdout.write("Enter your amount:");
    double amount = double.parse(stdin.readLineSync()!);
    accounts[name]=accounts[name]!+amount;
    print("Deposite Successfull !");
    print("Deposite Amount:\$ ${amount}");
    print("Current Amount : \$ ${accounts[name]}");

  }else{
    print("Account not found");
  }

}
void withdrawMoney(){
  stdout.write("Enter account holder name:");
  String name =stdin.readLineSync()!;
  if (accounts.containsKey(name)){
  stdout.write("Enter withdrawal amount:");
  double withdrawAmount = double.parse(stdin.readLineSync()!);
  if (accounts[name]! >= withdrawAmount){
    accounts[name]=accounts[name]! - withdrawAmount;
    print ("Withdrawal Successfull !");
    print("Deducting Amount:\$ ${withdrawAmount}");
    print("Remaining Balance:\$ ${accounts[name]}");
  }
  else{
    print("Insufficient balance.");
  }

  }else{
    print("Account not found");
  }
  
}
void checkBalance(){
  stdout.write("Enter account holder name:");
  String name =stdin.readLineSync()!;
  if(accounts.containsKey(name)){
    print("Balance:\$ ${accounts[name]}");
  }else{
    print("Account not found");
  }
}
void showAccounts(){
  if (accounts.isEmpty){
    print("No accounts available.");
  }else{
    print("\nAll Accounts:");
    int i =1;
    for (var entry in accounts.entries){
      print("$i. ${entry.key} : \$ ${entry.value}");
      i++;
    }
 
  }
}