$.ajaxPrefilter(function(options, originalOptions, jqXHR) {
  var token;
  options.xhrFields = {
    withCredentials: true
  };
  token = $('meta[name="csrf-token"]').attr('content');
  if (token) {
    return jqXHR.setRequestHeader('X-CSRF-Token', token);
  }
});

var PostView = Backbone.View.extend({

    initialize: function() {

	  	// Get a pointer to the parent object
	    var _this = this;

	    var post = new Post({
	    	id: 1
	    });

	    post.fetch();

	    post.set({"content": "The content has now changed."});

	    console.log(post);

	    post.save();

	}

});