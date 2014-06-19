(function() {
  var desktop = true;
  var $, Backbone, ConsoleLogger,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __slice = [].slice;

  Backbone = window.Backbone;

  $ = Backbone.$ || window.$;

  $.fn.backbone = function(option) {
    var elem;
    if (option == null) {
      option = 'this';
    }
    switch (option) {
      case 'this':
        return this.data('_backbone_view') || null;
      case 'closest':
        elem = this;
        while (!elem.data('_backbone_view')) {
          elem = elem.parent();
          if (elem.size() === 0) {
            return null;
          }
        }
        return elem.data('_backbone_view');
      case 'parent':
        return this.parent().backbone('closest');
    }
  };

  ConsoleLogger = (function() {

    function ConsoleLogger() {}

    ConsoleLogger.prototype.log = function(type, object, details) {
      if (desktop) {
        var name = typeof object === "object" ? object.constructor.name : object;
        var notification = notify.createNotification(name + " " + type, {icon: 'null', tag: details, body: details})
        setTimeout(function(){notification.close()}, 10000);
      } else {
        return console.log("[" + type + "]", details, ":", object);
      }
    };

    return ConsoleLogger;

  })();

  Backbone.Debug = (function() {

    function Debug() {
      this._prettyInstanceName = __bind(this._prettyInstanceName, this);

      this._hookConstructor = __bind(this._hookConstructor, this);

      this._hookPrototype = __bind(this._hookPrototype, this);

      this._hookMethod = __bind(this._hookMethod, this);

      this._onSync = __bind(this._onSync, this);

      this._onEvent = __bind(this._onEvent, this);

      this._onViewBinding = __bind(this._onViewBinding, this);

      this._onNewInstance = __bind(this._onNewInstance, this);

      this._trackViewBinding = __bind(this._trackViewBinding, this);

      this._hookSync = __bind(this._hookSync, this);

      this._hookEvents = __bind(this._hookEvents, this);

      this._trackObjects = __bind(this._trackObjects, this);

      this.off = __bind(this.off, this);

      this.on = __bind(this.on, this);

      this.routers = __bind(this.routers, this);

      this.views = __bind(this.views, this);

      this.models = __bind(this.models, this);

      this.collections = __bind(this.collections, this);
      this._options = {
        'log:events': true,
        'log:sync': true,
        'log:instances': true,
        'log:views': true
      };
      this._objects = {
        Collection: {},
        Model: {},
        View: {},
        Router: {}
      };
      this.logger = new ConsoleLogger();
      this._trackObjects();
      this._hookEvents();
      this._hookSync();
      this._trackViewBinding();
    }

    Debug.prototype.collections = function() {
      return this._objects.Collection;
    };

    Debug.prototype.models = function() {
      return this._objects.Model;
    };

    Debug.prototype.views = function() {
      return this._objects.View;
    };

    Debug.prototype.routers = function() {
      return this._objects.Router;
    };

    Debug.prototype.on = function(option) {
      if (option != null) {
        this._options[option] = true;
      } else {
        for (option in this._options) {
          this._options[option] = true;
        }
      }
      return this;
    };

    Debug.prototype.off = function(option) {
      if (option != null) {
        this._options[option] = false;
      } else {
        for (option in this._options) {
          this._options[option] = false;
        }
      }
      return this;
    };

    Debug.prototype._trackObjects = function() {
      this._hookConstructor('Collection', this._onNewInstance);
      this._hookConstructor('Model', this._onNewInstance);
      this._hookConstructor('View', this._onNewInstance);
      return this._hookConstructor('Router', this._onNewInstance);
    };

    Debug.prototype._hookEvents = function() {
      this._hookPrototype('Collection', 'trigger', this._onEvent);
      this._hookPrototype('Model', 'trigger', this._onEvent);
      this._hookPrototype('View', 'trigger', this._onEvent);
      return this._hookPrototype('Router', 'trigger', this._onEvent);
    };

    Debug.prototype._hookSync = function() {
      return this._hookMethod('sync', this._onSync);
    };

    Debug.prototype._trackViewBinding = function() {
      return this._hookPrototype('View', 'setElement', this._onViewBinding);
    };

    Debug.prototype._onNewInstance = function(type, method, object) {
      var name;
      name = this._prettyInstanceName(object, type);
      this._objects[type][name] = object;
      if (this._options['log:instances']) {
        return this.logger.log('instance', name, type);
      }
    };

    Debug.prototype._onViewBinding = function(type, method, object) {
      var name;
      object.$el.data('_backbone_view', object);
      name = this._prettyInstanceName(object, type);
      if (this._options['log:views']) {
        return this.logger.log('view', name, object.el);
      }
    };

    Debug.prototype._onEvent = function(type, method, object, args) {
      if (this._options['log:events']) {
        return this.logger.log('event', object, args[0]);
      }
    };

    Debug.prototype._onSync = function(method, object, args) {
      if (this._options['log:sync']) {
        return this.logger.log('sync', args[1], args[0]);
      }
    };

    Debug.prototype._hookMethod = function(method, action) {
      var original;
      original = Backbone[method];
      return Backbone[method] = function() {
        var ret;
        ret = original.apply(this, arguments);
        action(method, this, arguments);
        return ret;
      };
    };

    Debug.prototype._hookPrototype = function(object, method, action) {
      var original;
      original = Backbone[object].prototype[method];
      return Backbone[object].prototype[method] = function() {
        var ret;
        ret = original.apply(this, arguments);
        action(object, method, this, arguments);
        return ret;
      };
    };

    Debug.prototype._hookConstructor = function(object, action) {
      var originalExtend;
      this._hookPrototype(object, 'constructor', action);
      originalExtend = Backbone[object].extend;
      return Backbone[object].extend = function() {
        var args, originalConstructor;
        args = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
        args[0] || (args[0] = {});
        if (hasOwnProperty.call(args[0], 'constructor')) {
          originalConstructor = args[0].constructor;
        } else {
          originalConstructor = this;
        }
        args[0].constructor = eval("(function " + object + "() {          var ret = originalConstructor.apply(this, arguments);          action(object, 'extend', this, arguments);          return ret;        })");
        return originalExtend.apply(this, args);
      };
    };

    Debug.prototype._prettyInstanceName = function(object, type) {
      var name;
      name = object.constructor.name || type;
      if (object.cid) {
        name = "" + name + ":" + object.cid;
      }
      return name;
    };

    return Debug;

  })();

  Backbone.debug = new Backbone.Debug();

}).call(this);
