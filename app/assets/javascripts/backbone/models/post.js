var Post = Backbone.Model.extend({

	urlRoot: "/posts/"

});

var PostCollection = Backbone.Collection.extend({

	model: Post

});