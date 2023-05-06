//SPDX-License-Identifier: GPL-3.0

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";

pragma solidity ^0.8.0;

 
contract ERC20Token is ERC20, ERC20Burnable, Pausable, Ownable {
    constructor() ERC20("Token Name", "TKN") {}

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function mint(address to, uint256 amount) public onlyOwner{
        uint256 totalSupply = totalSupply();
        uint256 ownerBalance = balanceOf(to);
    
        require(totalSupply + amount > totalSupply);
        require(ownerBalance + amount > ownerBalance);
        
        _mint(to, amount);
    }

    function burn(uint256 amount) public override onlyOwner {
        uint256 totalSupply = totalSupply();
        require(totalSupply + amount >= totalSupply);

        _burn(msg.sender, amount);
    }

    function isOwner(address who) public view virtual returns (bool) {
        return owner() == who;
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal
        whenNotPaused
        override
    {
        super._beforeTokenTransfer(from, to, amount);
    }
}