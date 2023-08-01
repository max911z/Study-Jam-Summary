protocol SummaryScreenViewModel: AnyObject {
    
    // MARK: - Output
    
    var profile: Observable<Profile> { get }
    
    var skills: Observable<[Skill]> { get }
    
    // MARK: - Input

    func viewDidLoad()
    
    func addNewSkill(title: String)
    
    func deleteSkill(id: String)
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
    
    func addNewSkill(title: String) {
        dependencies.addSkillOfProfileUseCase.invoke(
            title: title
        ) { [weak self] result in
            switch result {
            case .success:
                self?.getSkillsOfProfile()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func deleteSkill(id: String) {
        dependencies.deleteSkillOfProfileUseCase.invoke(
            id: id
        ) { [weak self] result in
            switch result {
            case .success:
                self?.getSkillsOfProfile()
            case .failure(let error):
                print(error)
            }
        }
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
        let addSkillOfProfileUseCase: AddSkillOfProfileUseCase
        let deleteSkillOfProfileUseCase: DeleteSkillOfProfileUseCase
    }
}
