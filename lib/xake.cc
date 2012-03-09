#include <stdlib.h>
#include <iostream>
#include <fstream>
#include <string>

using namespace std;

int main () {
    system("git config user.name | sed 's/ //g' | sed 's/$/challenge/' > branch_name");

    ifstream ifile;
    ifile.open ("branch_name");
    string branch_name;
    getline (ifile, branch_name);

    string command = "git checkout -b ";
    command.append(branch_name);
    system(command.c_str());

    system("mv lib/* ./");
    system("rm branch_name xake.exe Makefile Rakefile xake.cc main.rb sheldon_cooper.rb");
    system("rm -r lib");
    system("git add -A");
    system("git commit -m \"Let's get this started!\"");

    command = "git push origin ";
    command.append(branch_name);
    system(command.c_str());

    ifile.close();
    return 0;
}
