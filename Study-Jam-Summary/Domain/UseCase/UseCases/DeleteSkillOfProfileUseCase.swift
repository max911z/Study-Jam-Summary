final class DeleteSkillOfProfileUseCase {
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
        id: String,
        completion: @escaping (Result<Void, Error>) -> Void
    ) {
        database.deleteSkill(id: id) { result in
            switch result {
            case .success:
                completion(.success(()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
