final class AddSkillOfProfileUseCase {
    
    // MARK: - Private Propeties
    
    private let database: SkillsOfProfileDatabase
    
    // MARK: - Init
    
    init(
        database: SkillsOfProfileDatabase
    ) {
        self.database = database
    }
    
    // MARK: - Use Case
    
    func invoke(
        title: String,
        completion: @escaping (Result<Void, Error>) -> Void
    ) {
        database.addNewSkill(title: title) { result in
            switch result {
            case .success:
                completion(.success(()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
