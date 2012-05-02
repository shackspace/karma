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

### /users (GET)
A list of users using the karma system.

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

### /users/:id/polls(/open,/won,/lost)
### /users/:id/deeds
### /users/:id/achievements
### /users/:id/karma(/alltime,/lost,/spent)

Authentication
--------------
Some operations, mostly PUT, POST, DELETE may be limited to authenticated users for obvious reasons.
Also it should be easy to adapt the system to use a different authenticator scheme, by default karma will authenticate against LDAP making most parts of user management, creation and deletion unnecessary.

Authentication will probably be implemented using the scheme presented at http://www.sinatrarb.com/faq.html#auth mixed with a pinch of https://gist.github.com/783358

Deeds
-----
Deeds are small, singular tasks that, when done, further the good of everyone (giving a workshop, building something awesome, organizing events, cooking for everyone, cleaning, ...)

### /deeds (GET)
List of all deeds

### /deeds/:id (GET, PUT, POST, DELETE)
Details for a single deed

Polls
-----
Peer review polls to decide whether someone actually did a deed.
Maybe add filters for active, closed, won, lost polls?

### /polls (GET)
List of all polls

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


