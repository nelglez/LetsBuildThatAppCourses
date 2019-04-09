//
//  CoursesTableViewController.swift
//  LetsBuildThatAppCourses
//
//  Created by Nelson Gonzalez on 4/9/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import UIKit
import ProgressHUD

class CoursesTableViewController: UITableViewController {
    
    let coursesController = CoursesController()
    
    var courses: [Course] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        loadCourses()
        
    }
    
    func loadCourses() {
        
        ProgressHUD.show("Loading Courses...")
        
        coursesController.fetchCourses { (courses, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            self.courses.append(contentsOf: courses ?? [])
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
                ProgressHUD.showSuccess()
            }
            
        }
    }

    // MARK: - Table view data source

    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return courses.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "coursesCell", for: indexPath) as! CoursesTableViewCell
        
        let course = courses[indexPath.row]
        
        cell.courses = course
        

        return cell
    }
   
   

}
