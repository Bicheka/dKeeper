import List "mo:base/List";
import Debug "mo:base/Debug";
actor DKeeper {

  //create a data type is like creating an object 
  public type Note = {
    title: Text;
    content: Text;
  };

  //after the : comes the data type of the vare
  //this list will contain Note objects
  //it will start as nill meaning empty and specifing it is a nill Note object
  //we created something similar to an array of objects but pre-appended
  stable var notes: List.List<Note> = List.nil<Note>();

  public func createNote(titleText: Text, contentText: Text){
    let newNote: Note = {
      title = titleText;
      content = contentText;
    };
    notes := List.push(newNote, notes);
    Debug.print(debug_show(notes));
  };

  //List vs Array

  public query func readNotes(): async [Note]{
    return List.toArray(notes);
  };

  public func removeNote(index: Nat){
    let list1 = List.take(notes, index); //"take" takes the first X items of an array/list
    let list2 = List.drop(notes, index + 1); //"drop" removes the first X items of an array/list
    notes := List.append(list1, list2);
  }


}