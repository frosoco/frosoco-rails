var FeedView = Backbone.View.extend({

	el: $('#feed'),

    template: _.template($('#template-feed').html()),

	events: {



	},

	initialize: function() {

		// Get a pointer to the parent object
		var _this = this;

		// Create an postCollection for the feed
		this.postCollection = new PostCollection();

		// Set the URL for the collection
		this.postCollection.url = '/groups/' + this.options.group;

		// Render the feed wrapper
		this.render();

		// Fetch from the URL
		this.postCollection.fetch({

			success: function() {

				for (var index in _this.postCollection.models) {

					// Fetch the model by its index
					var model = _this.postCollection.models[index];

					var postView = new PostView({
						post: model.id,
					});

				}

			}

		});

	},

	render: function() {

      $(this.el).html(this.template(this.options));

	},

});