Chef Cookbook for Stackdriver
===========
* This Chef cookbook will deploy the the Stackdriver collectd agent.
* This cookbook requires a Stackdriver account.  [Free trial available](http://www.stackdriver.com/signup).


Requirements
============
Chef >= 10

Platform
========
* Any RedHat based Linux distro, including: CentOS, Fedora, Amazon and other derivatives.

Attributes
==========
* `default[:stackdriver][:api][:key]` = Your API Key is available from the [Stackdriver App Settings Page](https://app.stackdriver.com/settings/). Override/replace "YOUR_API_KEY_HERE" with a valid API Key.
* `default[:stackdriver][:collectd][:config]` = Defines whether or not to auto-generate your collectd config. Defaults to "yes."


Usage
=====
1. Download the Stackdriver cookbook into your `chef-repo/cookbooks/stackdriver` directory: (the cookbook directory name must be stackdriver)
* `git clone https://github.com/dlaube/chef-stackdriver.git ./stackdriver`, or
*  manually download from the Opscode community site `http://community.opscode.com/cookbooks/stackdriver`, or
* `knife cookbook site download stackdriver`
2. Set your apikey as described in the `Attributes` section.
* You may override these via a Chef role or environment. Alternatively, edit `stackdriver/attributes/default.rb` if you are daring ;) 
3. Set any other optional attributes described above, as desired.
4. Upload the stackdriver cookbook to your chef server or hosted chef:
* `knife cookbook upload -a -o stackdriver`
5. Include `recipe[stackdriver]` in the run_list for all of your servers.
* `knife node run_list add NODE_NAME_HERE 'recipe[stackdriver]'`
6. Run chef-client on your nodes in whatever manner suits you, such as `sudo chef-client` or a batch job.
7. View your system(s) within a few moments in the [Stackdriver App](https://app.stackdriver.com/)
8. Ensure that you see the Agent Status listed as active.


That's all there is to it!


Links
=====
* [Stackdriver Homepage](http://www.stackdriver.com)
* [Stackdriver Signup](http://www.stackdriver.com/signup)
* [Stackdriver Login](https://app.stackdriver.com)


License and Author
==================
Author:: David Laube 

(The MIT License)

Copyright © 2013 [Stackdriver](http://www.stackdriver.com) and original authors.

Permission is hereby granted, free of charge, to any person obtaining a
copy of this software and associated documentation files (the "Software"),
to deal in the Software without restriction, including without
limitation the rights to use, copy, modify, merge, publish, distribute,
sublicense, and/or sell copies of the Software, and to permit persons
to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
