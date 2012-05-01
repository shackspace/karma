karma
=====

SYNOPSIS
--------
karma is a system to track your, well, karma.
Think of it as stackoverflow for good and useful deeds around your hackerspace.
Especially hackerspaces work if everyone helps each other.  However, often times there's lots of dirty, necessary, tedious, boring work that goes into keeping your space up and running and most people do not notice that this gets done unless the one doing it stops.
Think of cleaning, doing paperwork, restocking beverages, cooking for everyone, organizing an event, giving talks and workshops, etc.

karma tracks your deeds and you can increase your karma.  It's all based on a peer review basis and should be pretty much self regulating.
Think of it as stack exchange for good deeds.

karma is implemented as a RESTful web service making it easy to interface with existing systems.  The backend is powered by a redis NoSQL database and the REST service itself is implemented in Ruby using the awesome sinatra DSL.

By tracking your own karma and that of your peers you can get a nice overview how much you're doing for your peers.

The system also allows offering rewards for specific tasks by paying with your own accumulated karma.

