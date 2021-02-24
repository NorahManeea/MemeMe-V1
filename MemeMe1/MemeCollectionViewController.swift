//
//  MemeCollectionViewController.swift
//  MemeMe1
//
//  Created by Norah Almaneea on 12/01/2021.
//

import UIKit



class MemeCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    @IBOutlet var sentMemesCollectionView: UICollectionView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!

    override func viewDidLoad() {
        super.viewDidLoad()
  
        // Register cell classes
       

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.viewDidLoad()
        sentMemesCollectionView!.reloadData()
    }

    @IBAction func addMeme(_ sender: Any) {
        let genreateMemeController = self.storyboard!.instantiateViewController(withIdentifier: "MemeMeViewController") as! MemeMeViewController
        
        // Present the view controller using navigation
        navigationController!.pushViewController(genreateMemeController, animated: true)
    }

    // MARK: UICollectionViewDataSource



    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MemesCollectionCell", for: indexPath) as! MemeCollectionViewCell
        let memes = self.memes[(indexPath as NSIndexPath).row]

        // Set the image
        cell.memeImage.image = memes.memedImage
        
        return cell

    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailedMemeController = self.storyboard!.instantiateViewController(withIdentifier: "detailedMemeViewController") as! detailedMemeViewController
        
        //Populate view controller with data from the selected item
        detailedMemeController.meme = memes[(indexPath as NSIndexPath).row]
        
        // Present the view controller using navigation
        navigationController!.pushViewController(detailedMemeController, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // resize the cell
        return CGSize(width: (view.frame.size.width - (2 * 6)) / 3.0, height: (view.frame.size.width - (2 * 6)) / 3.0)
    }
    
}
