
import UIKit

class TodoListVC: UIViewController {
    var list : [TodoList] = TodoList.list
    var selectedIndexPaths = Set<IndexPath>()
    @IBAction func doneButtonTap(_ sender: Any) {
        //self.navigationItem.leftBarButtonItem = editButton
        tableView.setEditing(false, animated: true)
    }
    @IBAction func editButtonAction(_ sender: Any) {
        guard !list.isEmpty else {
            return
        }
        tableView.setEditing(true, animated: true)
    }
    
    func saveAllData() {
        let data = list.map {
            [
            "content":$0.content,
            "isComplete":$0.isComplete
            ]
            
        }
        let userDefaults = UserDefaults.standard
                userDefaults.set(data, forKey: "items") // 키, value 설정
                userDefaults.synchronize()
    }
    func loadAllData() {
            let userDefaults = UserDefaults.standard
            guard let data = userDefaults.object(forKey: "items") as? [[String: AnyObject]] else {
                return
            }
    

            list = data.map {
                let content = $0["content"] as? String
                let isComplete = $0["isComplete"] as? Bool
                
                return TodoList(content: content!, isComplete: isComplete!)
            }
        }
    @IBAction func updateList(_ sender: Any) {
        let content = textField.text!
        let item: TodoList = TodoList(content: content)
        list.append(item)
        self.navigationController?.popViewController(animated: true)
        tableView.reloadData()
        textField.text = ""
        saveAllData()
    }
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var dateTime: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.settingTime()
        loadAllData()
        let contactsCell = UINib(nibName: "TableViewCell", bundle: nil)
        self.tableView.register(contactsCell, forCellReuseIdentifier: "TableViewCell")
        
    }

    override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            saveAllData()
            tableView.reloadData()
        }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        list.remove(at: indexPath.row)
        saveAllData()
        tableView.reloadData()
    }
    
    func settingTime()
    {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        dateTime.text = formatter.string(from: Date())
    }
}
extension TodoListVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(list.count)
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        let contactData : TodoList = list[indexPath.row]
        cell.content.text = contactData.content
        
        if selectedIndexPaths.contains(indexPath) {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        let cell = tableView.cellForRow(at: indexPath)
        if selectedIndexPaths.contains(indexPath) {
            selectedIndexPaths.remove(indexPath)
            cell?.accessoryType = .none
            
        } else {
            selectedIndexPaths.insert(indexPath)
            cell?.accessoryType = .checkmark
            
        }
        tableView.reloadData()
        
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        // 선택 해제된 셀의 체크마크 제거 및 글자색 변경
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .none
                
        // 선택 해제된 셀의 처리를 수행 (예: 다른 동작 수행, 데이터 업데이트 등)
        // ...
    }
    
    
}
