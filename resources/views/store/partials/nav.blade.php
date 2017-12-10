<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand main-title" href="{{ route('home') }}"><font size=7> Empresa</font></a>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <p class="navbar-text"><font size=4>S.R.L.</font></p>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><font size=5>FAQS</font></a></li>
        @include('store.partials.menu-user')
      </ul>
    </div>
  </div>
</nav>