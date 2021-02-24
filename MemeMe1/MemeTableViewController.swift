//
//  MemeTableViewController.swift
//  MemeMe1
//
//  Created by Norah Almaneea on 12/01/2021.
//

import UIKit

class MemeTableViewController: UITableViewController{
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }

    @IBOutlet weak var sentMemesTableVie: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
        self.viewDidLoad()
        sentMemesTableVie.reloadData()
    }
    @IBAction func addMeme(_ sender: Any) {
        let genreateMemeController = self.storyboard!.instantiateViewController(withIdentifier: "MemeMeViewController") as! MemeMeViewController
        
        // Present the view controller using navigation
        navigationController!.pushViewController(genreateMemeController, animated: true)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the number of rows
        return memes.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "SentMemesCell") as! MemeTableViewCell
        let memes = self.memes[(indexPath as NSIndexPath).row]
        
        // Set the image and label
        cell.memesImageView.image = memes.memedImage
        cell.memesLabel.text = memes.textFieldTop + " " + memes.textFieldBottom

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailedMemeController = self.storyboard!.instantiateViewController(withIdentifier: "detailedMemeViewController") as! detailedMemeViewController
        
        //Populate view controller with data from the selected item
        detailedMemeController.meme = memes[(indexPath as NSIndexPath).row]
        
        // Present the view controller using navigation
        navigationController!.pushViewController(detailedMemeController, animated: true)
    }
}
