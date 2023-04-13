//
//  MyRizzCellViewController.swift
//  RizzTracker
//
//  Created by Nicholas de Souza on 4/9/23.
//

import UIKit

class MyRizzCellViewController: UIViewController {
    
    @IBOutlet weak var lblIntro: UILabel!
    @IBOutlet weak var lblOVR: UILabel!
    @IBOutlet weak var lblSheBad: UILabel!
    @IBOutlet weak var lblSheWant: UILabel!
    @IBOutlet weak var lblToTalk: UILabel!
    @IBOutlet weak var lblWomanTalked: UILabel!
    @IBOutlet weak var lblNumGot: UILabel!
    
    @IBOutlet weak var lblProDamnBad: UILabel!
    @IBOutlet weak var lblProSheWant: UILabel!
    @IBOutlet weak var lblProToTalk: UILabel!
    @IBOutlet weak var lblProTalkedTo: UILabel!
    
    @IBOutlet weak var lblSubmittedRizz: UILabel!
    @IBOutlet weak var lblInitialRizz: UILabel!
    
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblPhoneNum: UILabel!
    @IBOutlet weak var lblPronouns: UILabel!
    @IBOutlet weak var lblPref: UILabel!
    
    var user: PFUser!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task {
            do {
                user = try await PFUser.current()
                print(user!)
                
            } catch let error {
                print("an error occurred: \(error)")
            }
        }
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onLogOutTapped(_ sender: Any) {
        Task { @MainActor in
            await showConfirmLogoutAlert()
        }
    }
        
        private func showConfirmLogoutAlert() async {
            do {
                let currentUser = try await PFUser.current()
                let alertController = UIAlertController(title: "Log out of \(currentUser.username ?? "current account")?", message: nil, preferredStyle: .alert)
                let logOutAction = UIAlertAction(title: "Log out", style: .destructive) { _ in
                    NotificationCenter.default.post(name: Notification.Name("logout"), object: nil)
                }
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
                alertController.addAction(logOutAction)
                alertController.addAction(cancelAction)
                present(alertController, animated: true, completion: nil)
            } catch {
                // Handle the error here
                print("Error: \(error.localizedDescription)")
            }
        }

        
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
    }

