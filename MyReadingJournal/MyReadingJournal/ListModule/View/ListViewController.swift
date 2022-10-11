//
//  ListViewController.swift
//  MyReadingJournal
//
//  Created by Олеся Егорова on 11.10.2022.
//

import UIKit

final class ListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tabBar: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My Reading Journal"
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    @IBAction func openMenu(_ sender: UIBarButtonItem) {
    }
    @IBAction func startSearch(_ sender: UIBarButtonItem) {
    }
    @IBAction func startSort(_ sender: UIBarButtonItem) {
    }
    
    
}

//UITableViewDelegate, UITableViewDataSource
extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
}
