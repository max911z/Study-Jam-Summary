final class GetSkillsOfProfileUseCase {

    public func invoke() -> [Skill] {
        [
            Skill(title: "MVI/MVVM"),
            Skill(title: "Kotlin Coroutines"),
            Skill(title: "Room"),
            Skill(title: "OkHttp"),
            Skill(title: "DataStore"),
            Skill(title: "WorkManager"),
            Skill(title: "custom view")
        ]
    }
}
