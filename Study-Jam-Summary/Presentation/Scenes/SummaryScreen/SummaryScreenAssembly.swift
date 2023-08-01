enum SummaryScreenAssembly {
    public static func make() -> SummaryScreenViewController {
        let viewModel = SummaryScreenViewModelImp(
            .init(
                getSkillsOfProfileUseCase: UseCaseProvider.instance.getSkillsOfProfileUseCase,
                getProfileUseCase: UseCaseProvider.instance.getProfileUseCase
            )
        )

        let viewController = SummaryScreenViewController(viewModel: viewModel)

        return viewController
    }
}
