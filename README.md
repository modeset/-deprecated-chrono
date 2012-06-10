Chrono
=====
Chrono is a simple status-message-style time tracking and reporting system inspired by ENTP's [XTT](https://github.com/entp/xtt).

Why?
----
Why another timekeeping system, you might ask? It's really about simplicity and ease of use. I *fucking hate* every other time tracking system I've used, and I think that is largely because they're all completely overblown. I want three things:

* To easily mark what I'm working on so I can look it up  and remember what I'm working on. 
* A summary of my activities for the day so I can bill them appropriately later
* Fast, reliable and consistent operation

There are a few other things that I explicitly *don't* want this tool to do:

* Client annotations and bill codes and all that cluttering up my tracking panel. If I have to wade through all that to start a timer, I'm not going to be timing properly.
* A full-on time reporting/billing tool. We use a different system entirely to manage client billing and billability, and I presume you will too. May look at API integrations at some point down the line, but I don't even want to get into that side of things to start. 

Inspiration
-----------
* XTT is the closest I've found to getting the workflow right. Unfortunately, it seems to be abandoned at this point, and is bogged down with a lot of cool but half-implemented and poorly-documented features that would make bringing it up to date a pretty herculean effort.

* [Play](https://github.com/play/play) embodies the same philosophy that I'm going for in this project - open-soured internal tool, plug-and-play, hackable, web interface, and native apps as those make sense.


Design Parameters
----------------
* Deployable to Heroku on the free tier to keep it accessible and easy to bootstrap.
* Use Github OAuth and organizations for login and authorization, respectively. I don't want to maintain yet another user database.

I'll add more here as I think of them.
