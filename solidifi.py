#!/usr/bin/python3

import ijson, json
import re, sys, os, shutil
import inject_file
import time, datetime
import configparser
import subprocess
import getopt
import csv

bugs_dir = "bugs"
cur_contr_ast_data = None
cur_contr_file = None
src_contr_file = None
BugLog = []

def inject_bug(bug_type):
    global bugs_dir
    global BugLog
    global src_contr_file
    global cur_contr_file
    global cur_contr_ast_data

    injected_loc_src_mapping = []
    """Append a directory separator if not already present"""
    if not (bugs_dir.endswith("/") or bugs_dir.endswith("/")):
        bugs_dir = bugs_dir + "/"
    
    cur_bug_type_details = get_bug_info (bug_type)
    cur_bug_dir = os.path.join(bugs_dir , cur_bug_type_details[0]['bug_type_dir'])

    for bug_forms in ('s', 'f'):
        
        cur_bug_dir = os.path.join(bugs_dir , cur_bug_type_details[0]['bug_type_dir'])
        
        if bug_forms == 's':
            cur_bug = "ts"
        elif bug_forms == 'f':
            cur_bug = "tf"
    
        cur_bug_dir = os.path.join(cur_bug_dir , cur_bug)

        if os.path.exists(cur_bug_dir):
            bugfiles = [f for f in os.listdir(cur_bug_dir) if os.path.isfile(os.path.join(cur_bug_dir, f))]
            bug_seq = 0
        else:
            continue

        """Scan the fource code and identify the potential locations for injecting bugs"""
        
        BIP = get_potential_locs(cur_contr_ast_data, bug_forms)
        
        for loc in reversed(BIP):
            if  not bug_seq < len(bugfiles):
                print("Running out of bug snippets")
                break
            bug_f = open(os.path.join(cur_bug_dir,bugfiles[bug_seq]), "rb")
            bug_snip = bug_f.read()
            bug_f.close()
            bug_snip_len = len(bug_snip.splitlines())
            soffset = int(get_src(loc['src'])['soffset'])
            eoffset = int(get_src(loc['src'])['eoffset'])
            stm_size = int(get_src(loc['src'])['stm_size'])

            stm = inject_file.get_snippet_at_offset(src_contr_file, soffset, stm_size)

            new_loc =inject_file.get_pattern_offset(cur_contr_file, stm)

            if new_loc is None:
                continue

            if (loc['name'] in ['VariableDeclaration','ExpressionStatement','Identifier','EmitStatement','PlaceholderStatement','Return','EventDefinition'] 
                and (new_loc[0] not in BugLog) and (soffset not in injected_loc_src_mapping)):
                inject_file.update(cur_contr_file, new_loc[0], bug_snip.strip()+b'\n')
                BugLog = inject_file.adjust_injected_loc(BugLog,new_loc[2], bug_snip_len)
                BugLog.append({'loc':new_loc[2],'length':bug_snip_len,'bug type':bug_type,'approach':'code snippet injection'})
                injected_loc_src_mapping.append(soffset)
                bug_seq +=1 
            elif (loc['name'] in ['Block', 'FunctionDefinition', 'ModifierDefinition'] and (new_loc[1] not in BugLog) and (eoffset not in injected_loc_src_mapping)):
                inject_file.update(cur_contr_file, new_loc[1]+2, b'\n'+bug_snip.strip())
                BugLog = inject_file.adjust_injected_loc(BugLog, new_loc[2]+2, bug_snip_len)
                BugLog.append({'loc':new_loc[2]+1,'length':bug_snip_len,'bug type':bug_type,'approach':'code snippet injection'})
                injected_loc_src_mapping.append(eoffset)
                bug_seq +=1 
        
    if bug_seq ==len(BIP):
        print("Injection is done in all potential loctions\n")
    print ("**************************************************\n")
    print ("************* Injection Is Done *****************\n")
    print ("**************************************************\n")
    print("Following are dettails of the injected bugs:\n")
    print (BugLog)    
    
def get_bug_info(bug_type):
    bug_types = []
    bug_type_configs = configparser.RawConfigParser(allow_no_value=True)
    bug_type_configs.read("bug_types.conf")
    for config in  bug_type_configs.sections():
        _bug_type_id = bug_type_configs.get(config, 'bug_type_id')
        _bug_type = bug_type_configs.get(config, 'bug_type')
        _bug_type_dir = bug_type_configs.get(config, 'bug_type_dir')
        bug_types.append ({'bug_type_id':_bug_type_id, 'bug_type':_bug_type,'bug_type_dir':_bug_type_dir})
    bug_type_details = [bug_info for bug_info in bug_types if bug_info['bug_type'] == bug_type]
    return bug_type_details

def get_src(src):
    f_colon = src.find(":")
    beg_offset = src[0:f_colon]
    stm_size = src[f_colon+1:src.find(":",f_colon+1)]
    
    return {"soffset":beg_offset, "stm_size": stm_size, "eoffset":int(beg_offset)+int(stm_size)+1}
    
def get_potential_locs(ast, bug_snip_type):
    """Identify all potential locations in the source code for injecting a bug type"""
    """Returns BIP (Bugs Injection Profile)"""
    stmt_locs =[]
    stm_types = ['VariableDeclaration', 'ExpressionStatement', 'EmitStatement', 'Identifier','PlaceholderStatement', 'Return', 'Block' ,'FunctionDefinition', 'ModifierDefinition', 'EventDefinition']
    all_locs = get_all_childs(ast)    
    param_list = [name for name in all_locs if name['name'] in ('ParameterList','FunctionCall','ExpressionStatement','Return','VariableDeclarationStatement','ModifierInvocation','BinaryOperation')]
    block_list = [name for name in all_locs if name['name'] in ('FunctionDefinition','ModifierDefinition', 'EventDefinition','Block')]
    struct_list = [name for name in all_locs if name['name'] in ('StructDefinition')]     
    interface_locs =inject_file.get_pattern_all_offsets(src_contr_file,'interface')
    interface_locs.extend(inject_file.get_pattern_all_offsets(src_contr_file,'library'))
    interface_list = [name for name in all_locs if name['name'] in ('ContractDefinition')]     

    for stm_type in stm_types: 
        sub_stm = [name for name in all_locs if name['name'] == stm_type]        
        if stm_type in ('VariableDeclaration','Identifier'):
            for vr in sub_stm:
                if not within_interface(interface_list, interface_locs, int(get_src(vr['src'])['eoffset'])) and not is_paramter(param_list, int(get_src(vr['src'])['eoffset'])) and not within_struct_block(struct_list, int(get_src(vr['src'])['eoffset'])):
                    stmt_locs.append(vr)
        elif bug_snip_type =='f' and stm_type in ('VariableDeclaration','Identifier', 'ModifierDefinition', 'Return', 'ExpressionStatement', 'PlaceholderStatement', 'Block', 'EmitStatement'):
            for stm in sub_stm:
                if not within_interface(interface_list, interface_locs, int(get_src(stm['src'])['eoffset'])) and not within_main_block(block_list, int(get_src(stm['src'])['eoffset'])):
                    stmt_locs.append(stm)
        else:
            for stm in sub_stm:
                if not within_interface(interface_list, interface_locs, int(get_src(stm['src'])['eoffset'])):                    
                    stmt_locs.append(stm)
            
    return stmt_locs
    
def is_paramter(param_list, v_eoffset):
    for prm in param_list:
        soffset = int(get_src(prm['src'])['soffset'])
        eoffset = int(get_src(prm['src'])['eoffset'])
        if v_eoffset >soffset and v_eoffset <= eoffset:
            return True
    return False

def within_main_block(block_list, v_eoffset):
    for prm in block_list:
        soffset = int(get_src(prm['src'])['soffset'])
        eoffset = int(get_src(prm['src'])['eoffset'])
        if v_eoffset >soffset and v_eoffset <= eoffset:
            return True
    return False

def within_struct_block(struct_list,v_eoffset):
    for prm in struct_list:
        soffset = int(get_src(prm['src'])['soffset'])
        eoffset = int(get_src(prm['src'])['eoffset'])
        if v_eoffset >soffset and v_eoffset <= eoffset:
            return True
    return False

def within_interface(interface_list, interface_locs,v_eoffset):
    for prm in interface_list:
        soffset = int(get_src(prm['src'])['soffset'])
        eoffset = int(get_src(prm['src'])['eoffset'])
        if v_eoffset >soffset and v_eoffset <= eoffset:
            for loc in interface_locs:
                if soffset ==loc['soffset']:
                    return True
    return False


def get_all_childs(ast):
    all_childs = []
    ids = extract_values(ast, 'id')
    names = extract_values(ast, 'name')
    srcs = extract_values(ast, 'src')
    for i in range(0, len(ids)):
        all_childs.append({"id":ids[i],"name":names[i],"src":srcs[i]})
   
    #print (all_childs)
    return all_childs

def get_main_blocks(ast):
    cont_main_blks = []
    with open(ast, 'r') as f:
     objects = ijson.items(f,'children')
     contract_body = (o for o in objects)
     for child in contract_body:
         d= dict(child[1])
         for i  in range(0, len(d['children'])):
            cont_main_blks.append({"id":(d['children'][i])['id'],"name":(d['children'][i])['name'],"src":(d['children'][i])['src']})
    return cont_main_blks

def extract_values(obj, key):
    """Pull all values of specified key from AST"""
    arr = []
    results = extract(obj, arr, key)
    return results 

def extract(obj, arr, key):
    """Recursively search for values of key in AST"""
    if isinstance(obj, dict):
        for k, v in obj.items():
            if isinstance(v, (dict, list)):
                extract(v, arr, key)
            elif k == key:
                for k1, v1 in obj.items():
                    if k1 == 'id':
                        arr.append(v)
    elif isinstance(obj, list):
        for item in obj:
            extract(item, arr, key)
    return arr

def code_transform(filename, bug_type):
    """ Inject bugs through Code Transformation approach """
    existing_patterns = []
    code_trans_configs = configparser.RawConfigParser(allow_no_value=True)
    code_trans_configs.read("code_trans.conf")
    for config in  code_trans_configs.sections():
        _bug_type = code_trans_configs.get(config, 'bug_type')
        _sec_snip= code_trans_configs.get(config, 'current_snippet')
        _bug_snip= code_trans_configs.get(config, 'bug_snippet')
        existing_patterns.append ({'bug_type':_bug_type,'sec_snip':_sec_snip,'bug_snip':_bug_snip})
    
    with open (filename, "r+b") as myfile:
        s = myfile.read()
        #s = re.sub(a.encode(),b.encode(), s)
        ret = s
        bug_patterns = [bugs for bugs in existing_patterns if bugs['bug_type'] == bug_type]
        
        for bug in bug_patterns:
            """locations of the patterns to be replaced"""
            bug_locs = inject_file.get_pattern_all_offsets(filename, bug['sec_snip'])
            """Transfer the secure code to make it unsecure to introduce bug into the source code"""
            if (len(bug_locs) >0):
                ret = re.sub(re.compile(bug['sec_snip'].encode()), bug['bug_snip'].encode(), ret)
                myfile.seek(0,0)
                myfile.write(ret)
                myfile.truncate()   
            for loc in bug_locs:
                BugLog.append({'loc':loc['line'], 'length':1,'bug type':bug_type, 'approach':'code tranfsorm'})
def weaken_sec_mec(filename, bug_type):
    """ Inject bugs through Weakning Security Mechanisms approach """
    existing_patterns = []
    sec_mec_configs = configparser.RawConfigParser(allow_no_value=True)
    sec_mec_configs.read("sec_methods.conf")
    for config in  sec_mec_configs.sections():
        _bug_type = sec_mec_configs.get(config, 'bug_type')
        _sec_method_pattern= sec_mec_configs.get(config, 'sec_meth_pattern')
        _snip_to_remove= sec_mec_configs.get(config, 'snip_to_remove')
        existing_patterns.append ({'bug_type':_bug_type,'sec_meth_pattern':_sec_method_pattern,'snip_to_remove':_snip_to_remove})
    
        
    bug_patterns = [bugs for bugs in existing_patterns if bugs['bug_type'] == bug_type]
    for bug in bug_patterns:
        """locations of the secure patterns to be weakened"""
        bug_locs = inject_file.get_pattern_all_offsets(filename, bug['sec_meth_pattern'])
        """Weaken the existing security mechanisms to introduce bug into the source code"""
        if (len(bug_locs) >0):
            for loc in bug_locs:
                with open(filename,'r+b') as sfile:
                    lines = sfile.readlines()                    
                    lines[loc['line']]=re.sub(b"revert\(\);",b"//revert();\n",lines[loc['line']])
                    sfile.seek(0,0)
                    sfile.writelines(lines)
                    sfile.truncate()
                BugLog.append({'loc':loc['line'], 'length':1,'bug type':bug_type, 'approach':'weakening security'})            
            
"""Clear global variables"""             
def clear_globals():
    global cur_contr_ast_data
    global cur_contr_file
    global src_contr_file
    global BugLog

    cur_contr_ast_data= None
    cur_contr_file = None
    src_contr_file = None
    BugLog = []

def printUsage(prog):
    print ("For inecting bugs of specific bug type, type the following command:\n")
    print("%s <-i or --inject> <source-code-file.sol> <bug type>"% prog)

def main(argv=None):
    global cur_contr_file
    global src_contr_file
    global cur_contr_ast_data
    
    clear_globals()
    if argv is None:
        argv = sys.argv
    try:
        if 1 != len(sys.argv):
            if argv[1] in ('--help', '-h'):
                printUsage(sys.argv[0])
        elif len(argv) == 1:
            print ("Type --help or -h for list of options on how to use SolidiFI")
            exit()
        start = time.time()        
    
        if  argv[1] in ('--inject', '-i'):
            head, tail = os.path.split(argv[2])

            out = subprocess.check_output(['solc',argv[2]])
            if not(len(out)==0):
                print("Contract file contains compilation errors")
                exit()
            if not(os.path.isfile(argv[2])):
                print("Specified source file does not exists")
    
            buggy_dir = os.path.join("buggy",argv[3])
            os.makedirs(buggy_dir,exist_ok=True)
            buggy_file_path = os.path.join(buggy_dir,"buggy_"+tail)

            if os.path.isfile(buggy_file_path):
                os.remove(buggy_file_path)
            shutil.copyfile(argv[2],buggy_file_path)  
            src_contr_file = argv[2]
            cur_contr_file=buggy_file_path

            """Inject bugs using code tranforamtion approach"""
            #code_transform(cur_contr_file, argv[3])


            """Inject bugs using weakning security mechanisms approach"""
            #weaken_sec_mec(cur_contr_file, argv[3])
            
            tmp_buggy_file_path = os.path.join(buggy_dir,"tmp_buggy_"+tail)
            if os.path.isfile(tmp_buggy_file_path):
                os.remove(tmp_buggy_file_path)
            shutil.copyfile(buggy_file_path,tmp_buggy_file_path)  
            src_contr_file = tmp_buggy_file_path
            

            """ Generate AST"""
            ast_json_files_dir = "ast"
            os.makedirs(ast_json_files_dir,exist_ok=True)
            ast_json_file = os.path.join(ast_json_files_dir, os.path.splitext(tail)[0]+".json")
            
            
            ast_cmd = "solc --ast-json {0} > {1}".format(cur_contr_file,ast_json_file)
            os.system(ast_cmd)
            if not(os.path.isfile(ast_json_file)):
                print("unable to generate AST")
                exit()
            
            inject_file.preprocess_json_file(ast_json_file)

            with open(ast_json_file) as fh:
                cur_contr_ast_data = json.loads(fh.read())    

        
            inject_bug(argv[3])
            csv_file = os.path.join(buggy_dir,"BugLog_"+tail[0:len(tail)-4]+".csv")
            csv_columns = ['loc','length','bug type','approach']
            try:
                with open(csv_file, 'w') as csvfile:
                    writer = csv.DictWriter(csvfile, fieldnames=csv_columns)
                    writer.writeheader()
                    for data in BugLog:
                        writer.writerow(data)
            except IOError:
                print("I/O error")
    
            os.remove(tmp_buggy_file_path)
            end = time.time()
            return "%.2g" % (end-start)
            
    except  OSError as err:
        #print >>sys.stderr, err.msg
        #print >>sys.stderr, "for help use --help"
        return 2

def interior_main(opr, sc, bug_type):
    out = main(['solidifi' , opr, sc, bug_type])
    return out

if __name__ == "__main__":
    sys.exit(main())