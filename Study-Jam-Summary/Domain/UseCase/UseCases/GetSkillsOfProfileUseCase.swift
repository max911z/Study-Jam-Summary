final class GetSkillsOfProfileUseCase {
    
    // MARK: - Private Properties
    
    private let database: SkillsOfProfileDatabase
    
    // MARK: - Init
    
    init(
        database: SkillsOfProfileDatabase
    ) {
        self.database = database
    }
    
    // MARK: - Use Case

    func invoke() -> [Skill] {
        database.getSkillsOfProfile()
    }
}
