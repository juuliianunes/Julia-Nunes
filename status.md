---
title: Status — {{nome-do-projeto}}
type: status
client: {{cliente}}
project: {{cliente}}-{{slug}}
tags: [status, andamento, bloqueios]
updated: 2026-07-14
---

# Status — {{nome-do-projeto}}

> Documento **vivo**: reflete o estado atual, sempre. Atualizar a cada mudança relevante (e atualizar o `updated:` do frontmatter). Histórico fica no log ao final — nunca apagar entradas antigas.

## Etapa atual do ciclo de vida

Marcar `[x]` nas concluídas e `→` na etapa atual (ver `docs/workflow.md`, seção 3):

- [ ] 1. ENTRADA — `clients/{{cliente}}/` criado e preenchido
- [ ] → 2. ABERTURA — projeto criado a partir de `_template/`, `brief.md` preenchido e aprovado
- [ ] 3. DISCOVERY — avatar, concorrência e dados existentes em `research/`
- [ ] 4. ESTRATÉGIA — oferta, mensagem, funil e wireframe aprovados
- [ ] 5. PRODUÇÃO — copy → design → dev (paralelo com ads e automações)
- [ ] 6. QA — checklists completos, evidências em `qa/`
- [ ] 7. DEPLOY — SOP de deploy seguido, registro em `delivery/`
- [ ] 8. MEDIÇÃO — análises datadas em `analytics/`
- [ ] 9. OTIMIZAÇÃO — hipóteses → variações /v1, /v2
- [ ] 10. FECHAMENTO — `learnings.md` destilado, projeto movido para `archive/`

## Resumo do estado

{{2-4-frases-o-que-esta-feito-o-que-esta-em-andamento-o-que-vem-a-seguir}}

## Bloqueios

> O que trava o projeto agora e **quem** destrava. Sem bloqueios? Escrever "Nenhum".

| Bloqueio | Trava o quê | Quem resolve | Desde | Ação em andamento |
|---|---|---|---|---|
| {{ex-acesso-ao-ga4-nao-concedido}} | {{ex-discovery-de-dados}} | {{cliente-ou-responsavel}} | {{data}} | {{ex-cobrado-por-email-em-data}} |

## Próximos passos

| # | Ação | Responsável | Prazo |
|---|---|---|---|
| 1 | {{proxima-acao-concreta}} | {{agente-ou-pessoa}} | {{data}} |
| 2 | {{acao-seguinte}} | {{responsavel}} | {{data}} |
| 3 | {{acao-seguinte}} | {{responsavel}} | {{data}} |

## Log de atualizações

> Mais recente no topo. Uma linha por atualização: o que mudou e por quê.

- **2026-07-14** — Projeto aberto a partir de `projects/_template/`. Brief em preenchimento.
- **{{data}}** — {{o-que-mudou}}
