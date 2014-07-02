# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user1 = User.create!(email: 'demo@bugzilla.com', password: 'password', confirmed_at: '2014-06-24 07:38:26.463')
user2 = User.create!(email: 'demo2@bugzilla.com', password: 'password', confirmed_at: '2014-06-24 07:38:26.463')
user3 = User.create!(email: 'demo3@bugzilla.com', password: 'password', confirmed_at: '2014-06-24 07:38:26.463')

project1 = Project.create! name: 'Project 1'
project2 = Project.create! name: 'Project 2'
project3 = Project.create! name: 'Project 3'
project4 = Project.create! name: 'Project 4'
project5 = Project.create! name: 'Project 5'
project6 = Project.create! name: 'Project 6'
project7 = Project.create! name: 'Project 7'
project8 = Project.create! name: 'Project 8'
project9 = Project.create! name: 'Project 9'
project10 = Project.create! name: 'Project 10'

member1 = Member.create!(name: 'Me', email: 'demo@bugzilla.me', user: user1, project: project1, confirmed: true, owner: true)
member2 = Member.create!(name: 'Me', email: 'demo@bugzilla.me', user: user1, project: project3, confirmed: true, owner: true)
member3 = Member.create!(name: 'Me', email: 'demo@bugzilla.me', user: user1, project: project4, confirmed: true, owner: true)
member4 = Member.create!(name: 'Me', email: 'demo@bugzilla.me', user: user1, project: project5, confirmed: true, owner: true)
member5 = Member.create!(name: 'Me', email: 'demo@bugzilla.me', user: user1, project: project6, confirmed: true, owner: true)
member6 = Member.create!(name: 'Me', email: 'demo@bugzilla.me', user: user1, project: project7, confirmed: true, owner: true)
member7 = Member.create!(name: 'Me', email: 'demo@bugzilla.me', user: user1, project: project8, confirmed: true, owner: true)
member8 = Member.create!(name: 'Me', email: 'demo@bugzilla.me', user: user1, project: project9, confirmed: true, owner: true)
member9 = Member.create!(name: 'Me', email: 'demo@bugzilla.me', user: user1, project: project10, confirmed: true, owner: true)
member10 = Member.create!(name: 'demo2', email: 'demo2@bugzilla.me', user: user2, project: project1, confirmed: true, owner: true)
member11 = Member.create!(name: 'Me', email: 'demo2@bugzilla.me', user: user2, project: project2, confirmed: true, owner: true)
member12 = Member.create!(name: 'demo', email: 'demo@bugzilla.me', user: user1, project: project2, confirmed: true, owner: true)

story1 = Story.create(name: 'Story 1', owner: user1, project: project1, state: 'unstarted', description: 'description', story_type: 'feature', container: 'icebox')
story2 = Story.create(name: 'Story 2', owner: user1, project: project1, state: 'unstarted', description: 'description', story_type: 'feature', container: 'icebox')
story3 = Story.create(name: 'Story 3', owner: user1, project: project1, state: 'unstarted', description: 'description', story_type: 'feature', container: 'icebox')
story4 = Story.create(name: 'Story 4', owner: user1, project: project1, state: 'unstarted', description: 'description', story_type: 'feature', container: 'icebox')
story5 = Story.create(name: 'Story 5', owner: user1, project: project1, state: 'unstarted', description: 'description', story_type: 'feature', container: 'icebox')
story6 = Story.create(name: 'Story 6', owner: user2, project: project2, state: 'unstarted', description: 'description', story_type: 'feature', container: 'icebox')
story7 = Story.create(name: 'Story 7', owner: user2, project: project2, state: 'unstarted', description: 'description', story_type: 'feature', container: 'icebox')
story8 = Story.create(name: 'Story 8', owner: user2, project: project2, state: 'unstarted', description: 'description', story_type: 'feature', container: 'icebox')
story9 = Story.create(name: 'Story 9', owner: user2, project: project2, state: 'unstarted', description: 'description', story_type: 'feature', container: 'icebox')

task1 = Task.create(task: 'Do something', story: story1)
task2 = Task.create(task: 'Do something', story: story1)
task3 = Task.create(task: 'Do something', story: story1)
task4 = Task.create(task: 'Do something', story: story2)
task5 = Task.create(task: 'Do something', story: story2)
task6 = Task.create(task: 'Do something', story: story2)
task7 = Task.create(task: 'Do something', story: story3)
task9 = Task.create(task: 'Do something', story: story3)
task10 = Task.create(task: 'Do something', story: story3)
task11 = Task.create(task: 'Do something', story: story4)
task12 = Task.create(task: 'Do something', story: story4)
task13 = Task.create(task: 'Do something', story: story4)
task14 = Task.create(task: 'Do something', story: story4)
task15 = Task.create(task: 'Do something', story: story4)

comment1 = Comment.create(text: 'Comment 1', story: story1)
comment2 = Comment.create(text: 'Comment 2', story: story1)
comment3 = Comment.create(text: 'Comment 3', story: story1)
comment4 = Comment.create(text: 'Comment 4', story: story2)
comment5 = Comment.create(text: 'Comment 5', story: story2)
comment6 = Comment.create(text: 'Comment 6', story: story2)
comment7 = Comment.create(text: 'Comment 7', story: story3)
comment8 = Comment.create(text: 'Comment 8', story: story3)
comment9 = Comment.create(text: 'Comment 9', story: story3)
comment10 = Comment.create(text: 'Comment 10', story: story4)
comment11 = Comment.create(text: 'Comment 11', story: story4)
comment12 = Comment.create(text: 'Comment 12', story: story4)
comment13 = Comment.create(text: 'Comment 13', story: story4)
