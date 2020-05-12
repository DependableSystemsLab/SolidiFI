    mapping(address => uint) balances_re_ent15;
    function withdraw_balances_re_ent15 () public {
       if (msg.sender.send(balances_re_ent15[msg.sender ]))
          balances_re_ent15[msg.sender] = 0;
      }	
