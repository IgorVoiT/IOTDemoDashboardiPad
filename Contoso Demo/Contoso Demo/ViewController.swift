//
//  ViewController.swift
//  Contoso Demo
//
//  Created by Игорь on 18.0220..
//  Copyright © 2020 VT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    @IBOutlet weak var countryDropdown: DropDown!
    @IBOutlet weak var makeDropdown: DropDown!
    @IBOutlet weak var modelDropdown: DropDown!
    @IBOutlet weak var equipmentDropdown: DropDown!
    
    // MARK: - Properties
    
    private var countryOptions = ["USA", "Japan", "Germany"]
    private var USMake = ["Ford", "Dodge"]
    private var japanMake = ["Toyota", "Lexus"]
    private var germanMake = ["BMW", "Audi"]
    
    private var fordModels = ["Edge", "Focus"]
    private var dodgeModels = ["RAM", "Challenger"]
    private var toyotaModels = ["Camry", "Prius"]
    private var lexusModels = ["LS", "RX"]
    private var bmwModels = ["525", "650"]
    private var audiModels = ["A8 Sport", "A6 Quattro"]
    
    private var equipmentOptions = ["Basic", "Standard", "Full-Pack"]
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Methods

    private func setupView() {
        equipmentDropdown.optionArray = equipmentOptions
        countryDropdown.optionArray = countryOptions
        makeDropdown.optionArray = []
        modelDropdown.optionArray = []
        
        countryDropdown.didSelect { (text, index, _) in
            self.modelDropdown.optionArray = []
            switch index {
            case 0:
                self.makeDropdown.optionArray = self.USMake
            case 1:
                self.makeDropdown.optionArray = self.japanMake
            case 2:
                self.makeDropdown.optionArray = self.germanMake
            default:
                break
            }
        }
        
        makeDropdown.didSelect { (text, index, _) in
            if let countryIndex = self.countryDropdown.selectedIndex {
                switch (countryIndex, index) {
                case (0,0):
                    self.modelDropdown.optionArray = self.fordModels
                case (0,1):
                    self.modelDropdown.optionArray = self.dodgeModels
                case (1,0):
                    self.modelDropdown.optionArray = self.toyotaModels
                case (1,1):
                    self.modelDropdown.optionArray = self.lexusModels
                case (2,0):
                    self.modelDropdown.optionArray = self.bmwModels
                case (2,1):
                    self.modelDropdown.optionArray = self.audiModels
                default:
                    break
                }
                
            }
            
        }
        
        
        
    }

}

// MARK: - Collection View

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let randomInt = Int.random(in: 10 ..< 15)
        return randomInt
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DeviceCell", for: indexPath) as! DeviceCell
        cell.deviceLabel.text = "IOT Device \(indexPath.row + 1)"
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.bounds.height - 16.0
        let width = UIScreen.main.bounds.width / 3.0
        return CGSize(width: width, height: height)
    }
    
}
