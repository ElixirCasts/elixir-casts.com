(function() {
  var template = Handlebars.template, templates = Ember.TEMPLATES = Ember.TEMPLATES || {};
templates['index'] = Ember.Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression, self=this;

function program1(depth0,data) {
  
  var buffer = "", stack1;
  buffer += "\n<li>";
  if (stack1 = helpers.item) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.item; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "</li>\n";
  return buffer;
  }

  buffer += "<ul>\n";
  stack1 = helpers.each.call(depth0, depth0.item, depth0['in'], depth0.model, {hash:{},inverse:self.noop,fn:self.program(1, program1, data),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n</ul>\n";
  return buffer;
  });
})();