import UIKit

final class SummaryScreenViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private let viewModel: SummaryScreenViewModel
    
    private let customView: SummaryScreenView = .init()
    
    // MARK: - Inits
    
    init(viewModel: SummaryScreenViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    
    override func loadView() {
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Private Methods
    
    private func setup() {
        setupBindings()
        viewModel.viewDidLoad()
    }
    
    private func setupBindings()  {
        viewModel.skills.bind { [ weak self ] skills in
            self?.customView.skillsBlockBiew.setSkills(skills)
        }
        
        viewModel.profile.bind { [ weak self ] profile in
            self?.customView.setProfileData(profile)
        }
        
        viewModel.avatar.bind { [ weak self ] avatar in
            self?.customView.setAvatar(avatar)
        }
        
        customView.skillsBlockBiew.skillLabelDeleteButtonTap = { [ weak self ] skill in
            self?.viewModel.deleteSkill(id: skill.id)
        }
        
        customView.skillsBlockBiew.plusSkillButtonTap = { [ weak self ] in
            self?.showAlertForAddNewSkill()
        }
    }
    
    private func showAlertForAddNewSkill() {
        let alertController = UIAlertController(
            title: "Добавление навыка",
            message: "Введите название навыка которым вы владеете",
            preferredStyle: .alert
        )
        
        alertController.addTextField { titleTextField in
            titleTextField.textColor = AppColors.lightBlack
            titleTextField.attributedPlaceholder = NSAttributedString(
                string: "Введите название",
                attributes: [NSAttributedString.Key.foregroundColor : AppColors.gray]
            )
        }
        
        let cancelAction = UIAlertAction(
            title: "Отмена",
            style: .cancel
        )
        let addAction = UIAlertAction(
            title: "Добавить",
            style: .default
        ) { [ weak self ] _ in
            if let titleTextField = alertController.textFields?[0],
                let title = titleTextField.text {
                self?.viewModel.addNewSkill(title: title)
            }
        }
        
        alertController.addActions(
            cancelAction,
            addAction
        )
        
        present(alertController, animated: true)
    }
}
