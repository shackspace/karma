karma database model
====================

CAVEAT
------
This is a relational database design and will not be used in the karma system.
It's mostly there for keeping track of some features that I want to implement.

The first karma version will be backed by a redis database and the model documented herein will reflect this in due time.

MODEL (RDB)
-----------
# long-term achvievements for repeated fulfillment of tasks by an individual user
table achievement
	id unique
	name
	desc
	task.id
	count_required

# a work package (give a talk, clean the space, build infrastructure, cook something for everyone, help people, ...)
table task
	id unique
	name
	desc
	votes_required
	base_karma

# a single user and its karma
table user
	id unique
	ldap.id
	current_karma

# holds all possible current and past votes
table vote
	id unique
	task.id
	creation_date
	close_date
	desc
	benefit_of = user.id
	started_by = user.id

# if you want to upvote / enforce a certain task, you can offer more karma for it by paying with your karma
table karma_enforcement
	vote.id	\__ unique
	user.id	/
	karma

# a user can only vote once
table cast_vote
	vote.id          \__ unique
	voter = user.id  /

# cross table of all tasks a given user successfully collected
table collected_tasks
	user.id	\__ unique
	vote.id	/

# collection of medals ;)
table collected_achievements
	user.id
	achievement.id

# the config, duh
table config
	karma_decay_factor
	karma_decay_interval
	karma_next_decay_time
	karma_enforce_exchange_rate

# with a certain amount of karma, certain privilegues may be granted
table privilegues
	key
