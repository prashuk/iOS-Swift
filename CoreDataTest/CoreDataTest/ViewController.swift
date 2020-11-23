//
//  ViewController.swift
//  CoreDataTest
//
//  Created by Prashuk Ajmera on 11/23/20.
//

import UIKit

class ViewController: UITableViewController {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var items: [Person]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = self.items?.count {
            return count
        } else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellName", for: indexPath)
        cell.textLabel?.text = self.items?[indexPath.row].name
        cell.detailTextLabel?.text = self.items?[indexPath.row].gender
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, handler) in
            let personToRemove = self.items?[indexPath.row]
            self.context.delete(personToRemove!)
            try! self.context.save()
            self.fetchData()
        }
        
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedPerson = self.items![indexPath.row]
        
        let alert = UIAlertController(title: "Edit Person", message: "Enter Name", preferredStyle: .alert)
        alert.addTextField(configurationHandler: .none)
        
        let textFeild = alert.textFields![0]
        textFeild.text = selectedPerson.name
        
        let saveButton = UIAlertAction(title: "Save", style: .default) { (action) in
            let textFeild = alert.textFields![0]
            selectedPerson.name = textFeild.text
            
            // Save new object to Core Data
            do {
                try self.context.save()
            }
            catch { }
            
            // Fetch data from Core Data
            self.fetchData()
        }
        
        alert.addAction(saveButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func addPerson(_ sender: Any) {
        
        let alert = UIAlertController(title: "Add Person", message: "Enter Name", preferredStyle: .alert)
        alert.addTextField(configurationHandler: .none)
        
        let submitButton = UIAlertAction(title: "Add", style: .default) { (action) in
            let textFeild = alert.textFields![0]
        
            // Create new object
            let newPerson = Person(context: self.context)
            newPerson.name = textFeild.text
            newPerson.gender = "Male"
            newPerson.age = 25
            
            // Save new object to Core Data
            do {
                try self.context.save()
            }
            catch { }
            
            // Fetch data from Core Data
            self.fetchData()
        }
        
        alert.addAction(submitButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    func deleteData(_ person: Person) {
        self.context.delete(person)
        
        do {
            try context.save()
        }
        catch {
            
        }
        
        self.fetchData()
    }
    
    func fetchData() {
        self.items = try! context.fetch(Person.fetchRequest())
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

}
