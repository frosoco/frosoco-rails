var PostView = Backbone.View.extend({

	events: {

		'click .feed-time': 'addComment',
		'submit .add-comment': 'addComment'

	},

    template: _.template($('#template-post').html()),

    initialize: function() {

	  	// Get a pointer to the parent object
	    var _this = this;

	    // Create a comment collection
	    this.commentCollection = new CommentCollection();

		// Set up a listener on the post collection
		this.commentCollection.on('add', function(model) {

			var commentView = new CommentView({
				comment: model.id
			});

		});

		// Set the URL for the comments collection
		this.commentCollection.url = '/posts/' + this.options.post + '/comments'

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

	  	// Get a pointer to the parent object
	    var _this = this;
	
		// Prepend the template
		$('#feed-items').prepend(this.template(this.model.attributes));

	    // Set the el property
	    this.el = this.options.el;
	    this.$el = $(this.el);

	    // Register an event for this form
		$('#post-' + this.options.post + '-comment').on('submit', function(e) {

			var elements = this.elements;

			// Pass it off to another method
			_this.addComment(e, elements);

		});


		// Fetch from the URL
		this.commentCollection.fetch({

			success: function() {

				for (var index in _this.commentCollection.models) {

					// Fetch the model by its index
					var model = _this.commentCollection.models[index];

					var commentView = new CommentView({
						comment: model.id,
					});

				}

			}

		});

	},

	addComment: function(e, elements) {

		// Add a reference to the pointer
		var _this = this;

		// Get the value
		var value = elements[0].value;

		// Create the comment
		var comment = new Comment({

			post_id: _this.options.post,
			content: value

		});

		// Save the comment
		comment.save(null, {

			success: function(model, response) {

				_this.commentCollection.add(comment);

			},
			
			error: function(model, response) {

				console.log(response);

			}

		});

		e.preventDefault();

	}

});