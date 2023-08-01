final class UseCaseProvider {
    
    // MARK: - Singleton
    
    private init() {}
    
    static let instance = UseCaseProvider()
    
    // MARK: - Private Properties
    
    private let databaseProvider = DatabaseProvider()
    
    // MARK: - Instances
    
    lazy var getProfileUseCase: GetProfileUseCase = {
        .init(
            database: databaseProvider.profileDatabase
        )
    }()
    
    lazy var getSkillsOfProfileUseCase: GetSkillsOfProfileUseCase = {
        .init(
            database: databaseProvider.skillsOfProfileDatabase
        )
    }()
    
    lazy var deleteSkillOfProfileUseCase: DeleteSkillOfProfileUseCase = {
        .init(
            database: databaseProvider.skillsOfProfileDatabase
        )
    }()
    
    lazy var addNewSkillUseCase: AddSkillOfProfileUseCase = {
        .init(
            database: databaseProvider.skillsOfProfileDatabase
        )
    }()
}
