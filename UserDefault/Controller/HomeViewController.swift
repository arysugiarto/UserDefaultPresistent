//
//  HomeViewController.swift
//  UserDefault
//
//  Created by Ary Sugiarto on 09/02/23.
//

import UIKit

class HomeViewController: UIViewController {


    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!

    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var profesionLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        ProfileModel.synchronize()
        nameLabel.text = "\(ProfileModel.name)"
        profesionLabel.text = "\(ProfileModel.profesion)"
        emailLabel.text = "\(ProfileModel.email)"
    }
    
    @IBAction func editAction(_ sender: Any) {
        self.performSegue(withIdentifier: "moveToEdit", sender: self)
    }
    
    
    @IBAction func resetAction(_ sender: Any) {
        if ProfileModel.deleteAll() {
                    self.performSegue(withIdentifier: "moveToCreate", sender: self)
                }
    }
    
}
