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

		// Unbind old events if they exist
		$('#feed').off('submit', '#add-post');

	    // Get the target
	    var id = e.target.getAttribute('group-id');
	    var identifier = e.target.getAttribute('group-identifier');

	    // Create the feedView
	    this.feedView = new FeedView({
	    	group: id,
	    	identifier: identifier
	    });

	}

});