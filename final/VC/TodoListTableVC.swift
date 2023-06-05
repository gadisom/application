
import UIKit

class TodoListTableVC: UITableViewController {

    var dolist : [TodoList] = TodoList.list
    
    @IBOutlet var todoListView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        todoListView.delegate = self
        todoListView.dataSource = self
    }
//    override func numberOfSections(in tableView: UITableView) -> Int {
//
//        return 1
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = todoListView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
//        cell.titleLabel.text = "d"
//        cell.contentLabel.text = "ddd"
//
//        return cell
//    }
    
}
extension TodoListTableVC {
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 10
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = todoListView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.titleLabel.text = "\(indexPath.row)"
      

        return cell
    }
}
