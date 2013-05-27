"use strict"

class Facebook

	loginStatus: (callback) ->
		FB.getLoginStatus (response) ->
			if response.status is 'connected'
				callback('connected')
			else if response.status is 'not_authorized'
				callback('not authorized')
			else
				callback('not logged in')

	login: (callback) ->
		FB.login (response) =>
			if (response.authResponse)
				callback(true)
			else
				callback(false)
		, {scope: @fbPermissions}

	logout: (callback) ->
		FB.logout (response) =>
			if response.authResponse
				callback(true)
			else
				callback(false)

	feed: (link, picture, name, caption, description, callback) ->
		FB.ui
			method: 'feed'
			link: @fbFeed.link || link
			picture: @fbFeed.picture || picture
			name: @fbFeed.name || name
			caption: @fbFeed.caption || caption
			description: @fbFeed.description || description
		,
		(response) ->
			callback(response)

	apprequests: (callback) ->
		FB.ui
			method: 'apprequests'
			message: @fbAppRequests.message
		,
		(response) ->
			callback(response)


class App extends Facebook

	init: ->
		@fbPermissions  = 'email'
		@fbAppRequests = {
			message: 'test'
		}
		@fbFeed = {
			link: 'http://www.google.com'
			picture: 'XX'
			name: 'XX'
			caption: 'XX'
			description: 'XX'
		}

		#here's an example call using the app requests dialog.
		@apprequests (response) ->
			console.log response


$(document).bind 'FBSDKLoaded', ->
	app = new App
	app.init()