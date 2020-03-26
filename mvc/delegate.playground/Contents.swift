import UIKit

var str = "Delegate"

protocol RouterDelegate {
    var nameID:[(String, String)] {get set}
    func saveName(name: String, text: String)
}

protocol UsersProtocol {
    var name: String {get set}
    var age: Int {get set}
    
    var delegate: RouterDelegate? {get set}
    
    init(name: String, age: Int, delegate: RouterDelegate?)
}

class Router: RouterDelegate {
    var nameID: [(String, String)] = []
    
    func saveName(name: String, text: String) {
        nameID.append((name, text))
    }
}

class User: UsersProtocol {
    var name: String
    var age: Int
    
    var delegate: RouterDelegate?
    
    func sendMail(name: String, text: String) -> Bool {
        delegate?.saveName(name: name, text: text)
        return true
    }
    
    required init(name: String, age: Int, delegate: RouterDelegate?) {
        self.name = name
        self.age = age
        self.delegate = delegate
    }
}

let routerDelegate = Router()

let user = User(name: "John", age: 23, delegate: routerDelegate)

user.sendMail(name: "Sergei", text: "Hello, Sergey")
user.sendMail(name: "Mama", text: "Hello, Mama")

routerDelegate.nameID
