var FeedView = Backbone.View.extend({

	el: $('#feed'),

    template: _.template($('#template-feed').html()),

	events: {

		'submit #add-post': 'addPost'

	},

	initialize: function() {

		// Get a pointer to the parent object
		var _this = this;

		// Create an postCollection for the feed
		this.postCollection = new PostCollection();

		// Set up a listener on the post collection
		this.postCollection.on('add', function(model) {

			var el = 'div#post-' + model.id;

			var postView = new PostView({
				post: model.id,
				el: el
			});

		});
		
		// Set the URL for the collection
		this.postCollection.url = '/groups/' + this.options.identifier;

		// Render the feed wrapper
		this.render();

	},

	render: function() {

		// Get a pointer to the parent object
		var _this = this;

		// Render the actual template
		$(this.el).html(this.template(this.options));

		// Fetch from the URL
		this.postCollection.fetch({

			success: function() {

				for (var index in _this.postCollection.models) {

					// Fetch the model by its index
					var model = _this.postCollection.models[index];

					// el for the target
					var el = 'div#post-' + model.id;

					var postView = new PostView({
						post: model.id,
						el: el
					});

				}

			}

		});

	},

	addPost: function(e) {

		// Reference to the parent object
		var _this = this;

		// Get the content from the text box
		var content = $('#add-post-content').val(); 

		// Create a Post object
		var post = new Post({
			group_id: this.options.group,
			content: content
		});

		// Save the post
		post.save(null, {

			success: function(model, response) {

				// Add it to the collection
				_this.postCollection.add(post);	

			},

			error: function(model, response) {
			}

		});

		// Prevent the default submit action
    	e.preventDefault();

	}

});