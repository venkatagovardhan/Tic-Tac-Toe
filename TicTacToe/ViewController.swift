//
//  ViewController.swift
//  TicTacToe
//
//  Created by venkatagovardhan on 8/6/17.
//  Copyright © 2017 venkatagovardhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var infoLabel: UILabel!
    
    var activePlayer = 1
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var isGameActive = true
    
    
    // MARK:- View Life Cycle  Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK:- Button Action Methods
    
    @IBAction func buttonAction(_ sender: UIButton) {
        let imageView = view.viewWithTag(10 + sender.tag) as? UIImageView
        let button = view.viewWithTag(sender.tag) as? UIButton
        button?.isEnabled = false
        
        if (gameState[sender.tag-1] == 0 && isGameActive == true)
        {
            gameState[sender.tag-1] = activePlayer
            
            if (activePlayer == 1)
            {
                imageView?.image = UIImage(named: "cross")
                activePlayer = 2
            }
            else
            {
                imageView?.image = UIImage(named: "circle")
                activePlayer = 1
            }
        }
        
        for combination in winningCombinations
        {
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]
            {
                isGameActive = false
                
                if gameState[combination[0]] == 1
                {
                    infoLabel.text = "Player 1 wins the game"
                    showAlert("Player 1 wins the game")
                }
                else
                {
                    infoLabel.text = "Player 2 wins the game"
                    showAlert("Player 2 wins the game")
                }
                
            }
        }
        
        isGameActive = false
        
        for i in gameState
        {
            if i == 0
            {
                isGameActive = true
                break
            }
        }
        
        if isGameActive == false
        {
            infoLabel.text = "Match is draw"
            showAlert("Match is draw")
            
        }
        
        
    }
    
    
    
    // MARK:- Custom Methods
    
    func resetTheGame()  {
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        isGameActive = true
        activePlayer = 1
        
        infoLabel.text = "Tic Tac Toe"
        
        for i in 1...9
        {
            let button = view.viewWithTag(i) as! UIButton
            button.isEnabled = true
            let imageView = view.viewWithTag(10 + i) as? UIImageView
            imageView?.image = nil
        }
    }
    
    func showAlert(_ message : String)  {
        let alertController = UIAlertController(title: title, message: message, preferredStyle:UIAlertControllerStyle.alert)
        
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default)
        { action -> Void in
            self.resetTheGame()
        })
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    
    
}

