# Skills front de l'équipe Mindstack

18 skills pour [Claude Code](https://claude.com/claude-code) qui aident à concevoir, critiquer et peaufiner une interface web. Une fois installés, l'agent les utilise tout seul quand la demande s'y prête, ou quand on les appelle par leur nom (`/impeccable`, par exemple).

Ils s'installent **dans ton dossier utilisateur** (`~/.claude/skills`) : ils marchent dans tous tes projets, et rien n'est ajouté au dépôt du projet sur lequel tu travailles.

## Le plus simple : demander à ton agent

Colle cette phrase dans Claude Code :

> Installe les skills front de https://github.com/mahery-oniniaina/mindstack-frontend-skills en suivant son README : dans mon dossier utilisateur (`~/.claude/skills`), pas dans le projet en cours, sans écraser un skill que j'ai déjà. Puis dis-moi de redémarrer Claude Code.

## Installer soi-même

### Windows (PowerShell)

Ouvre **PowerShell** (menu Démarrer, tape « PowerShell ») et colle :

```powershell
irm https://raw.githubusercontent.com/mahery-oniniaina/mindstack-frontend-skills/main/install.ps1 | iex
```

Les skills arrivent dans `C:\Users\<toi>\.claude\skills\`.

Pour **mettre à jour** des skills déjà installés :

```powershell
$env:REMPLACER = '1'; irm https://raw.githubusercontent.com/mahery-oniniaina/mindstack-frontend-skills/main/install.ps1 | iex
```

### Mac et Linux (terminal)

```sh
curl -fsSL https://raw.githubusercontent.com/mahery-oniniaina/mindstack-frontend-skills/main/install.sh | sh
```

Pour **mettre à jour** :

```sh
curl -fsSL https://raw.githubusercontent.com/mahery-oniniaina/mindstack-frontend-skills/main/install.sh | sh -s -- --remplacer
```

### Avec Git

```sh
git clone https://github.com/mahery-oniniaina/mindstack-frontend-skills.git
cd mindstack-frontend-skills
```

Puis `sh install.sh` (Mac, Linux) ou `powershell -ExecutionPolicy Bypass -File .\install.ps1` (Windows). Ajoute `--remplacer` (ou `-Remplacer` sous Windows) pour mettre à jour.

### À la main

Copie chaque dossier de `skills/` dans `~/.claude/skills/` (Windows : `C:\Users\<toi>\.claude\skills\`).

### Vérifier

Redémarre Claude Code, puis tape `/` : les skills apparaissent dans la liste. Un skill du même nom que tu avais déjà est **gardé** : utilise l'option de mise à jour pour le remplacer.

## Les skills

Dans un projet, les règles du dépôt passent avant les skills. Pour Terra Nova, c'est `docs/FRONT.md` : thème, polices, composants à réutiliser, emplacement des pages. Demande à l'agent de lire ce fichier avant d'appliquer un skill.

| Skill | À quoi il sert |
|---|---|
| `impeccable` | Concevoir, critiquer, auditer et peaufiner une interface : hiérarchie, typographie, couleurs, accessibilité, responsive, états, animations. **Le principal, à utiliser en premier.** |
| `taste-skill` | Éviter le rendu « générique IA » sur les pages vitrines (accueil, landing) |
| `design-system` | Jetons (couleurs, espacements, typographie) et spécifications de composants |
| `ui-styling` | Composants shadcn/ui, Tailwind, thèmes, mode sombre, accessibilité |
| `emil-design-eng` | Finition et petits détails qui donnent une impression de qualité |
| `apple-design` | Interactions fluides : gestes, ressorts, transitions interruptibles, typographie |
| `animate` | Construire une animation de A à Z : faut-il animer, courbe, durée, interruption |
| `review-animations` | Relire du code d'animation avec un haut niveau d'exigence |
| `improve-animations` | Auditer toutes les animations d'un projet et proposer un plan d'amélioration |
| `find-animation-opportunities` | Repérer où une animation aiderait vraiment, sans rien modifier |
| `animation-vocabulary` | Retrouver le nom exact d'un effet d'animation pour bien formuler une demande |
| `ask-sonner` | Notifications (« toasts ») avec la bibliothèque Sonner |
| `pick-ui-library` | Choisir une bibliothèque front adaptée à une tâche (en équipe : aucune dépendance sans accord) |
| `prototype` | Plusieurs versions vraiment différentes d'un même bloc, pour choisir |
| `soft-skill` | Rendu « agence haut de gamme » : polices, espacements, ombres, animations |
| `brand` | Voix de marque, identité visuelle, cohérence des textes |
| `minimalist-skill` | Style éditorial clair et épuré (monochrome chaud, contrastes typographiques) |
| `output-skill` | Oblige l'agent à écrire le code complet, sans « … » ni raccourci |

## Exemples de demandes

- « Lis `docs/FRONT.md`, puis utilise impeccable pour auditer la page `/dashboard` : hiérarchie, contraste, mobile 375 px. Corrige sans changer le thème. »
- « Avec taste-skill, propose 3 améliorations de l'accueil qui restent dans la direction graphique actuelle. »
- « review-animations sur `src/css/home.css` : vérifie aussi le mode mouvement réduit. »

## Avec un autre assistant que Claude Code

Les skills sont de simples fichiers Markdown (`skills/<nom>/SKILL.md`, plus des fichiers de référence). Cursor, Copilot, Codex ou un autre assistant peut s'en servir si on lui demande de lire le `SKILL.md` concerné avant de travailler sur l'interface.

## Scripts facultatifs

`design-system`, `ui-styling`, `brand` et `impeccable` contiennent des scripts (Node.js, Python) que l'agent peut lancer pour des tâches précises : générer des jetons, détecter des défauts. Ils ne sont pas nécessaires au fonctionnement des skills. Pour `ui-styling`, lance `pip install -r skills/ui-styling/scripts/requirements.txt` si l'agent le demande.

## Crédits

Ces skills sont regroupés ici pour l'usage de l'équipe Mindstack. Les droits restent à leurs auteurs.

| Skills | Auteur ou origine | Licence |
|---|---|---|
| `impeccable` | Paul Bakaus, [impeccable.style](https://impeccable.style) | Apache 2.0 |
| `brand`, `design-system`, `ui-styling` | ClaudeKit | indiquée dans chaque skill (MIT ; Apache 2.0 pour `ui-styling/LICENSE.txt`) |
| `emil-design-eng`, `animate`, `review-animations`, `improve-animations`, `find-animation-opportunities`, `animation-vocabulary`, `apple-design`, `ask-sonner`, `pick-ui-library`, `prototype` | D'après la philosophie de design d'Emil Kowalski ([emilkowal.ski](https://emilkowal.ski)) | non précisée |
| `taste-skill`, `soft-skill`, `minimalist-skill`, `output-skill` | Collection « taste-skill » | non précisée |

Un auteur qui souhaite le retrait de son travail peut ouvrir une issue : il sera retiré.
