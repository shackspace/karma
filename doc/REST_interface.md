karma REST interface specification
==================================

Host naming convention
----------------------
It is probably a good idea to run the karma API on a separate virtual host.
If your system runs on karma.loc a suitable hostname would be api.karma.loc.

It is strongly recommended to only offer access to the API via an SSL secured connection.


Generic information
-------------------
### get /
get basic information and system health status

User management
---------------
If authentication is done using an LDAP backend creating new users or deleting them is probably not something karma will handle itself.  Also modifying user settings is way more limited in this use case.

### GET /users
Get a list of all users

### POST /users
Create a new user

### GET /users/<id>
Get the user identified by <id>

### DELETE /users/<id>
Delete the user identified by <id> if your permissions allow the operation

### PUT /users/<id>
Modify a users parameters

Authentication
--------------
Some operations, mostly PUT, POST, DELETE may be limited to authenticated users for obvious reasons.
Also it should be easy to adapt the system to use a different authenticator scheme, by default karma will authenticate against LDAP making most parts of user management, creation and deletion unnecessary.

### POST /login
Authenticate yourself and start a session

### GET /logout
Log out of the system, dropping privilegues
