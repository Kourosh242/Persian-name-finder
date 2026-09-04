#!/usr/bin/env bash
# ─────────────────────────────────────────────────────────────────────────────
#  publish-wiki.sh — انتشار محتوای پوشهٔ wiki/ روی «ویکی رسمی گیت‌هاب» مخزن
#
#  سورس صفحات ویکی در wiki/*.md نگهداری می‌شود و این اسکریپت آن‌ها را در
#  https://github.com/Kourosh242/Persian-name-finder/wiki منتشر می‌کند.
#
#  پیش‌نیاز (فقط بار اول):
#    تب Wiki مخزن ➜ «Create the first page» ➜ Save
#    (گیت‌هاب مخزن .wiki.git را تنها پس از ساخت اولین صفحه ایجاد می‌کند)
#
#  اجرا:
#    ./scripts/publish-wiki.sh
# ─────────────────────────────────────────────────────────────────────────────
set -euo pipefail

REPO_OWNER="Kourosh242"
REPO_NAME="Persian-name-finder"
WIKI_URL="https://github.com/${REPO_OWNER}/${REPO_NAME}.wiki.git"

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC_DIR="${ROOT_DIR}/wiki"
TMP_DIR="$(mktemp -d)"
trap 'rm -rf "${TMP_DIR}"' EXIT

echo "📖 انتشار ویکی ${REPO_OWNER}/${REPO_NAME}"
echo "   منبع: ${SRC_DIR}"

if ! git clone --quiet "${WIKI_URL}" "${TMP_DIR}/wiki" 2>/dev/null; then
  cat <<EOF

❌ مخزن ویکی پیدا نشد: ${WIKI_URL}

   یعنی هنوز هیچ صفحه‌ای در ویکی مخزن ساخته نشده است.
   یک بار به آدرس زیر بروید و اولین صفحه را بسازید (هر متنی) و Save کنید:

     https://github.com/${REPO_OWNER}/${REPO_NAME}/wiki/_new

   سپس دوباره این اسکریپت را اجرا کنید.

EOF
  exit 1
fi

cp "${SRC_DIR}"/*.md "${TMP_DIR}/wiki/"

cd "${TMP_DIR}/wiki"
if git diff --quiet && git diff --cached --quiet && [ -z "$(git status --porcelain)" ]; then
  echo "✅ ویکی از قبل به‌روز است — تغییری برای انتشار نیست."
  exit 0
fi

git add -A
git commit -qm "docs: sync wiki from repository wiki/ folder"
git push --quiet origin HEAD

echo "✅ ویکی منتشر شد: https://github.com/${REPO_OWNER}/${REPO_NAME}/wiki"
