#!/bin/sh
# Installe les skills front de l'équipe Mindstack dans ~/.claude/skills : Claude Code les utilise
# alors dans tous les projets de l'ordinateur. Rien n'est ajouté au projet en cours.
#
#   curl -fsSL https://raw.githubusercontent.com/mahery-oniniaina/mindstack-frontend-skills/main/install.sh | sh
#   curl -fsSL .../install.sh | sh -s -- --remplacer     (met à jour les skills déjà installés)
#   sh install.sh [--remplacer]                          (depuis un clone du dépôt)
set -e
REPO="mahery-oniniaina/mindstack-frontend-skills"
DEST="$HOME/.claude/skills"
REPLACE=0
[ "${1:-}" = "--remplacer" ] && REPLACE=1

# Depuis un clone : les skills sont à côté du script. Sinon (lien direct) : on télécharge l'archive.
SCRIPT_DIR=$(cd "$(dirname "$0")" 2>/dev/null && pwd || true)
if [ -n "$SCRIPT_DIR" ] && [ -f "$SCRIPT_DIR/install.sh" ] && [ -f "$SCRIPT_DIR/skills/impeccable/SKILL.md" ]; then
  SRC="$SCRIPT_DIR/skills"
else
  TMP=$(mktemp -d)
  trap 'rm -rf "$TMP"' EXIT
  echo "Téléchargement des skills…"
  curl -fsSL "https://github.com/$REPO/archive/refs/heads/main.tar.gz" | tar -xz -C "$TMP"
  SRC="$TMP/mindstack-frontend-skills-main/skills"
fi

mkdir -p "$DEST"
for dir in "$SRC"/*/; do
  name=$(basename "$dir")
  if [ -e "$DEST/$name" ]; then
    if [ "$REPLACE" = "1" ]; then
      rm -rf "$DEST/$name"
    else
      echo "déjà présent, gardé : $name"
      continue
    fi
  fi
  cp -R "$dir" "$DEST/$name"
  echo "installé : $name"
done
echo "Terminé : skills dans $DEST. Redémarre Claude Code, puis tape / pour les voir."
