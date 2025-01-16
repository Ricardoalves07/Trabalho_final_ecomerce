class Footer extends HTMLElement {
    connectedCallback () {
        this.innerHTML = `
        <footer>
            <div class="footer-content">
                <p>© 2025 Loja Online de Computação da Unilab</p>
                <ul>
                    <li><a href="politica_de_privacidade.html">Política de Privacidade</a></li>
                    <li><a href="termo_de_uso.html">Termos de Uso</a></li>
                    <li><a href="contato.html">Contato</a></li>
                </ul>
            </div>
        </footer>
        `
    }
}

customElements.define('footer-component', Footer)