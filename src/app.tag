<app>

  <!-- layout -->
  <section>
    <header>
      <nav>
        <!-- 导航栏 -->
        <a href="#">首页</a>
        <a href="#about">About</a>
      </nav>
    </header>
    <article>
      <div id="mainview"></div>
    </article>
    <footer>
      <nav>
        <!-- Footer -->
      </nav>
    </footer>
  </section>

  <!-- 样式 -->
  <style></style>

  <!-- 代码 -->
  <script>
    // 所有的页面
    require('./components/views/about-view.tag');
    require('./components/views/index-view.tag');
    
    var self = this;
    self._currentView = null;

    var loadView = function(viewName, id) {
      if (self._currentView) {
        self._currentView.unmount(true);
      }
      self._currentView = riot.mountTo('div#mainview', viewName, {data: id})[0];
    }

    route = function(view, id) {
      switch(view) {
        case 'about':
          loadView('about-view');
          break;
        default:
          loadView('index-view');
        }

        self.update();
    }

    riot.route(route);

    self.on('mount', function() {
      riot.route.exec(route);
    });
  </script>
</app>
