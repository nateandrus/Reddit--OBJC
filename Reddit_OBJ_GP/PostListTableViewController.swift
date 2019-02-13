//
//  PostListTableViewController.swift
//  Reddit_OBJ_GP
//
//  Created by Nathan Andrus on 2/13/19.
//  Copyright © 2019 Nathan Andrus. All rights reserved.
//

import UIKit

class PostListTableViewController: UITableViewController {

    @IBOutlet weak var redditSearchBar: UISearchBar!
    
    var postsFromSearch: [DVMPost]? {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redditSearchBar.delegate = self
        
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postsFromSearch?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as? PostTableViewCell
        let post = postsFromSearch?[indexPath.row]
        cell?.postLandingPad = post
        return cell ?? UITableViewCell()
    }
    
}

extension PostListTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        DVMPostController.shared()?.fetchPost(withSearchTerm: searchText, completion: { (post, error) in
            if let error = error {
                print("Error retreiving data for search term: \(error.localizedDescription)")
            }
            self.postsFromSearch = post
        })
    }
}
