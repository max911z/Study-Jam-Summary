final class UseCaseProvider {
    
    // MARK: - Singleton
    
    private init() {}
    
    static let instance = UseCaseProvider()
    
    // MARK: - Instances
    
    lazy var getSkillsOfProfileUseCase: GetSkillsOfProfileUseCase = .init()
    
    lazy var getProfileUseCase: GetProfileUseCase = .init()
}
