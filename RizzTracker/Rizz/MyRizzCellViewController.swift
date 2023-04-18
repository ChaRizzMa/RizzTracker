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
    
    let query = Rizzults.query()
    var user: PFUser?
    var rizzult: [Rizzults] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var pronoun1 = ""
        var pronoun2 = ""
        var pronoun3 = ""
        
        //var sheBad, sheWant, toTalk, womanTalked, numGot: Int
        
        
        Task {
            do {
                user = try await PFUser.current()
                print("My Rizz: ✅", user ?? "")
                
                fetchData()
                print(rizzult)
                
                let fName = user?.firstName ?? "-1"
                let lName = user?.lastName ?? "-1"
                let object = user?.objectId
                
                var shebad = 0
                var sheWant = 0
                var toTalk = 0
                var talkedTo = 0
                var numGot = 0
                var count = 0
                
                while rizzult == object{
                    shebad += rizzult.badsQuantity ?? 0
                    sheWant += rizzult.wantMeFrFRQuantity ?? 0
                    toTalk += rizzult.goingToTalkToQuantity ?? 0
                    talkedTo += rizzult.howManyTalkedTo ?? 0
                    numGot += rizzult.numberComunications ?? 0
                    count += 1
                    print(count)
                }
                
                let shebads = (shebad)/count
                lblSheBad.text = String(shebad)
              
                
                // TODO: Fix this and connect the labels to the main storyboard file
                lblIntro.text = String("Hello \(fName) \(lName)! Here are Your All Time Rizz Stats:")
                
                let attractionPreferences = user?.attractionPreference ?? "-1"
                
                if attractionPreferences == "He/Him" {
                    pronoun1 = "He"
                    pronoun2 = "Him"
                    pronoun3 = "Men"
                } else if attractionPreferences == "She/Hers" {
                    pronoun1 = "She"
                    pronoun2 = "Her"
                    pronoun3 = "Women"
                } else if attractionPreferences == "They/Them" {
                    pronoun1 = "They"
                    pronoun2 = "Them"
                    pronoun3 = "People"
                }
                
                lblProDamnBad.text = "Damn \(pronoun1.lowercased()) Bad's"
                lblProSheWant.text = "\(pronoun1) Want me fr fr's"
                lblProToTalk.text = "Going to talk to \(pronoun2.lowercased())'s"
                lblProTalkedTo.text = "\(pronoun3) talked to"
                
                let initialRizz = NSString(format: "%.0f", user!.currentRizz ?? "")
                lblInitialRizz.text = String(initialRizz)
                
                lblEmail.text = user!.email ?? ""
                lblPhoneNum.text = user!.phoneNumber ?? ""
                lblPronouns.text = user!.pronouns ?? ""
                lblPref.text = user!.attractionPreference ?? ""
                
            } catch let error {
                print("An error occurred: \(error)")
            }
            
            
        }

        // Do any additional setup after loading the view.
    }
    
    private func fetchData() {
        Task {
            do {
                let data = try await query.findAll()
                DispatchQueue.main.async {
                    self.rizzult = data
                    self.rizzult = self.rizzult.sorted(by: { $0.updatedAt ?? Date.distantPast > $1.updatedAt ?? Date.distantPast })
                }
            } catch let error {
                print("Error: ❌", error)
            }
        }
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

