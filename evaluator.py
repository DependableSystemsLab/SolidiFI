#!/usr/bin/python3

import matplotlib.pyplot as plt
import numpy as np
import matplotlib as mpl
import solidifi
import inspection
import os,sys
import shutil, glob


#tools = ["Oyente", "Securify", "Mythril", "Smartcheck", "Manticore","Slither"]
tools = []
bug_types = [
{'tool':'Oyente','bugs':['Re-entrancy','Timestamp-Dependency','Unhandled-Exceptions','TOD','Overflow-Underflow']},
{'tool':'Securify','bugs':['Re-entrancy','Unchecked-Send','Unhandled-Exceptions','TOD']},
{'tool':'Mythril','bugs':['Re-entrancy','Timestamp-Dependency','Unchecked-Send','Unhandled-Exceptions','Overflow-Underflow','tx.origin']},
{'tool':'Smartcheck','bugs':['Re-entrancy','Timestamp-Dependency','Unhandled-Exceptions','Overflow-Underflow','tx.origin']},
{'tool':'Manticore','bugs':['Re-entrancy','Overflow-Underflow']},
{'tool':'Slither','bugs':['Re-entrancy','Timestamp-Dependency','Unhandled-Exceptions','tx.origin']}]


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

def evaluate_tools():
    # Contracts
    x = [ i for i in range(1,51)]

    if os.path.isdir("buggy"):
        shutil.rmtree("buggy")

    #inject bug types in all contracts for each tool
    for tool in tools:    
        for cs in x:
            tool_bugs = [bugs['bugs'] for bugs in bug_types if  bugs['tool'] == tool]
            for bug_type in tool_bugs[0]:
                time = solidifi.interior_main("-i" ,"contracts/"+str(cs)+".sol" ,bug_type)

        tool_main_dir = os.path.join("tool_results",tool)
        tool_buggy_sc = os.path.join(tool_main_dir,"analyzed_buggy_contracts")
        os.system("rm -rf {0}".format(tool_buggy_sc))
        os.makedirs(tool_buggy_sc,exist_ok=True)
        mv_cmd = "mv buggy/* {0}".format(tool_buggy_sc)
        os.system(mv_cmd)
        
    #check the generated buggy contracts 
    for tool in tools:
    
        tool_main_dir = os.path.join("tool_results",tool)
        tool_buggy_sc = os.path.join(tool_main_dir,"analyzed_buggy_contracts")
        tool_bugs = [bugs['bugs'] for bugs in bug_types if  bugs['tool'] == tool]

        for bug_type in tool_bugs[0]:
            tool_results = os.path.join(tool_buggy_sc,bug_type)
            tool_result_per_bug = os.path.join(tool_results,"results")
            os.makedirs(tool_result_per_bug, exist_ok=True)
            injected_scs = os.path.join(tool_buggy_sc,bug_type)
    
            for buggy_sc in glob.glob(injected_scs+"/*.sol"): 
                head, tail = os.path.split(buggy_sc)
                result_file = tool_result_per_bug+"/"+tail+".txt"
                if tool in ("Slither","Oyente"):
                    result_file = tool_result_per_bug+"/"+tail+".json"

                if tool =='Oyente':
                    #Oyente command 
                    tool_cmd ="docker run -i -t -v {0} luongnguyen/oyente bash -c \" cd oyente ; python oyente.py -ce -j -s ../contracts/{1} \" >{2} ".format(os.path.join(os.getcwd(), injected_scs)+":/oyente/contracts",tail,result_file) 
                    os.system(tool_cmd)
    
                elif tool == 'Securify':
                
                    #Securify command 
                    tool_cmd = "timeout 900 java -jar /securify/build/libs/securify.jar -fs {0} > {1}".format(buggy_sc,result_file)
                    os.system(tool_cmd)
    
                elif tool == 'Mythril':
                    #Mythril command        
                    tool_cmd = "myth  analyze {0} --execution-timeout 900 > {1}".format(buggy_sc,result_file)                
                    os.system(tool_cmd)
    
                elif tool == 'Smartcheck':
                    #Smartcheck command                 
                    #""If you are using nmp installation""
                    tool_cmd = "smartcheck -p {0} > {1}".format(buggy_sc,result_file)
                    os.system(tool_cmd)                                
    
                elif tool =='Manticore':
                    cs_names = [names['names'] for names in contract_names_per_file if names['file'] == tail]
    
                    for cs_name in cs_names[0]:
                        result_file = tool_result_per_bug+"/"+tail[0:len(tail)-4]+"."+cs_name+".txt"
                        #Manticore command                                        
                        tool_cmd = "manticore --workspace /tmp/manticore --core.timeout 900 --evm.sha3timeout 60 --smt.timeout 60 --core.mprocessing threading --smt.memory 4000 --contract {0} {1}".format(cs_name,buggy_sc)
                        os.system(tool_cmd)
                        workspace= '/tmp/manticore'
                        src_file = os.path.join(workspace,'global.findings')
                        if os.path.isfile(src_file):
                            cp_cmd = "cp {0} {1}".format(src_file,result_file)
                            os.system(cp_cmd)
                            rm_cmd ="rm -rf {0}".format(workspace)
                            os.system(rm_cmd)
                                            
                elif tool == 'Slither':
                    #Slither command                 
                    tool_cmd = "slither  {0} --json {1}".format(buggy_sc,result_file)
                    os.system(tool_cmd)

                """
                To evaluate other tools, add the command to run each tool in this area using the 3-line code pattern as below. 
                You just need to replace values surrounded by <>

                elif tool == '<ToolName>':              
                    tool_cmd = "<command to run the tool>"
                    os.system(tool_cmd)
                """


if __name__ == "__main__":
    if 1 != len(sys.argv):
        if sys.argv[1] in ('--help', '-h'):
            printUsage(sys.argv[0])
                
        tools= sys.argv[1].split(',')
        evaluate_tools()
        inspection.Inspect_results(tools)
        
    else:
        print("wrong number of parameters")