pragma solidity ^0.5.0;

import "./oraclizeAPI.sol";

contract Swarm is usingOraclize {
    
    string public swarmContent;
    
    event LogNewOraclizeQuery(string description);
    event LogNewSwarmContent(string swarmContent);

    constructor() public {
        update(); // Update price on contract creation...
    }
    
    function __callback(bytes32 myid, string memory result) public {
        require(msg.sender == oraclize_cbAddress());
        swarmContent = result;
        emit LogNewSwarmContent(result);
        // Do something with the swarm content...
    }
    
    function update() public payable {
        emit LogNewOraclizeQuery("Oraclize query was sent, standing by for the answer...");
        oraclize_query("swarm", "1dad37bcc272aa31d45128992be575820bececb13dd42c4cc87e4b6269067464");
    }
    
} 