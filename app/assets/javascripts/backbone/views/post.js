var PostView = Backbone.View.extend({

    template: _.template($('#template-post').html()),

    initialize: function() {

	  	// Get a pointer to the parent object
	    var _this = this;

	    // Set the model for this view
	    this.model = new Post();

	    // Set the URL for the model
	    this.model.url = '/posts/' + this.options.post

	    // Fetch from the model
	    this.model.fetch({
	    	success: function() {
				_this.render();
	    	}
	    });

	},

	render: function() {
	
		console.log(this.model);

		$('#feed-items').prepend(this.template(this.model.attributes));

	}

});