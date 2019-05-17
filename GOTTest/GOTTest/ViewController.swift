//
//  ViewController.swift
//  GOTTest
//
//  Created by Mac Consultant on 5/17/19.
//  Copyright © 2019 Mac Consultant. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    //var GOTdata = GOT()

    let url: URL = URL(string: "https://api.tvmaze.com/shows/82?embed=seasons&embed=episodes")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getJSON()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    func getJSON(){
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, _, _) in
            let jsondata = try? JSONSerialization.jsonObject(with: data!, options: [])
            if let GOTdata = jsondata as? [String: Any]{
                //let GOTdata = jsondata(Dictionary: jsondata)
                //print(jsondata)
                print(GOTdata)
            }
        })
            task.resume()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //print(GOTdata._embedded.episodes[indexPath.row].episodeName)
        //print(GOTdata._embedded.episodes)
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        //cell.textLabel?.text = GOTdata._embedded.episodes[indexPath.row].episodeName
        //cell.detailTextLabel?.text = String(GOTdata._embedded.episodes[indexPath.row].season)
        return cell
    }
}

//extension ViewController: UITableViewDelegate{
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let storyboard = UIStoryboard(name: "main", bundle: nil)
//    }
//
//}

class cellView: UITableViewCell{
    
    
}
