import Vapor

func setUpRepositories(services: inout Services, config: inout Config) {
    services.register(MySQLEventRepository.self)
    services.register(MySQLRoomRepository.self)
    services.register(MySQLSpeakerRepository.self)
    services.register(MySQLDayRepository.self)
    services.register(MySQLScheduleEntryRepository.self)
    services.register(MySQLTalkRepository.self)
    preferDatabaseRepositories(config: &config)
}

private func preferDatabaseRepositories(config: inout Config) {
     config.prefer(MySQLEventRepository.self, for: EventRepository.self)
     config.prefer(MySQLRoomRepository.self, for: RoomRepository.self)
     config.prefer(MySQLSpeakerRepository.self, for: SpeakerRepository.self)
     config.prefer(MySQLDayRepository.self, for: DayRepository.self)
     config.prefer(MySQLScheduleEntryRepository.self, for: ScheduleEntryRepository.self)
     config.prefer(MySQLTalkRepository.self, for: TalkRepository.self)
}
