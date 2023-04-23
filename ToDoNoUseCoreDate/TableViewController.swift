//
//  TableViewController.swift
//  ToDoNoUseCoreDate
//
//  Created by Борух Соколов on 23.04.2023.
//

import UIKit

class TableViewController: UITableViewController {

    var tasks: [String] = ["buy coffe","eat dog food"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tasks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text=tasks[indexPath.row]

        return cell
    }
    

   
    
    @IBAction func addNewEvent(_ sender: Any) {
 
        let alertController = UIAlertController(title: "New Task", message: "Please add a new task", preferredStyle: .alert)
        alertController.addTextField { _ in }
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { action in
            let tf = alertController.textFields?.first
            if let newTask = tf?.text {
                self.tasks.insert(newTask, at: 0)
                self.tableView.reloadData()
            }
        }
        
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { _ in }
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
        
        
    }
    
    
    
}
