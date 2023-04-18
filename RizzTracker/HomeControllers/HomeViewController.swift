//
//  HomeViewController.swift
//  RizzTracker
//
//  Created by Daniel Ruiz on 4/18/23.
//
import UIKit
import ParseSwift

class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let query = Rizzults.query()
    var rizzults: [Rizzults] = []
    
    var overalls: [String] = []
    
    let refreshControl = UIRefreshControl()
    
    var isRefreshing = false // Track if refresh is in progress
    let refreshInterval: TimeInterval = 5 // Refresh interval in seconds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        tableView.refreshControl = refreshControl
        
        fetchData()
    }
    
    @objc private func refreshData() {
        if !isRefreshing {
            isRefreshing = true
            fetchData()
            DispatchQueue.main.asyncAfter(deadline: .now() + refreshInterval) {
                self.isRefreshing = false
            }
        }
    }
    
    private func fetchData() {
        Task {
            do {
                let data = try await query.findAll()
                DispatchQueue.main.async {
                    self.rizzults = data
                    self.rizzults = self.rizzults.sorted(by: { $0.updatedAt ?? Date.distantPast > $1.updatedAt ?? Date.distantPast })
                    self.tableView.reloadData()
                    self.refreshControl.endRefreshing()
                }
            } catch let error {
                print("Error: ❌", error)
                self.refreshControl.endRefreshing()
            }
        }
    }
}

extension HomeViewController: UITableViewDelegate {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier == "DetailViewSegue", let destination = segue.destination as? DetailViewController, let index = tableView.indexPathForSelectedRow?.item {
            destination.rizzult = rizzults[index]
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "DetailViewSegue", sender: (Any).self)
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rizzults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! UserTableViewCell
        let index = indexPath.item
        
        cell.ownerOverall = rizzults[index].ownerRizz ?? -1
        cell.overallNameLabel.text = String(rizzults[index].ownerRizz ?? -1) + " OVR"
        cell.userNameLabel.text = String( rizzults[index].owner ?? String(-1))
        let ownerOverall = rizzults[index].ownerRizz ?? -1
        
        if case -1...50 = ownerOverall {
            cell.overallNameLabel.textColor = UIColor.red
            cell.overallNameLabel.font = UIFont.boldSystemFont(ofSize: 17)
        } else if case 51...70 = ownerOverall {
            cell.overallNameLabel.textColor = UIColor.orange
            cell.overallNameLabel.font = UIFont.boldSystemFont(ofSize: 17)
        } else if case 71...80 = ownerOverall {
            cell.overallNameLabel.textColor = UIColor(red: 0/255, green: 204/255, blue: 0/255, alpha: 1)
            cell.overallNameLabel.font = UIFont.boldSystemFont(ofSize: 17)
       

        } else if case 81...100 = ownerOverall {
            cell.overallNameLabel.textColor = UIColor(red: 0/255, green: 204/255, blue: 0/255, alpha: 1)
            cell.overallNameLabel.font = UIFont.boldSystemFont(ofSize: 17)
        }
        return cell
    }
}
