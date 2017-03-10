//
//  HHSearchViewController.swift
//  VManga
//
//  Created by mac on 3/10/17.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit

class HHSearchViewController: UIViewController , UITableViewDelegate , UITableViewDataSource, UISearchBarDelegate {

 
    @IBOutlet var Sview: HHSearchViews!
    
    var searchActive : Bool = false
    var recentSearchBooks : [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        Sview.searchText.delegate = self
        Sview.tableview.delegate = self
        Sview.tableview.dataSource = self
        
        let castNib = UINib(nibName: "HHRecentSearchBookTableViewCell", bundle: nil)
        self.Sview.tableview.register(castNib, forCellReuseIdentifier: "HHRecentSearchBookTableViewCell")
        
        recentSearchBooks.append("abc")
        recentSearchBooks.append("xyz")
        UserDefaults.standard.setValue(self.recentSearchBooks, forKey: "favoriteMovies")

        enter()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func enter()  {
        if (UserDefaults.standard.object(forKey: "recentSearchBooks") != nil) {
            self.recentSearchBooks = UserDefaults.standard.object(forKey: "recentSearchBooks") as! [String]
        }
    }
    
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false
    }

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true;
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recentSearchBooks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.Sview.tableview.dequeueReusableCell(withIdentifier: "HHRecentSearchBookTableViewCell") as! HHRecentSearchBookTableViewCell
        cell.bookName.text = recentSearchBooks[indexPath.row]
        return cell
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
