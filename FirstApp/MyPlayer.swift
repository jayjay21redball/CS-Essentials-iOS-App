//
//  MyPlayer.swift
//  FirstApp
//
//  Created by altop on 16.05.2018.
//  Copyright © 2018 cs.essentials. All rights reserved.
//

import UIKit
import MediaPlayer

class MyPlayer: UIViewController {
    
    var musicPlayer = MPMusicPlayerController.applicationMusicPlayer
    var selectedGenre = ""

    @IBOutlet var songLabel: UILabel!
    @IBOutlet var artistLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        MPMediaLibrary.requestAuthorization { (status) in
            if status == .authorized {
                DispatchQueue.main.async {
                    self.playGenre(genre: self.selectedGenre)
                }
            }
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        musicPlayer.stop()
    }
    
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        musicPlayer.stop()
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        musicPlayer.skipToNextItem()
        
        let nowPlaying = musicPlayer.nowPlayingItem
        artistLabel.text = nowPlaying?.albumArtist
        songLabel.text = nowPlaying?.title
    }
    
    func playGenre(genre: String) {
        musicPlayer.stop()
        
        let query = MPMediaQuery()
        let predicate = MPMediaPropertyPredicate(value: genre, forProperty: MPMediaItemPropertyGenre)
        
        query.addFilterPredicate(predicate)
        
        musicPlayer.setQueue(with: query)
        musicPlayer.shuffleMode = .songs
        musicPlayer.play()
        
        let nowPlaying = musicPlayer.nowPlayingItem
        artistLabel.text = nowPlaying?.albumArtist
        songLabel.text = nowPlaying?.title
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
