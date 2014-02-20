(function($){
  $(document).on('ready page:load', function(){
    var FormEvents = _.extend({}, Backbone.Events)

    var Bricks = Backbone.Model.extend({
      validate : function(attrs, opts){
        if(!$.isNumeric(attrs.count)){
          return "Count is not numeric"
        }
        if(attrs.count < 0){
          return "Invalid count"
        }
      }
    })
    var BricksCollection = Backbone.Collection.extend({
      model : Bricks
    })
    
    var PartsFormOperator = Backbone.View.extend({
      events : {
        "click .button.plus" : "clickPlus"
      },
      clickPlus : function(){
        FormEvents.trigger("addBricksForm", this.$el)
      },
    })

    var BricksForm = PartsFormOperator.extend({
      className : "bricks",
      events : {
        "click .button.minus" : "remove",
      },
      bindings : {
        ".color" : "color",
        ".shape" : "shape",
        ".count" : "count"
      },
      initialize : function(){
        this.events = _.extend({},
          PartsFormOperator.prototype.events,
          this.events)
      },
      remove : function(){
        console.log("remove");
        this.$(":input").attr("disabled", "disabled")
        this.$el.hide()
      },
      render : function(){
        var template = $("#contents_form_template").clone()
        //template.find(".")
        this.$el.html(template.html())
        this.stickit()
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
        var opts = {
          model : new Bricks()
        }
        var bricksForm = new BricksForm(opts)
        this.$el.append(bricksForm.render().el)
        return bricksForm
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