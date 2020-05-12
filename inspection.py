#!/usr/bin/python3

#import solidifi
import os,sys
import shutil, glob
import csv
import inject_file
import re
import json
import pandas

reported_bugs = []
reported_non_injected = []
tools = []
#tools = ["Oyente", "Securify", "Mythril", "Smartcheck","Slither","Manticore"]
main_dir ="tool_results"
bug_types = [
{'tool':'Oyente','bugs':['Re-entrancy','Timestamp-Dependency','Unhandled-Exceptions','TOD','Overflow-Underflow']},
{'tool':'Securify','bugs':['Re-entrancy','Unchecked-Send','Unhandled-Exceptions','TOD']},
{'tool':'Mythril','bugs':['Re-entrancy','Timestamp-Dependency','Unchecked-Send','Unhandled-Exceptions','Overflow-Underflow','tx.origin']},
{'tool':'Smartcheck','bugs':['Re-entrancy','Timestamp-Dependency','Unhandled-Exceptions','Overflow-Underflow','tx.origin']},
{'tool':'Manticore','bugs':['Re-entrancy','Overflow-Underflow']},
{'tool':'Slither','bugs':['Re-entrancy','Timestamp-Dependency','Unhandled-Exceptions','tx.origin']}]
    
securify_bug_codes =[{'bug':'Unhandled-Exceptions','codes':['UnhandledException']},{'bug':'TOD','codes':['TODAmount','TODReceiver','TODTransfer']},
{'bug':'Unchecked-Send','codes':['UnrestrictedEtherFlow']},{'bug':'Re-entrancy','codes':['DAOConstantGas','DAO']}]
mythril_bug_codes =[{'bug':'Unhandled-Exceptions','codes':['Unchecked Call Return Value']},{'bug':'Timestamp-Dependency','codes':['Dependence on predictable environment variable']},
{'bug':'Overflow-Underflow','codes':['Integer Underflow','Integer Overflow']},{'bug':'tx.origin','codes':['Use of tx.origin']},{'bug':'Unchecked-Send','codes':['Unprotected Ether Withdrawal']},
{'bug':'Re-entrancy','codes':['External Call To User-Supplied Address','External Call To Fixed Address','State change after external call']}]
slither_bug_codes =[{'bug':'Unhandled-Exceptions','codes':['unchecked-send','unchecked-lowlevel']},{'bug':'Timestamp-Dependency','codes':['timestamp']},
{'bug':'tx.origin','codes':['tx-origin']},{'bug':'Re-entrancy','codes':['reentrancy-benign','reentrancy-eth','reentrancy-unlimited-gas','reentrancy-no-eth']}]
smartcheck_bug_codes =[{'bug':'Unhandled-Exceptions','codes':['SOLIDITY_UNCHECKED_CALL']},{'bug':'Timestamp-Dependency','codes':['SOLIDITY_EXACT_TIME','VYPER_TIMESTAMP_DEPENDENCE']},
{'bug':'Overflow-Underflow','codes':['SOLIDITY_UINT_CANT_BE_NEGATIVE']},{'bug':'tx.origin','codes':['SOLIDITY_TX_ORIGIN']},{'bug':'Re-entrancy','codes':['SOLIDITY_ETRNANCY']}]
oyente_bug_codes =[{'bug':'Unhandled-Exceptions','codes':['Callstack Depth Attack Vulnerability']},{'bug':'Timestamp-Dependency','codes':['Timestamp Dependency']},
{'bug':'TOD','codes':['Transaction-Ordering Dependency']},{'bug':'Re-entrancy','codes':['Re-Entrancy Vulnerability']},{'bug':'Overflow-Underflow','codes':['Integer Overflow','Integer Underflow']}]
manticore_bug_codes =[{'bug':'Re-entrancy','codes':['Potential reentrancy vulnerability','Reachable ether leak to sender']},{'bug':'Overflow-Underflow','codes':['Unsigned integer overflow at ADD instruction','Signed integer overflow at ADD instruction','Unsigned integer overflow at SUB instruction','Signed integer overflow at SUB instruction']}]

contract_names_per_file = [{'file':'buggy_1.sol','names':['EIP20Interface','HotDollarsToken']},{'file':'buggy_2.sol','names':['CareerOnToken']},{'file':'buggy_3.sol','names':['CareerOnToken']},{'file':'buggy_4.sol','names':['PHO']},
{'file':'buggy_5.sol','names':['Ownable','TokenERC20','TTC']},{'file':'buggy_6.sol','names':['Ownable','ChannelWallet']},
{'file':'buggy_7.sol','names':['Ownable','AccountWallet']},{'file':'buggy_8.sol','names':['Ownable','TokenERC20','YFT']},{'file':'buggy_9.sol','names':['Ownable','XLToken']},{'file':'buggy_10.sol','names':['Ownable','XLToken']},
{'file':'buggy_11.sol','names':['ERC20Interface','ApproveAndCallFallBack','Owned','ForTheBlockchain']},{'file':'buggy_12.sol','names':['ERC20','ERC223ReceivingContract','ERC223','ERC223Token','Owned','Grand']},
{'file':'buggy_13.sol','names':['BitCash']},{'file':'buggy_14.sol','names':['ERC20','ERC20Detailed','SaveWon']},{'file':'buggy_15.sol','names':['MD']},
{'file':'buggy_16.sol','names':['ERC20Interface','Owned','ExclusivePlatform']},{'file':'buggy_17.sol','names':['owned','TokenERC20','AZT']},{'file':'buggy_18.sol','names':['ERC20Interface','ApproveAndCallFallBack','Owned','_Yesbuzz']},
{'file':'buggy_19.sol','names':['owned','ethBank']},{'file':'buggy_20.sol','names':['Ownable','Stoppable','RampInstantPoolInterface','RampInstantEscrowsPoolInterface','RampInstantPool','RampInstantEthPool']},
{'file':'buggy_21.sol','names':['Token','StableDEX']},{'file':'buggy_22.sol','names':['owned','tokenRecipient','Token','MindsyncPlatform']},{'file':'buggy_23.sol','names':['Proxy','UpgradeabilityProxy','AdminUpgradeabilityProxy']},
{'file':'buggy_24.sol','names':['FomoFeast']},{'file':'buggy_25.sol','names':['WhiteBetting']},
{'file':'buggy_26.sol','names':['UBBCToken']},
{'file':'buggy_27.sol','names':['Ownable','ERC20Detailed','DanPanCoin']},
{'file':'buggy_28.sol','names':['ERC20Detailed','HYDROGEN']},
{'file':'buggy_29.sol','names':['ERC20Interface','IERC20Interface','RaffleToken','RaffleTokenExchange']},
{'file':'buggy_30.sol','names':['ERC777','MinterRole','PauserRole','Pausable','SKYBITToken']},
{'file':'buggy_31.sol','names':['Ownable','ReentrancyGuard','FeeTransactionManager']},
{'file':'buggy_32.sol','names':['ERC20TokenInterface','ERC20Token','AsseteGram']},
{'file':'buggy_33.sol','names':['Owned','Token','Staking']},
{'file':'buggy_34.sol','names':['Ownable','LollypopToken']},
{'file':'buggy_35.sol','names':['owned','BitpayerDEX']},
{'file':'buggy_36.sol','names':['owned','tokenRecipient','Token','MindsyncPlatform']},
{'file':'buggy_37.sol','names':['SafeMath','ERC20Interface','ApproveAndCallFallBack','Owned','AugustCoin']},
{'file':'buggy_38.sol','names':['ERC20Detailed','BIGBOMBv2']},
{'file':'buggy_39.sol','names':['TAMCContract']},
{'file':'buggy_40.sol','names':['ERC20','ERC20Detailed','SimpleSwapCoin']},
{'file':'buggy_41.sol','names':['AO']},
{'file':'buggy_42.sol','names':['Owned','Token','Staking']},
{'file':'buggy_43.sol','names':['EventMetadata','Operated','MultiHashWrapper','ProofHash','Template','Post']},
{'file':'buggy_44.sol','names':['EventMetadata','Operated','ProofHashes','MultiHashWrapper','Template','Feed']},
{'file':'buggy_45.sol','names':['StockBet']},
{'file':'buggy_46.sol','names':['ProofOfExistence']},
{'file':'buggy_47.sol','names':['ERC20Interface','AcunarToken','AcunarIEO']},
{'file':'buggy_48.sol','names':['ERC20Interface','ApproveAndCallFallBack','Owned','QurasToken']},
{'file':'buggy_49.sol','names':['TAMC']},
{'file':'buggy_50.sol','names':['digitalNotary']}]

thresholds = [{'bug':'Re-entrancy','threshold':4},{'bug':'Unhandled-Exceptions','threshold':3},{'bug':'Unchecked-Send','threshold':2},
{'bug':'Timestamp-Dependency','threshold':3},{'bug':'TOD','threshold':2},{'bug':'Overflow-Underflow','threshold':3},{'bug':'tx.origin','threshold':2}]

    
def Inspect_results(_tools = []):
    global reported_bugs 
    oyente_FNs = []
    securify_FNs = []
    mythril_FNs = []
    smartcheck_FNs = []
    slither_FNs = []
    manticore_FNs = []
    
    oyente_FPs = []
    securify_FPs = []
    mythril_FPs = []
    smartcheck_FPs = []
    slither_FPs = []
    manticore_FPs = []

    tools = _tools
    # Contracts
    x = [ i for i in range(1,51)]

    for tool in tools:
        tool_bugs = [bugs['bugs'] for bugs in bug_types if  bugs['tool'] == tool]
        for bug_type in tool_bugs[0]:
            oyente_ibugs =0
            oyente_bug_fn =0
            oyente_misclas =0
            securify_ibugs =0
            securify_bug_fn =0
            securify_misclas =0
            mythril_ibugs =0
            mythril_bug_fn =0
            mythril_misclas =0
            smartcheck_ibugs =0
            smartcheck_bug_fn =0
            smartcheck_misclas =0
            slither_ibugs =0
            slither_bug_fn =0
            slither_misclas =0
            manticore_ibugs =0
            manticore_bug_fn =0
            manticore_misclas =0
            c=0
            for cs in x:
                tool_main_dir = os.path.join(main_dir,tool)
                tool_buggy_sc = os.path.join(tool_main_dir,"analyzed_buggy_contracts")
                injected_scs = os.path.join(tool_buggy_sc,bug_type)
           
                bug_log =injected_scs+"/BugLog_"+str(cs)+".csv"
                buggy_sc =injected_scs+"/buggy_"+str(cs)+".sol"
                result_file = injected_scs+"/results/buggy_"+str(cs)+".sol.txt"
                if tool in ("Slither","Oyente"):
                    result_file = injected_scs+"/results/buggy_"+str(cs)+".sol.json"

                #Read the injected bug logs
                with open(bug_log, 'r') as f:
                    reader = csv.reader(f)
                    bug_log_list = list(reader)                    

                #Inspect tool reports for false negatives and false positives positives
                if tool =='Securify':
                    detected_bugs = []       
                    reported_bugs = []
             
                    #""locations of all violation patterns in the tool generated report""
                    violation_pattern= "Violation((.+)\s)+at\s"

                    violation_locs = inject_file.get_pattern_all_offsets(result_file, violation_pattern)
                    for viol in violation_locs:                        
                        extract_detected_bug(result_file,viol,tool,cs)            
                                   
                    #Inspect flase negatives                    
                    false_negatives = []
                    misclassifications = []
                    tool_reported_bugs = [bugs for bugs in reported_bugs if  bugs['tool'] == tool and bugs['contract'] ==cs]
                    tool_bug_codes = [codes for codes in securify_bug_codes if  codes['bug'] == bug_type]

                    for ibug in bug_log_list[1:len(bug_log_list)]:
                        detected = False
                        misclassified = False
                        for dbug in tool_reported_bugs:
                            if int(dbug['lines']) >= int(ibug[0]) and int(dbug['lines']) < (int(ibug[0])+int(ibug[1])):
                                if dbug['bugType'].strip() in tool_bug_codes[0]['codes']:
                                    detected = True
                                else: 
                                    misclassified = True
                        if detected == False:
                            false_negatives.append(ibug) 
                        if misclassified == True and detected == False:
                            misclassifications.append(ibug)
                    
                    securify_ibugs +=(len(bug_log_list)-1)
                    securify_bug_fn +=len(false_negatives)
                    securify_misclas +=len(misclassifications)
                    
                    #Inspect flase positives
                    false_positives = []
                    for dbug in tool_reported_bugs:
                        
                        injected = False
                        for ibug in bug_log_list[1:len(bug_log_list)]:
                            if int(dbug['lines']) >= int(ibug[0]) and int(dbug['lines']) < (int(ibug[0])+int(ibug[1])):
                                injected = True
                        if injected == False:
                            reported_non_injected.append(dbug)
                                 
                elif tool == 'Mythril':
                    detected_bugs = []
                    reported_bugs = []

                    #""locations of all reported bug patterns in the tool generated report""                    
                    violation_pattern= "===((.+)\s)+--"
                    violation_locs = inject_file.get_pattern_all_offsets(result_file, violation_pattern)
                    for viol in violation_locs:
                        extract_detected_bug(result_file,viol,tool,cs)
                        
                       
                    #Inspect flase negatives
                    false_negatives = []
                    misclassifications = []
                    tool_reported_bugs = [bugs for bugs in reported_bugs if  bugs['tool'] == tool and bugs['contract'] ==cs]
                    tool_bug_codes = [codes for codes in mythril_bug_codes if  codes['bug'] == bug_type]

                    for ibug in bug_log_list[1:len(bug_log_list)]:
                        detected = False
                        misclassified = False

                        for dbug in tool_reported_bugs:
                            if int(dbug['lines']) >= int(ibug[0]) and int(dbug['lines']) < (int(ibug[0])+int(ibug[1])):
                                if dbug['bugType'].strip() in tool_bug_codes[0]['codes']:
                                    detected = True
                                else: 
                                    misclassified = True                            
                        if detected == False:
                            false_negatives.append(ibug) 
                        if misclassified == True and detected == False:
                            misclassifications.append(ibug)
                                     
                    mythril_ibugs +=(len(bug_log_list)-1)
                    mythril_bug_fn +=len(false_negatives)
                    mythril_misclas +=len(misclassifications)  
                
                    #Inspect flase positives
                    for dbug in tool_reported_bugs:
                        injected = False
                        for ibug in bug_log_list[1:len(bug_log_list)]:
                            if int(dbug['lines']) >= int(ibug[0]) and int(dbug['lines']) < (int(ibug[0])+int(ibug[1])):
                                injected = True
                        if injected == False:
                            reported_non_injected.append(dbug)

                elif tool == 'Slither':
                    reported_bugs = []
                 
                    #""locations of all reported bug patterns in the tool generated report""
                    with open(result_file) as fh:
                        result_file_data = json.loads(fh.read())
                    violation_locs = get_all_childs(result_file_data)
                    
                    for viol in violation_locs:
                        line = re.findall(r'(?<=sol#)[0-9]*(?=\))',viol['desc'])
                        if len(line)>0:
                            bugLine = int (line[0])                        
                        bugType = viol['type']
                        reported_bugs.append({'tool':tool,'lines':bugLine,'bugType':bugType,'contract':cs})
                        
                                      
                    #Inspect flase negatives                 
                    false_negatives = []
                    misclassifications = []
                    tool_reported_bugs = [bugs for bugs in reported_bugs if  bugs['tool'] == tool and bugs['contract'] ==cs]
                    tool_bug_codes = [codes for codes in slither_bug_codes if  codes['bug'] == bug_type]                     
                    for ibug in bug_log_list[1:len(bug_log_list)]:
                        detected = False
                        misclassified = False
                        for dbug in tool_reported_bugs:
                            if int(dbug['lines']) >= int(ibug[0]) and int(dbug['lines']) < (int(ibug[0])+int(ibug[1])):
                                if dbug['bugType'].strip() in tool_bug_codes[0]['codes']:
                                    detected = True
                                else: 
                                    misclassified = True

                        if detected == False:
                            false_negatives.append(ibug) 
                        if misclassified == True and detected == False:
                            misclassifications.append(ibug)
                 
                    #print(false_negatives) 
                    slither_ibugs +=(len(bug_log_list)-1)
                    slither_bug_fn +=len(false_negatives)
                    slither_misclas +=len(misclassifications)
                                
                    #Inspect flase positives
                    false_positives = []
                    for dbug in tool_reported_bugs:
                        injected = False
                        for ibug in bug_log_list[1:len(bug_log_list)]:
                            if int(dbug['lines']) >= int(ibug[0]) and int(dbug['lines']) < (int(ibug[0])+int(ibug[1])):
                                injected = True
                        if injected == False:
                            reported_non_injected.append(dbug)
                    
                elif tool == 'Smartcheck':
                    detected_bugs = []
                    reported_bugs = []

                    #""locations of all reported bug patterns in the tool generated report""
                    violation_pattern= "ruleId((.+)\s)+line:\s[0-9]*"

                    violation_locs = inject_file.get_pattern_all_offsets(result_file, violation_pattern)
                                    
                    for viol in violation_locs:                        
                        extract_detected_bug(result_file,viol,tool,cs)
                                                           
                    #Inspect flase negatives
                    false_negatives = []
                    misclassifications = []

                    tool_reported_bugs = [bugs for bugs in reported_bugs if  bugs['tool'] == tool and bugs['contract'] ==cs]
                    tool_bug_codes = [codes for codes in smartcheck_bug_codes if  codes['bug'] == bug_type]

                    for ibug in bug_log_list[1:len(bug_log_list)]:
                        detected = False
                        misclassified = False
                        for dbug in tool_reported_bugs:
                            if int(dbug['lines']) >= int(ibug[0]) and int(dbug['lines']) < (int(ibug[0])+int(ibug[1])):
                                if dbug['bugType'].strip() in tool_bug_codes[0]['codes']:
                                    detected = True
                                else: 
                                    misclassified = True

                        if detected == False:
                            false_negatives.append(ibug) 
                        if misclassified == True and detected == False:
                            misclassifications.append(ibug)                 
                    
                    smartcheck_ibugs +=(len(bug_log_list)-1)
                    smartcheck_bug_fn +=len(false_negatives)
                    smartcheck_misclas +=len(misclassifications)
                    
                    #Inspect flase positives
                    false_positives = []
                    for dbug in tool_reported_bugs:
                        injected = False
                        for ibug in bug_log_list[1:len(bug_log_list)]:
                            if int(dbug['lines']) >= int(ibug[0]) and int(dbug['lines']) < (int(ibug[0])+int(ibug[1])):
                                injected = True
                        if injected == False:
                            reported_non_injected.append(dbug)

                elif tool == 'Oyente':
                    detected_bugs = []
                    reported_bugs = []
                    head, tail = os.path.split(buggy_sc)
                    
                    #""locations of all reported bug patterns in the tool generated report""                    
                    violation_pattern= "(?<=sol:)(.*)(?=\.\\\)"
                    
                    cs_names = [names['names'] for names in contract_names_per_file if  names['file'] == tail]
                    for cs_name in cs_names[0]:
                        result_file = injected_scs+"/results/buggy_"+str(cs)+".sol:"+cs_name+".json"
                        if not os.path.isfile(result_file):
                            continue

                        violation_locs = inject_file.get_pattern_all_offsets(result_file, violation_pattern)
                        for viol in violation_locs:
                            extract_detected_bug(result_file,viol,tool,cs)                            
                                                                    
                    #Inspect flase negatives                    
                    false_negatives = []
                    misclassifications = []
                    tool_reported_bugs = [bugs for bugs in reported_bugs if  bugs['tool'] == tool and bugs['contract'] ==cs]
                    tool_bug_codes = [codes for codes in oyente_bug_codes if  codes['bug'] == bug_type]

                    for ibug in bug_log_list[1:len(bug_log_list)]:
                        detected = False
                        misclassified = False
                        for dbug in tool_reported_bugs:
                            if int(dbug['lines']) >= int(ibug[0]) and int(dbug['lines']) < (int(ibug[0])+int(ibug[1])):
                                if dbug['bugType'].strip() in tool_bug_codes[0]['codes']:
                                    detected = True
                                else: 
                                    misclassified = True
                        if detected == False:
                            false_negatives.append(ibug) 
                        if misclassified == True and detected == False:
                            misclassifications.append(ibug)
                                     
                    oyente_ibugs +=(len(bug_log_list)-1)
                    oyente_bug_fn +=len(false_negatives)
                    oyente_misclas +=len(misclassifications)
                 
                    #Inspect flase positives
                    false_positives = []
                    for dbug in tool_reported_bugs:
                        injected = False
                        for ibug in bug_log_list[1:len(bug_log_list)]:
                            if int(dbug['lines']) >= int(ibug[0]) and int(dbug['lines']) < (int(ibug[0])+int(ibug[1])):
                                injected = True
                        if injected == False:
                            reported_non_injected.append(dbug)

                    
                elif tool == 'Manticore':
                    detected_bugs = []
                    reported_bugs = []
                    head, tail = os.path.split(buggy_sc)
                    
                    #""locations of all reported bug patterns in the tool generated report""                 
                    violation_pattern= "\-((.+)\s)+[0-9]+"
                    
                    cs_names = [names['names'] for names in contract_names_per_file if  names['file'] == tail]                    
                    for cs_name in cs_names[0]:
                        result_file = injected_scs+"/results/buggy_"+str(cs)+"."+cs_name+".txt"                        
                        if not os.path.isfile(result_file):
                            continue                        
                        violation_locs = inject_file.get_pattern_all_offsets(result_file, violation_pattern)
                        for viol in violation_locs:                            
                            extract_detected_bug(result_file,viol,tool,cs)
                                                                            
                    
                    #Inspect flase negatives                    
                    false_negatives = []
                    misclassifications = []
                    tool_reported_bugs = [bugs for bugs in reported_bugs if  bugs['tool'] == tool and bugs['contract'] ==cs]
                    tool_bug_codes = [codes for codes in manticore_bug_codes if  codes['bug'] == bug_type]                    
                    for ibug in bug_log_list[1:len(bug_log_list)]:
                        detected = False
                        misclassified = False
                        for dbug in tool_reported_bugs:
                            if int(dbug['lines']) >= int(ibug[0]) and int(dbug['lines']) < (int(ibug[0])+int(ibug[1])):
                                if dbug['bugType'].strip() in tool_bug_codes[0]['codes']:
                                    detected = True                                   
                                else: 
                                    misclassified = True
                        if detected == False:
                            false_negatives.append(ibug) 
                        if misclassified == True and detected == False:
                            misclassifications.append(ibug)
                    
                    manticore_ibugs +=(len(bug_log_list)-1)
                    manticore_bug_fn +=len(false_negatives)
                    manticore_misclas +=len(misclassifications)
                    
                    #Inspect flase positives
                    false_positives = []
                    for dbug in tool_reported_bugs:
                        injected = False
                        for ibug in bug_log_list[1:len(bug_log_list)]:
                            if int(dbug['lines']) >= int(ibug[0]) and int(dbug['lines']) < (int(ibug[0])+int(ibug[1])):
                                injected = True
                        if injected == False:
                            reported_non_injected.append(dbug)
                        
            if tool == "Oyente":
                oyente_FNs.append({'BugType':bug_type,'InjectedBugs':oyente_ibugs,'FalseNegatives':oyente_bug_fn,'MisClassified':oyente_misclas,'UnDetected':(oyente_bug_fn-oyente_misclas)})
            elif tool == "Securify":
                securify_FNs.append({'BugType':bug_type,'InjectedBugs':securify_ibugs,'FalseNegatives':securify_bug_fn,'MisClassified':securify_misclas,'UnDetected':(securify_bug_fn-securify_misclas)})
            elif tool == "Mythril":
                mythril_FNs.append({'BugType':bug_type,'InjectedBugs':mythril_ibugs,'FalseNegatives':mythril_bug_fn,'MisClassified':mythril_misclas,'UnDetected':(mythril_bug_fn-mythril_misclas)})
            elif tool == "Smartcheck":
                smartcheck_FNs.append({'BugType':bug_type,'InjectedBugs':smartcheck_ibugs,'FalseNegatives':smartcheck_bug_fn,'MisClassified':smartcheck_misclas,'UnDetected':(smartcheck_bug_fn-smartcheck_misclas)})
            elif tool =="Slither":
                slither_FNs.append({'BugType':bug_type,'InjectedBugs':slither_ibugs,'FalseNegatives':slither_bug_fn,'MisClassified':slither_misclas,'UnDetected':(slither_bug_fn-slither_misclas)})
            elif tool =="Manticore":
                manticore_FNs.append({'BugType':bug_type,'InjectedBugs':manticore_ibugs,'FalseNegatives':manticore_bug_fn,'MisClassified':manticore_misclas,'UnDetected':(manticore_bug_fn-manticore_misclas)})
   
    #Export False negative results 
    csv_columns =  ['BugType','InjectedBugs','FalseNegatives','MisClassified','UnDetected']
    for tool in tools:
        csv_file = os.path.join("FNs/"+tool+"_FNs.csv")
        try:
            with open(csv_file, 'w') as csvfile:
                writer = csv.DictWriter(csvfile, fieldnames=csv_columns)
                writer.writeheader()
                if tool =="Oyente":
                    for data in oyente_FNs:
                        writer.writerow(data)
                elif tool =="Securify":
                    for data in securify_FNs:
                        writer.writerow(data)
                elif tool =="Mythril":
                    for data in mythril_FNs:
                        writer.writerow(data)
                elif tool =="Smartcheck":
                    for data in smartcheck_FNs:
                        writer.writerow(data)
                elif tool =="Slither":
                    for data in slither_FNs:
                        writer.writerow(data)
                elif tool =="Manticore":
                    for data in manticore_FNs:
                        writer.writerow(data)
            print ("\n************************** "+tool +" False Negatives *******************\n")        
            df = pandas.read_csv(csv_file)
            print(df)
        except IOError:
            print("I/O error")
    
    #Print to console
    #remove duplicates
    tempList = []
    for bug in reported_non_injected:
        if bug not in tempList:
            tempList.append(bug)
    _reported_non_injected = tempList
    coded_reported_non_injected = []

    #Check majority
    for bug in _reported_non_injected:
        coded_bugType =get_bug_type(bug)
        coded_reported_non_injected.append({'lines':bug['lines'],'tool':bug['tool'],'bugType':coded_bugType,'contract':bug['contract']})
    
    for tool in tools:
        if tool == "Oyente":
            tool_bugs = [bugs['bug'] for bugs in oyente_bug_codes]
            for bug in tool_bugs:
                fp_count = 0
                excluded = 0
                other_count = 0
                bug_type_threshold = [thr['threshold'] for thr in thresholds if thr['bug']==bug][0]
                for sc in x:
                    type_specific_bugs = [bugs for bugs in coded_reported_non_injected  if  bugs['tool'] == tool and bugs['bugType'] == bug and bugs['contract']==sc]
                    other_bugs= [bugs for bugs in coded_reported_non_injected  if  bugs['tool'] == tool and bugs['bugType'] not in tool_bugs and bugs['contract']==sc]
                    other_count += len(other_bugs)
                                    
                    for sbugs in type_specific_bugs:
                        tools_deteced_bug = [bugs for bugs in coded_reported_non_injected  if  bugs['lines'] == sbugs['lines'] and bugs['bugType']== bug and bugs['contract']==sc] 
                        if not len(tools_deteced_bug) >= bug_type_threshold:
                            fp_count +=1
                        else:
                            excluded +=1
                      
                oyente_FPs.append({'BugType':bug,'FalsePositives':fp_count,'ExcludedByMajority':excluded,'Total':(fp_count+excluded)})
            oyente_FPs.append({'BugType':'Other','FalsePositives':other_count,'ExcludedByMajority':0,'Total':other_count})
            
        elif tool == "Securify":
            tool_bugs = [bugs['bug'] for bugs in securify_bug_codes]
            for bug in tool_bugs:
                fp_count = 0
                excluded = 0
                other_count = 0

                bug_type_threshold = [thr['threshold'] for thr in thresholds if thr['bug']==bug][0]
                for sc in x:
                    type_specific_bugs = [bugs for bugs in coded_reported_non_injected  if  bugs['tool'] == tool and bugs['bugType'] == bug and bugs['contract']==sc]
                    other_bugs= [bugs for bugs in coded_reported_non_injected  if  bugs['tool'] == tool and bugs['bugType'] not in tool_bugs and bugs['contract']==sc]
                    other_count += len(other_bugs)
                    
                    for sbugs in type_specific_bugs:
                        tools_deteced_bug = [bugs for bugs in coded_reported_non_injected  if  bugs['lines'] == sbugs['lines'] and bugs['bugType']== bug and bugs['contract']==sc] 
                        if not len(tools_deteced_bug) >= bug_type_threshold:                            
                            fp_count +=1
                        else:
                            excluded +=1
                
                securify_FPs.append({'BugType':bug,'FalsePositives':fp_count,'ExcludedByMajority':excluded,'Total':(fp_count+excluded)})
            securify_FPs.append({'BugType':'Other','FalsePositives':other_count,'ExcludedByMajority':0,'Total':other_count})

        elif tool == "Mythril":
            tool_bugs = [bugs['bug'] for bugs in mythril_bug_codes]
            for bug in tool_bugs:
                fp_count = 0
                excluded = 0
                other_count = 0
                bug_type_threshold = [thr['threshold'] for thr in thresholds if thr['bug']==bug][0]
                for sc in x:
                    type_specific_bugs = [bugs for bugs in coded_reported_non_injected  if  bugs['tool'] == tool and bugs['bugType'] == bug and bugs['contract']==sc]
                    other_bugs= [bugs for bugs in coded_reported_non_injected  if  bugs['tool'] == tool and bugs['bugType'] not in tool_bugs and bugs['contract']==sc]
                    other_count += len(other_bugs)
                    
                    for sbugs in type_specific_bugs:
                        tools_deteced_bug = [bugs for bugs in coded_reported_non_injected  if  bugs['lines'] == sbugs['lines'] and bugs['bugType']== bug] 
                        if not len(tools_deteced_bug) >= bug_type_threshold:
                            fp_count +=1    
                        else:
                            excluded +=1
                
                mythril_FPs.append({'BugType':bug,'FalsePositives':fp_count,'ExcludedByMajority':excluded,'Total':(fp_count+excluded)})
            mythril_FPs.append({'BugType':'Other','FalsePositives':other_count,'ExcludedByMajority':0,'Total':other_count})

        elif tool == "Smartcheck":
            tool_bugs = [bugs['bug'] for bugs in smartcheck_bug_codes]
            for bug in tool_bugs:
                fp_count = 0
                excluded = 0
                other_count = 0
                bug_type_threshold = [thr['threshold'] for thr in thresholds if thr['bug']==bug][0]
                for sc in x:
                    type_specific_bugs = [bugs for bugs in coded_reported_non_injected  if  bugs['tool'] == tool and bugs['bugType'] == bug and bugs['contract']==sc]
                    other_bugs= [bugs for bugs in coded_reported_non_injected  if  bugs['tool'] == tool and bugs['bugType'] not in tool_bugs and bugs['contract']==sc]
                    other_count += len(other_bugs)
                    
                    for sbugs in type_specific_bugs:
                        tools_deteced_bug = [bugs for bugs in coded_reported_non_injected  if  bugs['lines'] == sbugs['lines'] and bugs['bugType']== bug and bugs['contract']==sc] 
                        if not len(tools_deteced_bug) >= bug_type_threshold:
                            fp_count +=1                            
                        else:
                            excluded +=1
                
                smartcheck_FPs.append({'BugType':bug,'FalsePositives':fp_count,'ExcludedByMajority':excluded,'Total':(fp_count+excluded)})
            smartcheck_FPs.append({'BugType':'Other','FalsePositives':other_count,'ExcludedByMajority':0,'Total':other_count})

        elif tool == "Slither":
            tool_bugs = [bugs['bug'] for bugs in slither_bug_codes]
            for bug in tool_bugs:
                fp_count = 0
                excluded = 0
                other_count = 0
                bug_type_threshold = [thr['threshold'] for thr in thresholds if thr['bug']==bug][0]
                for sc in x:
                    type_specific_bugs = [bugs for bugs in coded_reported_non_injected  if  bugs['tool'] == tool and bugs['bugType'] == bug and bugs['contract']==sc]
                    other_bugs= [bugs for bugs in coded_reported_non_injected  if  bugs['tool'] == tool and bugs['bugType'] not in tool_bugs and bugs['contract']==sc]
                    other_count += len(other_bugs)
                    
                    for sbugs in type_specific_bugs:
                        tools_deteced_bug = [bugs for bugs in coded_reported_non_injected  if  bugs['lines'] == sbugs['lines'] and bugs['bugType']== bug and bugs['contract']==sc] 
                        if not len(tools_deteced_bug) >= bug_type_threshold:
                            fp_count +=1                            
                        else:
                            excluded +=1
                
                slither_FPs.append({'BugType':bug,'FalsePositives':fp_count,'ExcludedByMajority':excluded,'Total':(fp_count+excluded)})
            slither_FPs.append({'BugType':'Other','FalsePositives':other_count,'ExcludedByMajority':0,'Total':other_count})

        if tool == "Manticore":
            tool_bugs = [bugs['bug'] for bugs in manticore_bug_codes]
            for bug in tool_bugs:
                fp_count = 0
                excluded = 0
                other_count = 0
                bug_type_threshold = [thr['threshold'] for thr in thresholds if thr['bug']==bug][0]
                for sc in x:
                    type_specific_bugs = [bugs for bugs in coded_reported_non_injected  if  bugs['tool'] == tool and bugs['bugType'] == bug and bugs['contract']==sc]
                    other_bugs= [bugs for bugs in coded_reported_non_injected  if  bugs['tool'] == tool and bugs['bugType'] not in tool_bugs and bugs['contract']==sc]
                    other_count += len(other_bugs)
                    
                    for sbugs in type_specific_bugs:
                        tools_deteced_bug = [bugs for bugs in coded_reported_non_injected  if  bugs['lines'] == sbugs['lines'] and bugs['bugType']== bug and bugs['contract']==sc] 
                        if not len(tools_deteced_bug) >= bug_type_threshold:
                            fp_count +=1                            
                        else:
                            excluded +=1
                      
                manticore_FPs.append({'BugType':bug,'FalsePositives':fp_count,'ExcludedByMajority':excluded,'Total':(fp_count+excluded)})
            manticore_FPs.append({'BugType':'Other','FalsePositives':other_count,'ExcludedByMajority':0,'Total':other_count})

    #Export False positive results 
    csv_columns =  ['BugType','FalsePositives','ExcludedByMajority','Total']
    for tool in tools:
        csv_file = os.path.join("FPs/"+tool+"_FPs.csv")
        try:
            with open(csv_file, 'w') as csvfile:
                writer = csv.DictWriter(csvfile, fieldnames=csv_columns)
                writer.writeheader()
                if tool =="Oyente":
                    for data in oyente_FPs:
                        writer.writerow(data)
                elif tool =="Securify":
                    for data in securify_FPs:
                        writer.writerow(data)
                elif tool =="Mythril":
                    for data in mythril_FPs:
                        writer.writerow(data)
                elif tool =="Smartcheck":
                    for data in smartcheck_FPs:
                        writer.writerow(data)
                elif tool =="Slither":
                    for data in slither_FPs:
                        writer.writerow(data)
                elif tool =="Manticore":
                    for data in manticore_FPs:
                        writer.writerow(data)
            print ("\n************************** "+tool +" False Positives *******************\n")        
            df = pandas.read_csv(csv_file)
            print(df)
        except IOError:
            print("I/O error")



def get_bug_type(bug_info):
    if bug_info['tool'] == "Oyente":
        tool_bugs = [bugs['bug'] for bugs in oyente_bug_codes]
        for bugType in tool_bugs:
            bug_codes = [codes['codes'] for codes in oyente_bug_codes if  codes['bug'] == bugType]
            if bug_info['bugType'] in bug_codes[0]:
                return bugType
            
        return bug_info['bugType'] 

    elif bug_info['tool'] == "Securify":
        tool_bugs = [bugs['bug'] for bugs in securify_bug_codes]
        for bugType in tool_bugs:
            bug_codes = [codes['codes'] for codes in securify_bug_codes if  codes['bug'] == bugType]
            if bug_info['bugType'] in bug_codes[0]:
                return bugType
            
        return bug_info['bugType'] 
    
    elif bug_info['tool'] == "Mythril":
        tool_bugs = [bugs['bug'] for bugs in mythril_bug_codes]
        for bugType in tool_bugs:
            bug_codes = [codes['codes'] for codes in mythril_bug_codes if  codes['bug'] == bugType]
            if bug_info['bugType'] in bug_codes[0]:
                return bugType
            
        return bug_info['bugType'] 
   
    elif bug_info['tool'] == "Smartcheck":
        tool_bugs = [bugs['bug'] for bugs in smartcheck_bug_codes]
        for bugType in tool_bugs:
            bug_codes = [codes['codes'] for codes in smartcheck_bug_codes if  codes['bug'] == bugType]
            if bug_info['bugType'] in bug_codes[0]:
                return bugType
            
        return bug_info['bugType'] 
            
    elif bug_info['tool'] == "Slither":
        tool_bugs = [bugs['bug'] for bugs in slither_bug_codes]
        for bugType in tool_bugs:
            bug_codes = [codes['codes'] for codes in slither_bug_codes if  codes['bug'] == bugType]
            if bug_info['bugType'] in bug_codes[0]:
                return bugType
            
        return bug_info['bugType'] 

    elif bug_info['tool'] == "Manticore":
        tool_bugs = [bugs['bug'] for bugs in manticore_bug_codes]
        for bugType in tool_bugs:
            bug_codes = [codes['codes'] for codes in manticore_bug_codes if  codes['bug'] == bugType]
            if bug_info['bugType'] in bug_codes[0]:
                return bugType
            
        return bug_info['bugType'] 

def extract_detected_bug(result_file, bug_info, tool, contract):
    global reported_bugs

    if tool == "Securify":
        bugLine =int(re.findall(r'\(([^()]+)\)',inject_file.get_snippet_at_line(result_file,inject_file.get_line_at_offset(result_file,bug_info['eoffset'])))[0])
        bugType = re.findall(r'(?<= for )(.*)(?= in )',inject_file.get_snippet_at_line(result_file,bug_info['line']))[0]
        
        reported_bugs.append({'tool':tool,'lines':bugLine,'bugType':bugType,'contract':contract})


    elif tool == "Mythril":
        try:
            bugLine =int(re.findall(r'sol:(\d+)',inject_file.get_snippet_at_line(result_file,inject_file.get_line_at_offset(result_file,bug_info['eoffset'])+1))[0])
            bugType = re.findall(r'(?<== )(.*)(?= =)',inject_file.get_snippet_at_line(result_file,int(bug_info['line'])))[0]
            reported_bugs.append({'tool':tool,'lines':bugLine,'bugType':bugType,'contract':contract})
        except IndexError:
            return


    elif tool == "Smartcheck":
        bugLine =int(re.findall(r'line:\s(\d+)',inject_file.get_snippet_at_line(result_file,inject_file.get_line_at_offset(result_file,bug_info['eoffset'])))[0])
        bugType = re.findall(r'(?<=ruleId:\s)(.*)',inject_file.get_snippet_at_line(result_file,int(bug_info['line'])))[0]
        reported_bugs.append({'tool':tool,'lines':bugLine,'bugType':bugType,'contract':contract})

    elif tool == "Oyente":
        bugLine =int(re.findall(r'sol:(\d+)',inject_file.get_snippet_at_line(result_file,inject_file.get_line_at_offset(result_file,bug_info['eoffset'])))[0])

        s= inject_file.get_snippet_at_line(result_file,int(bug_info['line']))[0:85]
        bugType = re.findall(r'(?<=Warning: )(.*)(?=\.\\)',s)[0]
        reported_bugs.append({'tool':tool,'lines':bugLine,'bugType':bugType,'contract':contract})
    
    elif tool == "Manticore":
        bugLine =int(re.findall(r'[0-9]*\s\s\s*',inject_file.get_snippet_at_line(result_file,inject_file.get_line_at_offset(result_file,bug_info['eoffset'])))[1])
        bugType = re.findall(r'(?<=-)(.*)(?= -)',inject_file.get_snippet_at_line(result_file,int(bug_info['line'])))[0].strip()
        reported_bugs.append({'tool':tool,'lines':bugLine,'bugType':bugType,'contract':contract})

    

def get_all_childs(file):
    all_childs = []
    descs= extract_values(file, 'description')
    types = extract_values(file, 'check')
    
    for i in range(0, len(descs)):
        all_childs.append({"type":types[i],"desc":descs[i]})
   
    #print (all_childs)
    return all_childs

def extract_values(obj, key):
    #""Pull all values of specified key""
    arr = []
    results = extract(obj, arr, key)
    return results 

def extract(obj, arr, key):
    #""Recursively search for values of key""
    if isinstance(obj, dict):
        for k, v in obj.items():
            if isinstance(v, (dict, list)):
                extract(v, arr, key)
            elif k == key:
                for k1, v1 in obj.items():
                    if k1 in ('description','check'):
                        arr.append(v)
    elif isinstance(obj, list):
        for item in obj:
            extract(item, arr, key)
    return arr

if __name__ == "__main__":
    if 1 != len(sys.argv):
        if sys.argv[1] in ('--help', '-h'):
            printUsage(sys.argv[0])
                
        tools= sys.argv[1].split(',')
        if 3 == len(sys.argv):
            main_dir = sys.argv[2]
        Inspect_results(tools)

    else:
        print("wrong number of parameters")


