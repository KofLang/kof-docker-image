# kof-docker-image

<p align="center">
  <img src="https://raw.githubusercontent.com/KofLang/Kof4j/main/kof.png" alt="Kof Logo" width="150">
</p>

### Uma imagem Docker. Sem complicação. Sem frescura.

**Build automático. Atualização semanal. Sem precisar criar conta em lugar nenhum.**
**Última atualização:** 27 de agosto de 2026
**Versão:** 0.1.10-beta
---

> Algumas pessoas querem rodar Kof e acabam passando 2 horas
> configurando JDK, baixando release, descompactando...
>
> Outras tentam criar imagem Docker e desistem na hora do push.
>
> Eu olhei para isso e pensei:
>
> **"Tem que ser mais simples."**

E foi.

---

# O que é isso?

É uma imagem Docker do **Kof** — a linguagem que compila para JVM, nativo, script e web, tudo partindo da mesma fonte.

A imagem é construída automaticamente a cada release do [Kof4j](https://github.com/KofLang/Kof4j), usando GitHub Actions e publicada no **GitHub Container Registry** (ghcr.io).

**Não precisa criar conta no DockerHub.**
**Não precisa configurar token.**
**Não precisa fazer nada.**

Só puxa e roda.

---

# Como usar

```bash
docker pull ghcr.io/koflang/kof:latest
docker run -it ghcr.io/koflang/kof
```

Pronto. Você já tem o Kof rodando.

---

# Build automático

O build acontece automaticamente quando:

| Trigger | O que acontece |
|---------|----------------|
| Push na branch `main` | Build e push da imagem |
| Release no [Kof4j](https://github.com/KofLang/Kof4j) | Build com a nova versão |
| **Verificação semanal** (toda segunda às 8h UTC) | Checa se saiu release nova e, se sim, builda |

Você não precisa fazer nada. Se o Kof foi atualizado, a imagem já está lá.

---

# Build local

Se quiser buildar na sua máquina:

```bash
git clone https://github.com/KofLang/kof-docker-image.git
cd kof-docker-image
docker build -t kof:local .
docker run -it kof:local
```

---

# O que tem dentro

| Componente | Versão |
|------------|--------|
| Ubuntu | 22.04 LTS |
| Java (OpenJDK) | 21 |
| Kof | Última release disponível |

---

# Tags disponíveis

| Tag | Descrição |
|-----|-----------|
| `latest` | Sempre a versão mais recente |
| `20260824-014538` | Build com timestamp (rastreabilidade) |

---

# Arquitetura

```text
Push/Release/Semanal
        │
        ▼
  GitHub Actions
        │
        ▼
  Build Dockerfile
        │
        ▼
  ghcr.io/koflang/kof:latest
```

Sem intermediários. Sem loops. Sem dor de cabeça.

---

# FAQ

**Q: Preciso criar conta no DockerHub?**
R: Não. A imagem fica no GitHub Container Registry, que já vem com o repo.

**Q: Preciso configurar secrets?**
R: Não. O `GITHUB_TOKEN` já é fornecido pelo GitHub.

**Q: E se eu quiser uma versão específica?**
R: `docker pull ghcr.io/koflang/kof:20260824-014538` (com o timestamp do build).

**Q: A imagem é atualizada quando o Kof é atualizado?**
R: Sim. Toda segunda-feira o workflow checa se saiu release nova e builda automaticamente.

---

# Licença

MIT

**Kof** é distribuído sob [GNU General Public License v3.0](https://github.com/KofLang/Kof4j/blob/main/LICENSE).

Esta imagem Docker segue a mesma licença.

---

**kof-docker-image**

*Uma imagem. Sem complicação. Sem frescura.*
