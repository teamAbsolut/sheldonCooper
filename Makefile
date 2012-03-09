default:
	BRANCH=`git config user.name | sed 's/ //g'`'challenge'
	git checkout -b $BRANCH
	mv lib/* ./
	rm Makefile Rakefile main.rb sheldon_cooper.rb xake.cc xake.exe
	rm -r lib
	git add .
	git commit -m "Let's get this started!"
	git push origin $BRANCH
