//
//  detailedMemeViewController.swift
//  MemeMe1
//
//  Created by Norah Almaneea on 12/01/2021.
//

import UIKit

class detailedMemeViewController: UIViewController {
    
    @IBOutlet weak var detailedMeme: UIImageView!
    var meme : Meme!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        detailedMeme.image = meme.memedImage
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
}

