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
                var fName = user!.firstName
                var lName = user!.lastName
                lblIntro.text = String("Hello \(fName ?? "Default Value") \(lName ?? "Default Value")! Here are Your All Time Rizz Stats:")
                //lblOVR.text =
                var pronoun1 = ""
                var pronoun2 = ""
                var pronoun3 = ""
                if user?.attractionPreference == "He/Him" {
                    pronoun1 = "He"
                    pronoun2 = "Him"
                    pronoun3 = "Men"
                } else if user?.attractionPreference == "She/Hers" {
                    pronoun1 = "She"
                    pronoun2 = "Her"
                    pronoun3 = "Women"
                } else {
                    pronoun1 = "They"
                    pronoun2 = "Them"
                    pronoun3 = "People"
                }
                //lblSheBad.text =
                lblProDamnBad.text = "Damn \(pronoun1) Bad's"
                //lblSheWant.text =
                lblProSheWant.text = "\(pronoun1) Want me fr fr's"
                //lblToTalk.text =
                lblProToTalk.text = "Going to talk to \(pronoun2)'s"
                //lblWomanTalked.text =
                lblProTalkedTo.text = "\(pronoun3) talked to"
                //lblNumGot.text =
                
                //lblSubmittedRizz.text =
                var initialRizz = NSString(format: "%.0f", user!.initialRizz ?? "")
                lblInitialRizz.text = String(initialRizz)
                
                lblEmail.text = user!.email ?? ""
                lblPhoneNum.text = user!.phoneNumber ?? ""
                lblPronouns.text = user!.pronouns ?? ""
                lblPref.text = user!.attractionPreference ?? ""
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

