//
//  ViewController.swift
//  Musique
//
//  Created by Tish Faroul on 8/8/22.
//


import UIKit



class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    
    @IBOutlet var table: UITableView!
    

    var songs = [Song]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSongs()
        table.delegate = self
        table.dataSource = self
    }

    
    func configureSongs(){
        songs.append(Song(name: "SongOne", albumName: "AlbumOne", artistName: "ArtistOne", imgName: "Cover", track: "lofi-study"))
        
        songs.append(Song(name: "SongTwo", albumName: "AlbumTwo", artistName: "ArtistTwo", imgName: "Cover2", track: "lofi-study"))
    }
    
    //Table
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let song = songs[indexPath.row]
        
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.albumName
        cell.accessoryType = .disclosureIndicator
        cell.imageView?.image = UIImage(named: song.imgName)
        cell.textLabel?.font = UIFont(name: "Arial-Bold", size: 18)
        cell.detailTextLabel?.font = UIFont(name: "Arial", size: 12)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //present the player
        let position = indexPath.row
        //songs
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "player") else {
            return
        }
        present(vc, animated: true)
    }
    
    

}



struct Song {
    let name: String
    let albumName: String
    let artistName: String
    let imgName: String
    let track: String
}
