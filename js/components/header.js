
class Header extends HTMLElement {
    connectedCallback() {
        this.innerHTML = `
        <header>
            <img src="../img/logo.png" alt="ECStore logo">
        
            <nav>
                <ul class="menu">
                    <li><a href="index.html">Início</a></li>
                    <li><a href="carrinho.html">Carrinho</a></li>
                    <li><a href="login.html">Login</a></li>
                    <li><a href="cadastro.html">Cadastro</a></li>
                </ul>
            </nav>

            <form id="pesquisa" action="busca.html">
                <input type="text" placeholder="Buscar produtos..." id="campo-pesquisa">
                <button type="submit" onclick="buscar()">Buscar</button>
            </form>
            
        </header>
        `
    }
}

customElements.define('header-component', Header)