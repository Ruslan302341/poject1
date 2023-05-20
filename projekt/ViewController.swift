//
//  ViewController.swift
//  projekt
//
//  Created by admin on 12.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var TextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addTask(_ sender: Any) {
        
        let taskName = TextField.text!
        var newTask = TaskItem(name: taskName)
        
        //var taskarray:[TaskItem] = []
        
        do {
            if let data = UserDefaults.standard.data(forKey: "taskItemArray") {
                var array = try JSONDecoder().decode([TaskItem].self, from: data)
                
                array.append(newTask)
                
                let encodedata = try JSONEncoder().encode(array)
                
                UserDefaults.standard.set(encodedata, forKey: "taskItemArray")
            } else {
                let array = [newTask]
                
                let encodedata = try JSONEncoder().encode(array)
                
                UserDefaults.standard.set(encodedata, forKey: "taskItemArray")
            }
        } catch {
            print("unable to encode \(error)")
        }
        
        //        if let todoarray = UserDefaults.standard.array(forKey: "ToDoArray") as? [String] {
        //
        //            var todos = todoarray
        //            todos.append(task)
        //
        //            UserDefaults.standard.set(todos, forKey: "ToDoArray")
        //        } else {
        //            let array = [task]
        //            UserDefaults.standard.set(array, forKey: "ToDoArray")
        //        }
                
        //    }
        //}
        TextField.text = ""
    }
}
