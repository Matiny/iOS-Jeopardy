//
//  ViewController.swift
//  Jeopardy
//
//  Created by Matiny L on 6/1/20.
//  Copyright © 2020 Matiny L. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var resultArray: [OneQuestion] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* State the URL */
        
        performRequest(urlString: "http://jservice.io/api/clues")
        
        /* Collection view setup */
    }
    
    func parseJSON(jeopardyData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode([OneQuestion].self, from: jeopardyData)
            let jeopardyArray = decodedData
            
            DispatchQueue.main.async {
                self.resultArray = jeopardyArray
                
            /* Collection view reload */
//                self.tableItems.reloadData()
                print(self.resultArray)
            }
            
        } catch {
            print(error)
        }
    }
    
    func performRequest(urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                /* Unwrap the data to be parsed here! */
                if let safeData = data {
                    self.parseJSON(jeopardyData: safeData)
                }
            }
            
            task.resume()
        }
    }
    
    
}

