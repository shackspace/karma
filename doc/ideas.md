Ideas for karma system
======================

karma decay
-----------
- decay using a multiplicative factor preventing huge accumulation of karma (think log scale)
- decay using a subtractive term to get steeper linear decay down to zero for low karma values
- decay-excempt time slots
  - use achievements to cash in decay-except time slots
  - simply grant slots on common sense

privilegues
-----------
- portal key can be disabled if karma drops below a certain threshold
- submit new achievements
- submit votes for yourself
- submit new tasks
- submit karma-paied task (offer a task and pay for it in your karma)
- enforce karma-paied task (add some of your own karma to an already existing task)

features
--------
- paied karma factor (offer 5 karma points for completion of task at a cost of 10 karma points for yourself)

How to track karma
------------------
- per-user counter
	- simple
	- unflexible
	- does  not allow to keep history
- karma transaction log
	- more complex
	- does allow history

idea for hashtupel:
 { id,							# transaction ID
	 date,						# date the transaction was created
	 type (boost,			# this is a boost transaction, source_id denotes a user id, sink_id denotes a poll id
				 earned,		# a poll was won and karma was earned, source_id denotes a poll id, sink_id denotes the winners user id
				 decay),		# karma decay ate all my karma! source_id is a user id, sink_id is the bit bucket used for fuel to heat the data center
	 source_id,
	 sink_id,
	 amount_credited,	# amount credited to the sink
	 fee							# the cost of the transaction (ie karma boost has a non-zero cost, decay has a 100% cost)
 }

Workflow
--------
Transaction are executed in real time.
Decay is a task run periodically and only touches karma earned prior to the last decay run.
