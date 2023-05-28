import Foundation

struct FriendData :Hashable {
    let name : String
    let department: String
    let number : String
}
extension FriendData {
    static let list : [FriendData] = [
    
        FriendData(name: "가든", department: "컴공", number: "010-1234"),
        FriendData(name: "니로", department: "정통", number: "010-5678"),
        FriendData(name: "유우", department: "컴공", number: "010-2222"),
        FriendData(name: "유정", department: "미콘", number: "010-3333"),
        FriendData(name: "예니", department: "미콘", number: "010-9999"),
      
    ]
}
