//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Joan Cabezas on 9/2/19.
//  Copyright © 2019 josancamon19. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {
    
    var categoryArray : [Category] = [Category]()
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var idxPressed = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        loadCategories()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCategoryCell", for: indexPath)
        cell.textLabel?.text = categoryArray[indexPath.row].name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        idxPressed = indexPath.row
        performSegue(withIdentifier: "goToItems", sender: self)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToItems" {
            let todoListViewController = segue.destination as! TodoListViewController
            if let indexSelected = tableView.indexPathForSelectedRow?.row {
                todoListViewController.selectedCategroy = categoryArray[indexSelected]
            }
        }
    }

    @IBAction func addCategoryButtonPressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add a new Todoey category", message: "", preferredStyle: .alert)
        var textField = UITextField()
        
        let action = UIAlertAction(title: "Add Category", style: .default) { (action) in
            if let newCategory = textField.text {
                if newCategory.isEmpty == false {
                    let categoryToAdd = Category(context: self.context)
                    categoryToAdd.name = newCategory
                    self.categoryArray.append(categoryToAdd)
                    self.saveContext()
                }
            }
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder  = "Add a new category"
            textField = alertTextField
        }
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)

    }
    
    private func loadCategories(){
        let request : NSFetchRequest<Category> = Category.fetchRequest()
        do {
            categoryArray = try context.fetch(request)
        } catch {
            print("Error loading categories \(error)")
        }
        tableView.reloadData()
    }
    
    private func saveContext(){
        do {
            try context.save()
        }catch {
            print("Error saving categories \(error)")
        }
        tableView.reloadData()
    }
}
