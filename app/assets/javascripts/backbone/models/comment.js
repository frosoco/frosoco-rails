var Comment = Backbone.Model.extend({

	urlRoot: '/comments/'

});

var CommentCollection = Backbone.Collection.extend({

	model: Comment

});