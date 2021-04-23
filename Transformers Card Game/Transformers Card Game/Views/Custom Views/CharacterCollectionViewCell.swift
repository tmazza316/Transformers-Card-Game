//
//  CharacterCollectionViewCell.swift
//  Transformers Card Game
//
//  Created by Thomas Mazza on 4/22/21.
//

import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {
    
    //Outlets
    
    @IBOutlet weak var characterImageView: UIImageView!
    
    //Properties
    var character: Character? {
        didSet {
            updateView()
        }
    }
    
    //Helper Methods
    func updateView() {
        guard let character = character else {return}
        characterImageView.contentMode = .scaleAspectFit
        characterImageView.image = character.characterImage
    }
    
}
