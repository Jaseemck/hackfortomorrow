import Link from 'next/link';

const Navbar = () => (
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <Link href="/" ><a class="navbar-brand">Blockchain Fund System</a></Link>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <Link href="/"><a class="nav-link">Home <span class="sr-only">(current)</span></a></Link>
      </li>
      <li class="nav-item">
      <Link href="/about"><a class="nav-link">About <span class="sr-only">(current)</span></a></Link>
      </li>
    </ul>
  </div>
</nav>

);

export default Navbar;