final class GetAvatarProfileUseCase {
    
    // MARK: - Private Propeties
    
    private let database: ProfileDatabase
    
    // MARK: - Init
    
    init(
        database: ProfileDatabase
    ) {
        self.database = database
    }
    
    // MARK: - Use Case
    
    func invoke() -> String {
        database.getAvatar()
    }
}
