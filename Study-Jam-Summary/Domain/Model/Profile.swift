struct Profile {
    let name: String
    let shortDescription: String
    let description: String
    let place: String
    
    init() {
        name = String()
        shortDescription = String()
        description = String()
        place = String()
    }
    
    init(
        name: String,
        shortDescription: String,
        description: String,
        place: String
    ) {
        self.name = name
        self.shortDescription = shortDescription
        self.description = description
        self.place = place
    }
}
