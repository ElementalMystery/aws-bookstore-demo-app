import glob
import sys

vText = "//Liam Van Tilburg 1504818" 

for file in glob.glob("./src/**/*.ts", recursive=True):
    f = open(file)
    readline = f.readline().rstrip('\n')
    f.close()

    if(vText != readline):
        print('The following file has failed the comment check: ' + file)
        sys.exit(0)

print(1)