//
//  GenreSelector.swift
//  FirstApp
//
//  Created by altop on 16.05.2018.
//  Copyright © 2018 cs.essentials. All rights reserved.
//

import UIKit

class GenreSelector: UITableViewController {
    
    let genres = ["Pop", "Soundtrack", "Dance", "Hip-Hop/Rap", "Alternative", "Rock", "Reggae"]
    var selected = ""

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return genres.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "genre", for: indexPath)

        let genre = genres[indexPath.row]
        cell.textLabel?.text = genre

        return cell
    }
 

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selected = genres[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "showSubGenre", sender: self)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "showSubGenre" {
            let vc: SubgenreSelector = segue.destination as! SubgenreSelector
            vc.selectedGenre = selected
        }
        
    }
    

}
