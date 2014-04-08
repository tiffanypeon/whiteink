# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create([
              {name: "Tom", email: "tom@test.com"},
              {name: "Stephanie", email: "stephanie@test.com"},
              {name: "Mike", email: "mike@test.com"},
              {name: "Laura", email: "laura@test.com"}
])

Document.create([
                   {name: "The Travels of Hockery Flomm", user_id: "1", published: "true"},
                   {name: nil, user_id: "2", published: "false"},
                   {name: "When L.A. Burns", user_id: "3", published: "false"},
                   {name: nil, user_id: "4", published: "false"},
                   {name: "Farte Fokombi", user_id: "2", published: "true"}

])

Draft.create([
                {content: "Each morning when I open my eyes I say to myself: I, not events, have the power to make me happy or unhappy today. I can choose which it shall be. Yesterday is dead, tomorrow hasn't arrived yet. I have just one day, today, and I'm going to be happy in it.", document_id: "1"},
                {content: "My second draft:Each morning when I open my eyes I say to myself: I, not events, have the power to make me happy or unhappy today. I can choose which it shall be. Yesterday is dead, tomorrow hasn't arrived yet. I have just one day, today, and I'm going to be happy in it.", document_id: "1"},
                {content: "We who lived in concentration camps can remember the men who walked through the huts comforting others, giving away their last piece of bread. They may have been few in number, but they offer sufficient proof that everything can be taken from a man but one thing: the last of the human freedoms -- to choose one's attitude in any given set of circumstances, to choose one's own way.", document_id: "2"},
                {content: "My second draft: We who lived in concentration camps can remember the men who walked through the huts comforting others, giving away their last piece of bread. They may have been few in number, but they offer sufficient proof that everything can be taken from a man but one thing: the last of the human freedoms -- to choose one's attitude in any given set of circumstances, to choose one's own way.", document_id: "2"},
                {content: "How do the geese know when to fly to the sun? Who tells them the seasons? How do we, humans, know when it is time to move on? As with the migrant birds, so surely with us, there is a voice within, if only we would listen to it, that tells us so certainly when to go forth into the unknown.", document_id: "3"},
                {content: "My second draft: How do the geese know when to fly to the sun? Who tells them the seasons? How do we, humans, know when it is time to move on? As with the migrant birds, so surely with us, there is a voice within, if only we would listen to it, that tells us so certainly when to go forth into the unknown.", document_id: "3"},
                {content: "To be a philosopher is not merely to have subtle thoughts, nor even to found a school, but so to love wisdom as to live according to its dictates, a life of simplicity, independence, magnanimity, and trust.", document_id: "4"},
                {content: "My second draft: To be a philosopher is not merely to have subtle thoughts, nor even to found a school, but so to love wisdom as to live according to its dictates, a life of simplicity, independence, magnanimity, and trust.", document_id: "4"},
                {content: "All truly wise thoughts have been thought already thousands of times; but to make them truly ours, we must think them over again honestly, till they take root in our personal experience.", document_id: "5"},
                {content: "My second draft: All truly wise thoughts have been thought already thousands of times; but to make them truly ours, we must think them over again honestly, till they take root in our personal experience.", document_id: "5"}
])
