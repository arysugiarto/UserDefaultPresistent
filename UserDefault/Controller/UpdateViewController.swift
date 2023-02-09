//
//  UpdateViewController.swift
//  UserDefault
//
//  Created by Ary Sugiarto on 09/02/23.
//

import UIKit

class UpdateViewController: UIViewController {


    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var nameLabel: UITextField!
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var emailLabel: UITextField!
    
    @IBOutlet weak var profesionLabel: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
            ProfileModel.synchronize()
            nameLabel.text = ProfileModel.name
            emailLabel.text = ProfileModel.email
            profesionLabel.text = ProfileModel.profesion
        }
     
     
        @IBAction func cancelUpdate(_ sender: Any) {
            self.dismiss(animated: true)
        }
        
    @IBAction func saveAction(_ sender: Any) {
        if let name = nameLabel.text, let email = emailLabel.text, let profession = profesionLabel.text {
            if name.isEmpty {
                textEmpty("Name")
            } else if email.isEmpty {
                textEmpty("Email")
            } else if profession.isEmpty {
                textEmpty("Profession")
            } else {
                saveProfil(name, email, profession)
                
                self.dismiss(animated: true)
            }
        }
    }
    func saveProfil(_ name: String, _ email: String, _ profession: String) {
            ProfileModel.stateLogin = true
            ProfileModel.name = name
            ProfileModel.email = email
            ProfileModel.profesion = profession
        }
        
        func textEmpty(_ field: String) {
            let alert = UIAlertController(
                title: "Alert",
                message: "\(field) is empty",
                preferredStyle: UIAlertController.Style.alert
            )
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    


