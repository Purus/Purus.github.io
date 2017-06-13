pushd public
git rm -rf *
popd

hugo

pushd public

echo purusothaman.me >> CNAME

git add *
git commit -m "Deploy Site"
popd
git push origin master