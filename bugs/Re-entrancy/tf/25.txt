mapping(address => uint) redeemableEther_re_ent25;
function claimReward_re_ent25() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent25[msg.sender] > 0);
        uint transferValue_re_ent25 = redeemableEther_re_ent25[msg.sender];
        msg.sender.transfer(transferValue_re_ent25);   //bug
        redeemableEther_re_ent25[msg.sender] = 0;
    }
