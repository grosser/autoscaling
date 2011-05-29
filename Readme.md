A small script to get started with aws autoscaling, inspired by [Tehrani](http://mtehrani30.blogspot.com/2011/05/amazon-auto-scaling.html)

Setup
=====
 - `git clone git://github.com/grosser/autoscaling.git`
 - `cd autoscaling`
 - `sh download_tools.sh`
 - copy credentials to yourproject.credentials.priv and customize
 - copy settings to yourproject.settings.priv and customize + change credentials path

Usage
=====

    source yourproject.settings.priv
    # paste commands (one by one) as shown in initialize_autoscale.sh

TODO
====
 - make download_tools script always fetch the newest version (not hardcoded)
 - modify PATH only once

Author
======
[Michael Grosser](http://grosser.it)<br/>
michael@grosser.it<br/>
Hereby placed under public domain, do what you want, just do not hold anyone accountable...
