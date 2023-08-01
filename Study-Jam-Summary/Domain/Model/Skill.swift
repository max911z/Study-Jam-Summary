import Foundation

struct Skill {
    var id: String
    var title: String
    
    init() {
        id = String()
        title = String()
    }
    
    init(
        id: String,
        title: String
    ) {
        self.id = id
        self.title = title
    }
}
