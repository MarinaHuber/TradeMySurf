//
//  DetailViewController.swift
//  TradeMySurf
//
//  Created by Marina Huber on 1/31/20.
//  Copyright © 2020 Marina Huber. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, StoryboardProtocol {
    
    @IBOutlet weak var boardImageView: UIImageView!
    var selectedImageBoard: String?
    
    override func viewDidLoad() {
           super.viewDidLoad()

       }
       // MARK: - Data load
       
    private func loadSelectedBoard(name: String) {
        guard
            name == selectedImageBoard,
            name.isEmpty == false
            else {  return }
        
    }
    
    func fillWithData(_ data: Surfboard) {
        //            levelLabel.text = data.leve
        //            volumeLabel.text = data.volume
        //            weightLabel.text = "\(data.weight) kg"
        boardImageView.image = UIImage(named: data.imageName)
    }
    }

