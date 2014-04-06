var Comment = Backbone.RelationalModel.extend({

	urlRoot: '/comment/'

});

var CommentCollection = Backbone.Collection.extend({

	model: Comment

});