# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

survey_a = Survey.create(name: 'Survey A')
survey_b = Survey.create(name: 'Survey B')

question_one = survey_a.questions.create(content: 'What is the what?', question_type: 'Checkbox')
question_two = survey_a.questions.create(content: 'What is the meaning of life?', question_type: 'Text')
question_three = survey_a.questions.create(content: 'What is love?', question_type: 'Dropdown')


question_four = survey_b.questions.create(content: 'Is this real life?', question_type: 'Checkbox')
question_five = survey_b.questions.create(content: 'Is it a fantasy?', question_type: 'Text')
question_six = survey_b.questions.create(content: 'Who is Beezlebub?', question_type: 'Dropdown')


answer_one = question_one.answers.create(content: "Scooby", filled: false)
answer_two = question_one.answers.create(content: "Dooby", filled: false)
answer_three = question_one.answers.create(content: "Doo", filled: false)

answer_four = question_two.answers.create(content: "BPA", filled: false)
answer_five = question_two.answers.create(content: "Free", filled: false)
answer_six = question_two.answers.create(content: "Bottle", filled: false)

answer_seven = question_three.answers.create(content: "Poland", filled: false)
answer_eight = question_three.answers.create(content: "Spring", filled: false)
answer_nine = question_three.answers.create(content: "Natural", filled: false)

answer_ten = question_four.answers.create(content: "Italian", filled: false)
answer_eleven = question_four.answers.create(content: "Regional", filled: false)
answer_twelve = question_four.answers.create(content: "Cooking", filled: false)

answer_thirteen = question_five.answers.create(content: "Ben", filled: false)
answer_fourteen = question_five.answers.create(content: "Harper", filled: false)
answer_fifteen = question_five.answers.create(content: "Innocent", filled: false)

answer_sixteen = question_six.answers.create(content: "Criminals", filled: false)
answer_seventeen = question_six.answers.create(content: "Lifeline", filled: false)
answer_eighteen = question_six.answers.create(content: "Cracking", filled: false)



response_one = survey_a.responses.create(name: "Jack", data: [{"Question" => "What is the capital of Japan", "Answer" => "Tokyo"}, {"Question" => "What is the color of an Apple", "Answer" => "Red"}])
