//
//  SubgenreSelector.swift
//  FirstApp
//
//  Created by altop on 16.05.2018.
//  Copyright © 2018 cs.essentials. All rights reserved.
//

import UIKit

class SubgenreSelector: UITableViewController {
    
    var selectedGenre: String = ""
    let subgenres = ["Pop": ["Adult Contemporary", "Britpop", "Pop/Rock", "Soft Rock", "Teen Pop", "J-Pop", "K-Pop"],
                     "Soundtrack": ["Foreign Cinema", "Musicals", "Original Score", "Soundtrack", "TV Soundtrack"],
                     "Dance": ["Breakbeat", "Exercise", "Garage", "Hardcore", "House", "Jungle/Drum’n’bass", "Techno", "Trance"],
                     "Hip-Hop/Rap": ["Alternative Rap", "Dirty South", "East Coast Rap", "Gangsta Rap", "Hardcore Rap", "Hip-Hop", "Latin Rap", "Old School Rap", "Rap", "Underground Rap", "West Coast Rap"],
                     "Alternative": ["College Rock", "Goth Rock", "Grunge", "Indie Rock", "New Wave", "Punk"],
                     "Rock": ["American Trad Rock", "Blues-Rock", "British Invasion", "Death Metal/Black Metal", "Hard Rock", "Metal", "Psychedelic", "Rock & Roll", "Southern Rock"],
                     "Reggae": ["Dancehall", "Roots Reggae", "Dub", "Ska"]]

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
        return (subgenres[selectedGenre]?.count)!
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "subgenre", for: indexPath)

        let genre = subgenres[selectedGenre]![indexPath.row]
        cell.textLabel?.text = genre

        return cell
    }
 

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedGenre = subgenres[selectedGenre]![indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "playGenre", sender: self)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "playGenre" {
            let vc: MyPlayer = segue.destination as! MyPlayer
            vc.selectedGenre = selectedGenre
        }
    }
 

}
