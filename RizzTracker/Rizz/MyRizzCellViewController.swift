//
//  MyRizzCellViewController.swift
//  RizzTracker
//
//  Created by Nicholas de Souza on 4/9/23.
//

import UIKit

class MyRizzCellViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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

