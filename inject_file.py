#!/usr/bin/python3

import sys
def update(filename, offset, text):
    fro = open(filename, "rb")
    frw = open(filename, "r+b")
    fro.seek(offset-2, 0)
    frw.seek(offset-2, 0)
    fStr = fro.read()
    fro.close()

    frw.write(text)
    frw.write(fStr[:])

    frw.truncate()
    frw.close()

def preprocess_json_file(filename):
    import re
    fh = open(filename, 'r+b' )
    data = fh.read()
    
    for item in re.finditer(b'{' , data ) :
        start = item.start()
        break
    for item in re.finditer(b'}' , data ) :
        end= item.end()
    
    fh.seek(0)
    fh.write(data[start:end])
    fh.truncate()
    fh.close()
         
def get_pattern_offset(filename, pattern):
    import re
    locs = []
    p1=pattern.replace('(', '\(')
    p2=p1.replace(')', '\)')
    p3=p2.replace('.', '\.')
    p4=p3.replace('[', '\[')
    p5=p4.replace(']', '\]')
    p6=p5.replace('+', '\+')
    p7=p6.replace('*', '\*')
    p8=p7.replace('|', '\|')
    pat = re.compile( p8.encode(), re.MULTILINE )
    fh = open(filename, 'rb' )
    data = fh.read()
    for item in re.finditer(pat, data) :
        locs.append(item.start())
        locs.append(item.end())

    if len(locs)==2:
        current_line = 0
        fh.seek(0)
        while fh.tell() < locs[1]:
            fh.readline()
            current_line += 1
        fh.close()
        locs.append(current_line)

        return locs
    else:
        fh.close()
        return None

def get_pattern_all_offsets(filename, pattern):
    import re
    locs = []
   
    pat = re.compile( pattern.encode(), re.MULTILINE )
    fh = open(filename, 'rb' )
    data = fh.read()
    for item in re.finditer(pat, data) :
        current_line = 0
        fh.seek(0)
        while fh.tell() <= item.start():
            fh.readline()
            current_line += 1
        locs.append({"soffset":item.start(), "eoffset":item.end(), "line":current_line})
    
    fh.close()
    return locs
    
def get_snippet_at_offset(filename, offset, length):
    fr = open(filename, "rb")
    fr.seek(offset,0)
    snippet = fr.read(length)
    fr.close()
    return snippet.decode()

def get_line_at_offset(filename, offset):
    current_line = 0
    fh = open(filename, "r", encoding="utf-8", errors="ignore")
    fh.seek(0)
    while fh.tell() <= offset:
            fh.readline()
            current_line += 1
    fh.close()
    return current_line

def get_lines_between_offsets(filename, soffset,eoffset):
    current_line = 0
    lines = []
    fh = open(filename, "r")
    fh.seek(0)
    while fh.tell() < soffset:
            fh.readline()
            current_line += 1
    
    lines.append(current_line)
    while fh.tell() < eoffset:
            fh.readline()
            current_line += 1
            lines.append(current_line)
    fh.close()
    return lines


def get_snippet_at_line(filename, lineno):
    current_line = 0
    fr = open(filename, "r", encoding="utf-8", errors="ignore")
    fr.seek(0)
    while current_line <lineno:
            snippet = fr.readline()
            current_line += 1
    fr.close()
    return snippet

def adjust_injected_loc(locs, new_injected_loc, bug_snip_len):
    for i in range(len(locs)):
        if locs[i]['loc'] >= new_injected_loc:
            locs[i]['loc']= locs[i]['loc'] + bug_snip_len
    
    return locs

def printUsage(prog):
    print("%s <interface>" % prog)

if __name__ == "__main__":
    if 1 != len(sys.argv):
        if sys.argv[1] in ('--help', '-h'):
            printUsage(sys.argv[0])
    print(get_pattern_all_offsets("5.sol","msg.sender==owner"))
