//
//  FeedCell.swift
//  FirebaseInstaClone
//
//  Created by Vedat Dokuzkardeş on 20.11.2023.
//

import UIKit
import Firebase

class FeedCell: UITableViewCell {
    @IBOutlet weak var documentIdLabel: UILabel!
    
    @IBOutlet weak var userEmail: UILabel!
    
    @IBOutlet weak var likeLabel: UILabel!
    
    @IBOutlet weak var userImageview: UIImageView!
    
    @IBOutlet weak var userComment: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

  
    }

    @IBAction func likeBtn(_ sender: Any) {
        
        let fireStoreDatabase = Firestore.firestore()
        
        if let likeCount = Int(likeLabel.text!){
            
            let likeStore = ["likes": likeCount + 1] as [String : Any]
            
            fireStoreDatabase.collection("Posts").document(documentIdLabel.text!).setData(likeStore, merge: true)
        }
        
        
    }
    
}
