//
//  CardCollectionViewController.swift
//  Transformers Card Game
//
//  Created by Thomas Mazza on 4/22/21.
//

import UIKit

class CardCollectionViewController: UICollectionViewController {
    
    //Properties
    var displayedCharacters: [Character] = []
    var targetedCharacter: Character?
    var selectedFaction = ""
    
    //Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        shuffleCharacters(faction: selectedFaction)
    }
    //Helper Methods
    func shuffleCharacters(faction: String) {
        if faction == "autobots" {
            let shuffledAutobots = CharacterController.autobots.shuffled()
            let autobotsGroup = shuffledAutobots.prefix(3)
            displayedCharacters = Array(autobotsGroup)
            targetedCharacter = CharacterController.decepticons.randomElement()
        } else {
            let shuffleDecepticonGroup = CharacterController.decepticons.shuffled()
            let decepticonGroup = CharacterController.decepticons.prefix(3)
            displayedCharacters = Array(decepticonGroup)
            targetedCharacter = CharacterController.autobots.randomElement()
        }
    updateViews()
    }
    func updateViews() {
        guard let character = targetedCharacter else {return}
        displayedCharacters.append(character)
        displayedCharacters.shuffle()
        self.title = "Find \(character.characterName)"
        collectionView.reloadData()
    }
    
    func newCharacterGroupAlert(character: Character) {
        let success = character == targetedCharacter
        let alertController = UIAlertController(title: success ? "Correct!" :  "Sorry try again", message: nil, preferredStyle: .alert)
        let doneAction = UIAlertAction(title: "Done", style: .cancel)
        let shuffleAction = UIAlertAction(title: "Shuffle", style: .default) { (_) in
            self.shuffleCharacters(faction: self.selectedFaction)
        }
        
        alertController.addAction(doneAction)
        if success {
            alertController.addAction(shuffleAction)
        }
        
        present(alertController, animated: true)
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toFilterVC" {
            guard let destination = segue.destination as? ChoiceViewController else {return}
            destination.delegate = self
            
        }
 
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return displayedCharacters.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "characterCell", for: indexPath) as? CharacterCollectionViewCell else {return UICollectionViewCell()}
        
        let character = CharacterController.autobots[indexPath.row]
        
        cell.character = character
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //present alert
        let character = displayedCharacters[indexPath.row]
        newCharacterGroupAlert(character: character)
    }

}// End of class

extension  CardCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = view.frame.width / 2
        return CGSize(width: width - 20, height: width + 30)
        }
} // end of extension

extension CardCollectionViewController: ChoiceSelectionDelegate {
    func factionWasSelected(faction: String) {
        selectedFaction = faction
        shuffleCharacters(faction: faction)
    }
}
