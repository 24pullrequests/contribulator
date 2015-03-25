#  __    __       _______. _______ .______
# |  |  |  |     /       ||   ____||   _  \
# |  |  |  |    |   (----`|  |__   |  |_)  |
# |  |  |  |     \   \    |   __|  |      /
# |  `--'  | .----)   |   |  |____ |  |\  \----.
#  \______/  |_______/    |_______|| _| `._____|
#
unless User.find_by_nickname('ajfaraday')
  User.create!(
    uid: "ajfaraday", nickname: "ajfaraday",
    gravatar_id: nil, token: "ajfaraday"
  )
end
unless User.find_by_nickname('andrew')
  User.create!(
    uid: "andrew", nickname: "andrew",
    gravatar_id: nil, token: "andrew"
  )
end
#
# .______   .______        ______          __   _______   ______ .___________.
# |    _  \ |   _  \      /  __   \       |  | |   ____| /      ||           |
# |  |_)  | |  |_)  |    |  |  |  |       |  | |  |__   |  ,----'`---|  |----`
# |   ___/  |      /     |  |  |  | .--.  |  | |   __|  |  |         |  |
# |  |      |  |\  \----.|  `--'  | |  `--'  | |  |____ |  `----.    |  |
# | _|      | _| `._____| \______/   \______/  |_______| \______|    |__|
#
unless Project.find_by_name('contribulator')
  Project.create!(
    name: "contribulator", owner: "andrew", homepage: "https://contribulator.herokuapp.com/",
    main_language: "Ruby", github_id: 28201944, fork: false, score: 43.0,
    description: ":+1: Find open source project that are friendly and welcoming"
  )
end
unless Project.find_by_name('split')
  Project.create!(
    name: "split", owner: "andrew", homepage: "http://libraries.io/rubygems/split",
    main_language: "Ruby", github_id: 1748446, fork: false, score: 39.0,
    description: ":chart_with_upwards_trend: The Rack Based AB testing framework"
  )
end
unless Project.find_by_name('smiff_music')
  Project.create!(
    name: "smiff_music", owner: "AJFaraday", homepage: nil,
    main_language: "Ruby", github_id: 28313088, fork: false,
    score: 22.0, description: "Social Media InterFace For Music"
  )
end
unless Project.find_by_name('scaled_up')
  Project.create!(
    name: "scaled_up", owner: "AJFaraday", homepage: nil,
    main_language: "Ruby", github_id: 19289727, fork: false,
    score: 22.0, description: "Social experiment in collaborative musicianship. "
  )
end
#
# __       _______.     _______. __    __   _______
#|  |     /       |    /       ||  |  |  | |   ____|
#|  |    |   (----`   |   (----`|  |  |  | |  |__
#|  |     \   \        \   \    |  |  |  | |   __|
#|  | .----)   |   .----)   |   |  `--'  | |  |____
#|__| |_______/    |_______/     \______/  |_______|
#
#
# Nothing needs doing here, issues initialise with projects.
#