// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract AskToken is ERC20 {
    constructor() ERC20("Askol Token", "ASK") {
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }
}
