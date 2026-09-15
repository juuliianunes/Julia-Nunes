---
title: Brief — Portfólio Julia Nunes
type: brief
client: julia-nunes
project: julia-nunes-portfolio
tags: [brief, portfolio, site, identidade]
updated: 2026-09-15
---

# Brief — Portfólio Julia Nunes

> Fonte de verdade do projeto. Nada aqui é inventado. O que falta está marcado como `[PLACEHOLDER]`.

## 1. Contexto

- **Quem é:** Julia Nunes, designer de lançamentos e produtos digitais.
- **O que motivou:** ela não tinha uma página própria que mostrasse o tamanho da entrega.
  "Web Designer" continua valendo como cargo (LinkedIn/Instagram), mas o site vende algo maior:
  a direção visual que atravessa toda a campanha.
- **Posicionamento adotado no site:** *Julia Nunes — Designer para Lançamentos & Produtos Digitais*.

## 2. Objetivo

Página única de portfólio que desperte interesse em infoprodutores e gere conversa
(CTA único: "falar sobre meu projeto").

## 3. Escopo entregue

- Landing page estática em `dev/site/index.html` (HTML + CSS + JS, sem build, sem dependências).
- 19 assets tratados em `dev/site/assets/`, gerados por `dev/build-assets.ps1`.
- Design system de referência em `design-system/julia-nunes-portfolio/MASTER.md`
  (gerado pela skill `ui-ux-pro-max`).

## 4. Diretrizes de marca

| Item | Valor |
|---|---|
| Rosa (preenchimento, grafismo, texto sobre escuro) | `#EB6FBA` |
| Rosa escuro (texto sobre claro — 5.4:1) | `#C2277E` |
| Preto / quase-preto | `#101012` · seção escura `#0A0A0B` |
| Cinzas de fundo | `#F5F5F7` · rosa claro `#FBF0F6` |
| Tipografia | Inter Tight (títulos) + Inter (texto) |
| Referência de estilo | minimalismo Apple: tipo grande, muito ar, uma cor de destaque |

**Regra de contraste:** `#EB6FBA` sobre branco dá 2.8:1 e **reprova em AA**. Por isso o rosa nunca
carrega texto sobre fundo claro — para isso existe `#C2277E`. Botão rosa usa texto quase-preto.

## 5. Copy

Copy final entregue pela Julia, aplicada literalmente. As frases de comentário do texto original
("Aqui eu deixaria…", "Visualmente, essa dobra poderia mostrar…", "E fecharia com:") são notas de
raciocínio, não copy, e ficaram de fora.

## 6. Projetos exibidos

A seção "Trabalhos" é uma galeria: cada card é 1 cliente/produto, e ao clicar abre um
lightbox com o print completo. Quando o projeto tem mais de uma peça (landing page +
avatar, banner, capa etc.), o lightbox mostra uma trilha de miniaturas para navegar entre
elas — nunca leva ao site ao vivo, só ao print/arte.

| # | Cliente | Projeto | Peças no lightbox |
|---|---|---|---|
| 01 | Itália da Giulia | Curso Básico de Italiano | Landing page + capa YouTube + avatar + banner de checkout + 6 peças de campanha + grade de capas dos destaques (11 itens) |
| 02 | Metaforando | Protocolo Autoridade Magnética | Landing page + capa do produto + avatar + capa YouTube |
| 03 | Áurea | Ágora | Landing page (print `lp ágora.png`; sem URL — `[PLACEHOLDER]`) |
| 04 | Candy4Fit | CreaCandy | Landing page |
| 05 | Celip | Ômega 3 | Landing page (sem URL) |
| 06 | Celip | Creatina Gummies | Landing page (sem URL) |
| 07 | Celip | Magnésio Quarteto | Landing page (sem URL) |
| 08 | Celip | Protocolo MyCelip | Landing page (sem URL) |
| 09 | Atacadão Maromba | Franquia | Landing page (sem URL) |
| 10 | Otelmo Drebes | Propulsor de Negócios | Landing page (sem URL) |
| 11 | Tony Diniz | Pobreza é Opção | Landing page (sem URL) |
| 12 | Histórias da Cidade | Livro Infantil Personalizado | Landing page (sem URL) |

Dados vivem em `const PROJETOS` no `<script>` de `index.html`. URL vazia em um item = o
"Ver ao vivo" some só para aquele item, nada é inventado. Cada item pode levar `full:true`:
só o print de página inteira rola (scroll vertical); avatar, banner, capa e peças de
campanha aparecem inteiros, sem rolagem, encolhidos para caber no modal.

**Andressa Ducosta — ainda não incluída.** Só temos banners de checkout dela em anexo,
não o print da landing page inteira. Falta a imagem completa (ou uma URL ao vivo
confirmada) para criar o card sem inventar o que a página mostra.

## 7. Pendências — `[PLACEHOLDER]`

Todas moram no objeto `CFG`, no topo do `<script>` de `index.html`. Campo vazio faz o link
desaparecer da página, então nada quebra e nada é inventado.

- `CFG.contato` — destino de **todos** os CTAs (WhatsApp ou e-mail).
- `CFG.projetos.agora` — URL do Ágora (CBI e PAM já preenchidos e verificados).
- `CFG.social` — Instagram, LinkedIn e e-mail do rodapé.

## 8. Deploy

`[PLACEHOLDER]` — domínio e repositório ainda não definidos. A página é estática e independente:
basta subir a pasta `dev/site/` inteira.
