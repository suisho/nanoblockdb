(function($){
  $(document).on('ready page:load', function(){
    var FormEvents = _.extend({}, Backbone.Events)

    var Bricks = Backbone.Model.extend({
    })

    var BricksForm = Backbone.View.extend({
      className : "bricks",
      model : Bricks,
      events : {
        "click .button.minus" : "remove",
        "click .button.plus" : "clickPlus"
      },
      remove : function(){
        console.log("remove");
        this.$(":input").attr("disabled", "disabled")
        this.$el.hide()
      },
      clickPlus : function(){
        FormEvents.trigger("addBricksForm", this.$el)
      },
      render : function(){
        var template = $("#contents_form_template").clone()
        //template.find(".")
        this.$el.html(template.html())
        return this
      },
    })

    var PartsFormContainer = Backbone.View.extend({
      initialize : function(){
        this.addBricksForm()
        this.delegateEvents(this.events)
        var self = this;
        FormEvents.on('addBricksForm', function(template){
          self.addBricksForm(template)
        })
      },
      addBricksForm : function(template){
        var opts = {}
        var bricksForm = new BricksForm(opts)
        this.$el.append(bricksForm.render().el)
        return bricksForm
      }
    })

    var PartsFormOperator = Backbone.View.extend({
      events : {
        "click .button.plus" : "clickPlus"
      },
      clickPlus : function(){
        FormEvents.trigger("addBricksForm", this.$el)
      }
    })

    // Do Application
    var App = Backbone.View.extend({
      initialize : function(){
        // init
        this.partsFormContainer = new PartsFormContainer({
          el : "#package_form_container .parts_form_container"
        })
        this.partsFormOperator = new PartsFormOperator({
          el : "#package_form_container .parts_form_operatior"
        })

      }
    })
    var app = new App()

  })
})(jQuery)