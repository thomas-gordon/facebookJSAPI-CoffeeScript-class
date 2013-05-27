facebookJSAPI-CoffeeScript-class
================================

A CoffeeScript class that allows management of the facebook asynchronous API via the use of callbacks.

## Install

You'll need to create a facebook application and retrieve your API credentials. Put the **App ID**
in the FB.init() call in index.html (replace the XXXXs) and the fill out the fb: meta in the <head> as you see fit.
Once this is done, refresh the page. You should see an apprequests dialog popup.

Take note of the permissions and how they are declared in facebook.coffee.

You will also need to use coffeescript and get it compiling to native JS somehow. You can learn about this
[here](http://coffeescript.org/).

##Usage

An example usage is included and should launch an apprequests dialog on launch that will error if you are missing
something from the configuration in one of the following places:

* List of fb:meta in the head of the index.html
* APP ID, settings in the FB.init() call in the footer of index.html
* An incorrectly configured facebook application.

