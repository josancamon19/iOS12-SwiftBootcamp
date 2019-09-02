//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Joan Cabezas on 9/2/19.
//  Copyright © 2019 josancamon19. All rights reserved.
//

import UIKit
import CoreData
import RealmSwift

class CategoryViewController: UITableViewController {
    
    var categories : Results<Category>?
    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadCategories()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCategoryCell", for: indexPath)
        cell.textLabel?.text = categories?[indexPath.row].name ?? "No Categories added yet"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToItems" {
            let todoListViewController = segue.destination as! TodoListViewController
            if let indexSelected = tableView.indexPathForSelectedRow?.row {
                todoListViewController.selectedCategory = categories?[indexSelected]
            }
        }
    }

    @IBAction func addCategoryButtonPressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add a new Todoey category", message: "", preferredStyle: .alert)
        var textField = UITextField()
        
        let action = UIAlertAction(title: "Add Category", style: .default) { (action) in
            if let newCategory = textField.text {
                if newCategory.isEmpty == false {
                    let categoryToAdd = Category()
                    categoryToAdd.name = newCategory
                    self.saveCategory(category: categoryToAdd)
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
        categories = realm.objects(Category.self)
        tableView.reloadData()
    }
    
    private func saveCategory( category : Category){
        do {
            try realm.write {
                realm.add(category)
            }
        }catch {
            print("Error saving categories \(error)")
        }
        tableView.reloadData()
    }
}
