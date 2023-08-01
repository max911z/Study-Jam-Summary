enum SummaryScreenAssembly {
    public static func make() -> SummaryScreenViewController {
        let viewModel = SummaryScreenViewModelImp(
            .init(
                getSkillsOfProfileUseCase: UseCaseProvider.instance.getSkillsOfProfileUseCase,
                getProfileUseCase: UseCaseProvider.instance.getProfileUseCase,
                addSkillOfProfileUseCase: UseCaseProvider.instance.addNewSkillUseCase,
                deleteSkillOfProfileUseCase: UseCaseProvider.instance.deleteSkillOfProfileUseCase,
                getAvatarProfileUseCase: UseCaseProvider.instance.getAvatarProfileUseCase
            )
        )

        let viewController = SummaryScreenViewController(viewModel: viewModel)

        return viewController
    }
}
