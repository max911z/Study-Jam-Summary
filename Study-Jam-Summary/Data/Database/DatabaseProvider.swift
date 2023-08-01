final class DatabaseProvider {
    
    // MARK: - Instances
    
    lazy var profileDatabase: ProfileDatabase = {
        ProfileDatabase()
    }()
    
    lazy var skillsOfProfileDatabase: SkillsOfProfileDatabase = {
        SkillsOfProfileDatabase()
    }()

}
