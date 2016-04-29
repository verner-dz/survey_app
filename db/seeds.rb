# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

survey_a = Survey.create(name: 'Survey A')
survey_b = Survey.create(name: 'Survey B')

question_one = survey_a.questions.create(content: "What is Lil Wayne's real name?", question_type: 'Checkbox')
question_two = survey_a.questions.create(content: 'What is your favorite food?', question_type: 'Text')
question_three = survey_a.questions.create(content: 'What is the color of the sky?', question_type: 'Dropdown')


question_four = survey_b.questions.create(content: 'What is the capital of Japan?', question_type: 'Checkbox')
question_five = survey_b.questions.create(content: 'Who is Beezlebub', question_type: 'Text')
question_six = survey_b.questions.create(content: 'Who what where?', question_type: 'Dropdown')


answer_one = question_one.answers.create(content: "Wayne Drizzy", filled: false)
answer_two = question_one.answers.create(content: "Lil Lillie", filled: false)
answer_three = question_one.answers.create(content: "The Waynemeister", filled: false)

answer_four = question_two.answers.create(content: "Pizza", filled: false)
answer_five = question_two.answers.create(content: "More pizza", filled: false)
answer_six = question_two.answers.create(content: "All the pizza", filled: false)

answer_seven = question_three.answers.create(content: "Depends on my mood", filled: false)
answer_eight = question_three.answers.create(content: "There ain't no color son", filled: false)
answer_nine = question_three.answers.create(content: "Blue", filled: false)

answer_ten = question_four.answers.create(content: "Shanghai", filled: false)
answer_eleven = question_four.answers.create(content: "Tokyo", filled: false)
answer_twelve = question_four.answers.create(content: "Ulaan Baatar", filled: false)

answer_thirteen = question_five.answers.create(content: "Beezle-who", filled: false)
answer_fourteen = question_five.answers.create(content: "Beezle-wha", filled: false)
answer_fifteen = question_five.answers.create(content: "Beezle-what", filled: false)

answer_sixteen = question_six.answers.create(content: "Every thing", filled: false)
answer_seventeen = question_six.answers.create(content: "Every one", filled: false)
answer_eighteen = question_six.answers.create(content: "Every where", filled: false)




