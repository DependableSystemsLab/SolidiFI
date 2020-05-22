# SolidiFI
SolidiFI is an automated and systematic framework for evaluating smart contracts' static analysis tools

For more details about SolidiFI, please reference the paper  [How Effective are Smart Contract Analysis Tools? Evaluating Smart Contract Static Analysis Tools Using Bug Injection](https://github.com/DependableSystemsLab/SolidiFI)

If you use SolidiFI, please cite this paper

 ```
 [To-do]
 Put citation code here
  ```
## Quick Start
 A docker container with required dependencies is available for easy use of SolidiFI. 
 
  To download and open the container, run the following two commands (WARNING: This can take some time.)
    
  ```
   sudo docker pull asemg/solidifi
   sudo docker run -i -t asemg/solidifi
  ```
  
 ## Installing Dependencies
 
 SolidiFI requires Python 3.6+.
 
 To use SolidiFI from your machine, please run the following command to install depedencies required for SolidiFI to work properly.
 
   ```
    pip install -r requirements.txt
   ```
 
## Using SolidiFI to Inject Bugs into a Smart Contract
 SolidiFI can be used to inject bugs into a contract as follows 
   
  ```
   python3 solidify.py -i <Path-to-contract-source-file> <Bug-type>
  ```
  For the Bug-type parameter, it can be one of the following
	[Re-entrancy, Timestamp-Dependency, Unchecked-Send, Unhandled-Exceptions, TOD, Overflow-Underflow, tx.origin]
  
   For example to inject Timestamp Dependency bugs into /solidifi/contracts/1.sol smart contract 
  
  ```
  python3 solidifi.py -i /solidifi/contracts/1.sol Timestamp-Dependency
  ```
    
  The generated buggy contract along with the injection log will be stored under the "buggy/Timestamp-Dependency" folder.
  
  ## Tools Evaluation Using SolidiFI 
   
   In case you want to to evaluate the analysis tools mentioned in the paper from scratch. You can run  evaluator.py.
   
   This script will inject bugs of the different 7 bug types in the 50 contracts dataset. Then it will scan 
   the generated buggy contracts using the six analysis tools being evaluated, and finally, inspect the generated reports
   by the tools for false negatives and false positives.
   
   ```
   python3 evaluator.py Oyente,Securify,Mythril,Smartcheck,Manticore,Slither
   ``` 
  
