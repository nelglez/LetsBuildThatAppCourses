//
//  CoursesController.swift
//  LetsBuildThatAppCourses
//
//  Created by Nelson Gonzalez on 4/9/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import Foundation

class CoursesController {
    
    let baseUrl = URL(string: "https://www.letsbuildthatapp.com/courses.json")!
    
    func fetchCourses(completion: @escaping([Course]?, Error?) -> Void) {
        
        URLSession.shared.dataTask(with: baseUrl) { (data, _, error) in
            if let error = error {
                NSLog("Error fetching data :\(error)")
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                completion(nil, error)
                return
            }
            
            
            do {
                let decoder = JSONDecoder()
                
              let courses = try decoder.decode([Course].self, from: data)
                
                completion(courses, nil)
                
            } catch {
                NSLog("Error decoding data")
            }
            
        }.resume()
        
    }
}
