task :default do
  branch = `git config user.name | tr '\n' ' ' | sed 's/\s//g'` + 'challenge'
  `git checkout -b #{branch}`
  `mv lib/* ./`
  `rm Makefile Rakefile main.cc SheldonCooper.cc xake.cc xake.exe`
  `rm -r lib`
  `git add -A`
  `git commit -m "Let's get this started!"`
  `git push origin #{branch}`
end
