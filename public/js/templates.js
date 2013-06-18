this["Ember"] = this["Ember"] || {};
this["Ember"]["TEMPLATES"] = this["Ember"]["TEMPLATES"] || {};

this["Ember"]["TEMPLATES"]["index"] = Ember.Handlebars.template(function anonymous(Handlebars,depth0,helpers,partials,data) {
this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Ember.Handlebars.helpers; data = data || {};
  var buffer = '', stack1, stack2, hashTypes, hashContexts, options, self=this, helperMissing=helpers.helperMissing;

function program1(depth0,data) {
  
  
  data.buffer.push("Updates");
  }

  data.buffer.push("<p>");
  hashTypes = {};
  hashContexts = {};
  options = {hash:{},inverse:self.noop,fn:self.program(1, program1, data),contexts:[depth0],types:["ID"],hashContexts:hashContexts,hashTypes:hashTypes,data:data};
  stack2 = ((stack1 = helpers.linkTo),stack1 ? stack1.call(depth0, "updates", options) : helperMissing.call(depth0, "linkTo", "updates", options));
  if(stack2 || stack2 === 0) { data.buffer.push(stack2); }
  data.buffer.push("</p>\n\n<h3>Submit a new standup</h3>\n<form method=POST action=/>\n  <p>\n    <label for=status>Status</label>\n    <select name=status id=status>\n      <option value=\"Green\">Green</option>\n      <option value=\"Yellow\">Yellow</option>\n      <option value=\"Red\">Red</option>\n    </select>\n  </p>\n  <p>\n    <label for=today>Today</label>\n    <textarea name=today id=today></textarea>\n  </p>\n  <p>\n    <label for=tomorrow>Tomorrow</label>\n    <textarea name=tomorrow id=tomorrow></textarea>\n  </p>\n  <p>\n    <label for=questions>Questions</label>\n    <textarea name=questions id=questions></textarea>\n  <p>\n    <label for=user>User</label>\n    <input name=user id=user />\n  </p>\n  <input type=submit />\n</form>");
  return buffer;
  
});

this["Ember"]["TEMPLATES"]["updates"] = Ember.Handlebars.template(function anonymous(Handlebars,depth0,helpers,partials,data) {
this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Ember.Handlebars.helpers; data = data || {};
  var buffer = '', stack1, stack2, hashTypes, hashContexts, options, escapeExpression=this.escapeExpression, self=this, helperMissing=helpers.helperMissing;

function program1(depth0,data) {
  
  
  data.buffer.push("Home");
  }

function program3(depth0,data) {
  
  var buffer = '', hashTypes, hashContexts;
  data.buffer.push("\n    <tr>\n      <td>");
  hashTypes = {};
  hashContexts = {};
  data.buffer.push(escapeExpression(helpers._triageMustache.call(depth0, "status", {hash:{},contexts:[depth0],types:["ID"],hashContexts:hashContexts,hashTypes:hashTypes,data:data})));
  data.buffer.push("</td>\n      <td>");
  hashTypes = {};
  hashContexts = {};
  data.buffer.push(escapeExpression(helpers._triageMustache.call(depth0, "today", {hash:{},contexts:[depth0],types:["ID"],hashContexts:hashContexts,hashTypes:hashTypes,data:data})));
  data.buffer.push("</td>\n      <td>");
  hashTypes = {};
  hashContexts = {};
  data.buffer.push(escapeExpression(helpers._triageMustache.call(depth0, "tomorrow", {hash:{},contexts:[depth0],types:["ID"],hashContexts:hashContexts,hashTypes:hashTypes,data:data})));
  data.buffer.push("</td>\n      <td>");
  hashTypes = {};
  hashContexts = {};
  data.buffer.push(escapeExpression(helpers._triageMustache.call(depth0, "questions", {hash:{},contexts:[depth0],types:["ID"],hashContexts:hashContexts,hashTypes:hashTypes,data:data})));
  data.buffer.push("</td>\n      <td>");
  hashTypes = {};
  hashContexts = {};
  data.buffer.push(escapeExpression(helpers._triageMustache.call(depth0, "user", {hash:{},contexts:[depth0],types:["ID"],hashContexts:hashContexts,hashTypes:hashTypes,data:data})));
  data.buffer.push("</td>\n    </tr>\n  ");
  return buffer;
  }

  data.buffer.push("<p>");
  hashTypes = {};
  hashContexts = {};
  options = {hash:{},inverse:self.noop,fn:self.program(1, program1, data),contexts:[depth0],types:["ID"],hashContexts:hashContexts,hashTypes:hashTypes,data:data};
  stack2 = ((stack1 = helpers.linkTo),stack1 ? stack1.call(depth0, "index", options) : helperMissing.call(depth0, "linkTo", "index", options));
  if(stack2 || stack2 === 0) { data.buffer.push(stack2); }
  data.buffer.push("</p>\n\n<table border=1 cellpadding=5 width=100%>\n  <tr>\n    <th>Status</th>\n    <th>Today</th>\n    <th>Tomorrow</th>\n    <th>Questions</th>\n    <th>User</th>\n  </tr>\n  ");
  hashTypes = {};
  hashContexts = {};
  stack2 = helpers.each.call(depth0, "standups", {hash:{},inverse:self.noop,fn:self.program(3, program3, data),contexts:[depth0],types:["ID"],hashContexts:hashContexts,hashTypes:hashTypes,data:data});
  if(stack2 || stack2 === 0) { data.buffer.push(stack2); }
  data.buffer.push("\n</table>\n");
  return buffer;
  
});