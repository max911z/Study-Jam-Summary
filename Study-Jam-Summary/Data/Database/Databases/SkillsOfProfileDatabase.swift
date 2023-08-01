final class SkillsOfProfileDatabase {
    
    // MARK: - Private Properties
    
    private var skills: [Skill] = []
    
    // MARK: - Inits
    
    init() {
        loadData()
    }
    
    // MARK: - Methods
    
    func getSkillsOfProfile() -> [Skill] {
        skills
    }
    
    func addNewSkill(
        title: String,
        completion: @escaping (Result<Void, Error>) -> Void
    ) {
        let newSkil = Skill(
            id: "\(skills.count + 1)",
            title: title
        )
        
        skills.append(newSkil)
        completion(.success(()))
    }
    
    func deleteSkill(
        id: String,
        completion: @escaping (Result<Void, Error>) -> Void
    ) {
        skills.removeAll { $0.id == id }
        completion(.success(()))
    }
    
    // MARK: - Private Methods
    
    private func loadData() {
        skills = [
            Skill(id: "1", title: "MVI/MVVM"),
            Skill(id: "2", title: "Kotlin Coroutines"),
            Skill(id: "3", title: "Room"),
            Skill(id: "4", title: "OkHttp"),
            Skill(id: "5", title: "DataStore"),
            Skill(id: "6", title: "WorkManager"),
            Skill(id: "7", title: "custom view")
        ]
    }
}
