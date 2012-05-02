karma REST interface specification
==================================

Host naming convention
----------------------
It is probably a good idea to run the karma API on a separate virtual host.
If your system runs on karma.loc a suitable hostname would be api.karma.loc.

It is strongly recommended to only offer access to the API via an SSL secured connection.

Generic information
-------------------
### / (GET)
Basic information, overview and system health status

User handling
-------------
If authentication is done using an LDAP backend creating new users or deleting them is probably not something karma will handle itself.  Also modifying user settings is way more limited in this use case.

### /users (GET, PUSH, DELETE)
A list of users using the karma system.
A PUSH request will create a karma user from a specified LDAP user.
DELETE could be tricky and has to be thought out some more.

### /users/:id (GET)
Consolidated list of user information
- List of open polls by user
- List of past polls bei user
- List of deeds (with count) done in past
- Achievements
- Status
- Current karama
- All-time karma
- Lost karma
- Spent karma

### By-user details
- /users/:id/polls(/open,/won,/lost)
- /users/:id/deeds
- /users/:id/achievements
- /users/:id/karma(/alltime,/lost,/spent)

Authentication
--------------
Some operations, mostly PUT, POST, DELETE may be limited to authenticated users for obvious reasons.
Also it should be easy to adapt the system to use a different authenticator scheme, by default karma will authenticate against LDAP making most parts of user management, creation and deletion unnecessary.

Authentication will probably be implemented using the scheme presented at http://www.sinatrarb.com/faq.html#auth mixed with a pinch of https://gist.github.com/783358

Deeds
-----
Deeds are small, singular tasks that, when done, further the good of everyone (giving a workshop, building something awesome, organizing events, cooking for everyone, cleaning, ...)

### /deeds (GET, POST)
List of all deeds.
New deeds can be posted by karma admins or users with high enough karma.
A deed is defined by meta information like the base karma one can achieve doing the deed (can be zero to allow deeds that can only be enforced if they for instance do not have a easily definable amount of karma), required number of upvotes, voting duration, etc.
The required number of upvotes could also be bound (in parts) to the amount of karma to be gained.

### /deeds/:id (GET, PUT, DELETE)
Details for a single deed

Polls
-----
Peer review polls to decide whether someone actually did a deed.
Maybe add filters for active, closed, won, lost polls?

### /polls (GET, PUSH)
List of all polls.
A new poll can be started by karma admins or users with high enough karma.
A single poll is defined by a (deed, user, karma) tupel.
If several people worked on the same deed, individual polls should be started.

### /polls/:id (GET, PUT, POST, DELETE)
What can be changed with PUT is open to discussion.

### /polls/:id/vote (POST, DELETE)
Upvote a poll.  Maybe also have to add downvote?

### /polls/:id/boost/:karma (POST)
Add some of your own karma to increase the amount gained by winning this poll.
Once karma is added, it cannot be taken back, so no PUT or DELETE here.
You will however get your karma back should the poll fail or get deleted.

Achievements
------------
### /achievements (GET)
Get a list of all achievements

### /achievements/:id (GET, PUT, POST, DELETE)
Infos about a specific achievement
- Who won it, when, how often
- What has to be done to earn this achievement
- Logged in: how far away from earning it yourself are you?
- Admin: modify / deactivate achievement, delete is critical


