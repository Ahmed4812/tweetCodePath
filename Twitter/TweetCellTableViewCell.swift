//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Ali Ahmed Khan on 3/12/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {

    @IBOutlet weak var tweetContentLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var favButton: UIButton!
    
    @IBAction func onFavTweet(_ sender: Any) {
        let toBeFav = !favorite
        if (toBeFav){
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(true)
            }, failure: {
                (error) in
                print("fav didn't work \(error)")
            })
        }else{
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(false)
            }, failure: {
                (error) in
                print("fav didn't work \(error)")
            })
            
        }
    }
    var favorite:Bool = false
    var tweetId: Int = -1
    func setFavorite(_ isfavorite:Bool){
        favorite = isfavorite
        if (favorite){
            favButton.setImage(UIImage(named: "favor-icon-1"), for: UIControl.State.normal)
        }else{
            favButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
