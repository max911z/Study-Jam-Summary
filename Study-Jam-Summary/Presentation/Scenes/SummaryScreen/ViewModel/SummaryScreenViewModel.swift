protocol SummaryScreenViewModel: AnyObject {
    
    // MARK: - Input

    func viewDidLoad()
    
    // MARK: - Output
    
    var profile: Observable<Profile> { get }
    
    var skills: Observable<[Skill]> { get }
}

final class SummaryScreenViewModelImp: SummaryScreenViewModel {
    
    // MARK: - Output
    
    var skills: Observable<[Skill]> = .init(.init())
    
    var profile: Observable<Profile> = .init(.init())
    
    // MARK: - Private Properties

    private let dependencies: Dependencies
    
    // MARK: - Init

    public init(_ dependencies: Dependencies) {
        self.dependencies = dependencies
    }

    // MARK: - Input

    func viewDidLoad() {
        getProfile()
        getSkillsOfProfile()
    }
    
    // MARK: - Private Methods
    
    private func getSkillsOfProfile() {
        skills.value = dependencies.getSkillsOfProfileUseCase.invoke()
    }
    
    private func getProfile() {
        profile.value = dependencies.getProfileUseCase.invoke()
    }
}

// MARK: - Nested Types

extension SummaryScreenViewModelImp {
    struct Dependencies {
        let getSkillsOfProfileUseCase: GetSkillsOfProfileUseCase
        let getProfileUseCase: GetProfileUseCase
    }
}
