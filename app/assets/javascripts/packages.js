(function($){
  var Bricks = Backbone.Model.extend({
  })

  var BricksForm = Backbone.View.extend({
    model : Bricks,
    initialize : function(){
      
    },
    render : function(){
      var template = $("#contents_form_template").clone()
      //template.find(".")
      this.$el.html(template.html())
      return this
    }
  })

  var FormContainer = Backbone.View.extend({
    el : "#package_form_container",
    initialize : function(){
      this.addBricksForm()
    },
    addBricksForm : function(){
      var bricksForm = new BricksForm()
      this.$el.append(bricksForm.render().el)
    }
  })
  $(document).ready(function(){
    // init
    var formContainer = new FormContainer();
  })
})(jQuery)

