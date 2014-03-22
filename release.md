### Release Steps

update version in ADNActivities.podspec  
update the git tag to match the new version  
update README.md  

    pod lib lint

    git add -A && git commit -m "Release 1.0.0."
    git tag '1.0.0'
    git push --tags

