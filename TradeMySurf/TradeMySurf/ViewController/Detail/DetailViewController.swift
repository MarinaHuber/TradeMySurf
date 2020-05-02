//
//  DetailViewController.swift
//  TradeMySurf
//
//  Created by Marina Huber on 1/31/20.
//  Copyright © 2020 Marina Huber. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, StoryboardProtocol {
    
    
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet var volumeLabel: UILabel!
    @IBOutlet var weightLabel: UILabel!
    
    @IBOutlet weak var boardImageView: UIImageView!
    var selectedImageName: String?
    var surfBoardData: Surfboard?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSelectedBoard()

    }
    
    // MARK: - Pass data static
    
    private func loadSelectedBoard() {
        guard
            surfBoardData != nil
            else {  return }
        boardImageView.image = UIImage(named: surfBoardData?.imageName ?? "")
        levelLabel.text = surfBoardData?.level
        volumeLabel.text = surfBoardData?.volume
        weightLabel.text = "\(surfBoardData?.weight ?? "") kg"

        
    }
    
}

