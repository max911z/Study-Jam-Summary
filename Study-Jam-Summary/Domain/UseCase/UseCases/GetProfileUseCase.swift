final class GetProfileUseCase {
    
    public func invoke() -> Profile {
        return Profile(
            name: "Иванов Иван Иванович",
            shortDescription: "Middle iOS-разработчик, опыт более 2-х лет",
            description: "Опытный инженер-программист, специализирующийся на разработке масштабируемых и обслуживаемых систем",
            place: "Воронеж"
        )
    }
}
