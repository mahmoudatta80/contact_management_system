import 'dart:io';

import 'package:contact_management/contact_management/new_contact.dart';

class WelcomeAndChoice
{
  NewContact n1 = NewContact();
  welcomeAndChoice()
  {
    welcome();
    int choice = int.parse(stdin.readLineSync()!);
    if(choice == 1)
    {
      createContact();
      welcomeAndChoice();
    }else if(choice == 2)
    {
      showList();
    }else if(choice == 3)
    {
      search();
    }else if(choice == 4)
    {
      edit();

    }else if(choice == 5)
    {
      delete();
    }else if(choice == 6)
    {
      exit(1);
    }else
    {
      print('Please enter correct number');
      welcomeAndChoice();
    }
  }

  welcome()
  {
    print(
      '                        1- Create new contact                                                   2- List all contacts',
    );
    print(
      '                        3- search for number                                                    4- Edit contact',
    );
    print(
      '                        5- Delete contact                                                       6- Exit',
    );
  }

  createContact()
  {
    print('Please enter the name : ');
    String name = stdin.readLineSync()!.toString();
    print('Please enter the phone number : ');
    int phone = int.parse(stdin.readLineSync()!);
    print('Please enter the id from 1 or more: ');
    int id = int.parse(stdin.readLineSync()!);
    n1.contacts.forEach((a)
    {
      if(a.id == id)
      {
        print('sorry this id had taken');
        welcomeAndChoice();
      }
    });
    n1.contacts.add(NewContact(phone: phone , name: name , id: id ));
    print('The contact was added');
  }

  showList()
  {
    if(n1.contacts.length > 0)
    {
      n1.contacts.forEach((e)
      {
        print('${e.id} - ${e.name}');
      });
      welcomeAndChoice();
    }else
    {
      contactEmpty();
    }
  }

  search()
  {
    if(n1.contacts.length > 0)
    {
      n1.contacts.forEach((b)
      {
        print('${b.id} - ${b.name}');
      });
      print('Please Enter id to search for number : ');
      int showId = int.parse(stdin.readLineSync()!);
      n1.contacts.forEach((e)
      {
        if(e.id == showId)
        {
          print('${e.phone}');
          welcomeAndChoice();
        }
      });
      print('sorry this id is not correct');
      welcomeAndChoice();
    }else
    {
      contactEmpty();
    }
  }

  edit()
  {
    if(n1.contacts.length > 0)
    {
      n1.contacts.forEach((b)
      {
        print('${b.id} - ${b.name}');
      });
      print('Please enter id of number you want to edit');
      int editId=int.parse(stdin.readLineSync()!);
      n1.contacts.forEach((s)
      {
        if(s.id == editId)
        {
          print('Old id is ${s.id}');
          print('Add a new id : ');
          int id = int.parse(stdin.readLineSync()!);
          n1.contacts.forEach((f)
          {
            if(f.id == id)
            {
              print('sorry this id had taken');
              edit();
            }
          });
          s.id = id;
          print('Old name is ${s.name}');
          print('Add a new name : ');
          String name = stdin.readLineSync()!.toString();
          s.name = name;
          print('Old phone number is ${s.phone}');
          print('Add a new phone : ');
          int phone = int.parse(stdin.readLineSync()!);
          s.phone = phone;
          print('the contact was edited');
          welcomeAndChoice();
        }
      });
      print('sorry this id is not found ');
      welcomeAndChoice();
    }else
    {
      contactEmpty();
    }
  }

  delete()
  {
    if(n1.contacts.length > 0)
    {
      n1.contacts.forEach((b)
      {
        print('${b.id} - ${b.name}');
      });
      print('Enter id you want to delete');
      int id = int.parse(stdin.readLineSync()!);
      n1.contacts.forEach((d)
      {
        if(d.id == id)
        {
          n1.contacts.remove(d);
          print('The number was deleted');
          welcomeAndChoice();
        }
      });
      print('Sorry this id is not found');
      welcomeAndChoice();
    }else
    {
      contactEmpty();
    }
  }

  contactEmpty()
  {
    print('The list of contact is empty');
    welcomeAndChoice();
  }
}