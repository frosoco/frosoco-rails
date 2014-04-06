var AppView = Backbone.View.extend({

	el: $('main'),

	events: {

		'click .sidebar-group': 'loadGroup'

	},

	initialize: function() {

		// Get a reference to the parent object
		var _this = this;

	},

	loadGroup: function(e) {

	    // Get the target
	    var id = e.target.getAttribute('group-id');

	    // Set the app group ID
	    this.group = id;

	    // Create the feedView
	    this.feedView = new FeedView({
	    	group: this.group
	    });

	}

});