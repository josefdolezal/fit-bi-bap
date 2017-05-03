import RealmSwift

let realm = try! Realm()

try! realm.write {
    let printer = Printer()

    realm.add(printer)
}
