final class ProfileDatabase {
    
    // MARK: - Private Properties
    
    private var profile = Profile()
    
    // MARK: - Inits
    
    init() {
        loadData()
    }
    
    // MARK: - Methods
    
    func getProfile() -> Profile {
        profile
    }
    
    func getAvatar() -> String {
        "avatar"
    }
    
    // MARK: - Private Methods
    
    private func loadData() {
        profile = Profile(
            name: "Иванов Иван Иванович",
            shortDescription: "Middle iOS-разработчик, опыт более 2-х лет",
            description: "Опытный инженер-программист, специализирующийся на разработке масштабируемых и обслуживаемых систем",
            place: "Воронеж"
        )
    }
}
